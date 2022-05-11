drop view if exists Most_used_languages;

create or replace view Most_used_languages as (
    select language_, count(*) as users
    from profile_
    group by language_
    order by users desc
);

select * from Most_used_languages;


drop view if exists Most_visited_branches;

create or replace view Most_visited_branches as (
    select branch_id_ as branch, 
        count(ticket_id_) as visits 
    from ticket_located_in_branch_
    group by branch_id_
    order by visits desc
);

select * from Most_visited_branches;


drop view if exists Ticket_miss_rate_by_user;

create or replace view Ticket_miss_rate_by_user as (
    select branch_id_ as branch, 
        count(ticket_id_) as visits 
    from ticket_located_in_branch_
    group by branch_id_
    order by visits desc
);

select * from Ticket_miss_rate_by_user;


drop view if exists User_check_in_rate;


create or replace view User_check_in_rate as (
    select user_id_, sum(case when check_in_ then 1 else 0 end) as check_ins
    from ticket_ 
    join user_book_ticket_ 
    on user_book_ticket_.ticket_id_ = ticket_.id
    group by user_id_
);

select * from User_check_in_rate;

drop view if exists User_avg_late cascade;

create or replace view User_avg_late as (
    select user_id_, 
        avg(activated_time_ - target_day_) as diff
    from user_book_ticket_ u
    join ticket_ t on t.id = u.ticket_id_
    where check_in_ = true
    group by user_id_
);

select * from User_avg_late;

drop view if exists Ticket_wait_time cascade;

create or replace view Ticket_wait_time as (
    select ticket_id_, 
        served_by_, 
        max(change_date_) - min(change_date_) as diff
    from ticket_log_
    group by ticket_id_, served_by_
);

select * from Ticket_wait_time;

drop view if exists Employee_stats cascade;

create or replace view Employee_stats as (
    select served_by_ as employee_id, 
        avg(diff) as avg_service_time,
        count(ticket_id_) as tickets_served
    from Ticket_wait_time
    group by served_by_
);

drop view if exists Employee_avg_service_time cascade;

create or replace view Employee_avg_service_time as (
    select employee_id, avg_service_time from Employee_stats
);

select * from Employee_avg_service_time;

drop view if exists Top_companies_by_tickets_booked;

create or replace view Top_companies_by_tickets_booked as (
    select company_id_ as company_id,
        count(*) as tickets_booked
    from ticket_located_in_branch_
    left join branch_ 
        on branch_.id = ticket_located_in_branch_.branch_id_
    group by company_id
    order by tickets_booked desc
);

select * from Top_companies_by_tickets_booked;

drop view if exists Employee_avg_service_time cascade;

create or replace view Employee_avg_service_time as (
    select employee_id, avg_service_time from Employee_stats
);

select * from Employee_avg_service_time;

drop view if exists Company_avg_service_time cascade;

create or replace view Company_avg_service_time as (
    select company_id_, avg(diff) as avg_service_time
    from Ticket_wait_time
    left join ticket_located_in_branch_
        on ticket_located_in_branch_.ticket_id_ = Ticket_wait_time.ticket_id_
    left join branch_
        on branch_.id = ticket_located_in_branch_.branch_id_
    group by company_id_
);

select * from Company_avg_service_time;

drop view if exists Employee_works_at_company cascade;

create or replace view Employee_works_at_company as (
    select employee_id_, schedule_id_, company_id_ from employee_works_at_
    left join branch_
        on branch_.id = employee_works_at_.branch_id_
);

select * from Employee_works_at_company;

drop view if exists Company_work_stats cascade;

create or replace view Company_work_stats as (
    select company_id_ as company_id, 
        extract(week from start_) as days_worked_per_week, 
        avg(end_ - start_) as avg_per_day
    from Employee_works_at_company
    left join schedule_
        on schedule_.id = Employee_works_at_company.schedule_id_
    group by company_id, days_worked_per_week
);

select * from Company_work_stats;

drop view if exists Company_avg_weekly_work_per_employee cascade;

create or replace view Company_avg_weekly_work_per_employee as (
    select company_id, 
        days_worked_per_week * avg_per_day as avg_per_week
    from Company_work_stats
);

select * from Company_avg_weekly_work_per_employee;

drop view if exists Users_per_week cascade;

create or replace view Users_per_week as (
    select extract(week from joined_since_) as week, count(*) as users
    from user_
    group by week
);

select * from Users_per_week;

drop view if exists Users_per_month cascade;

create or replace view Users_per_month as (
    select extract(month from joined_since_) as month, count(*) as users
    from user_
    group by month
);

select * from Users_per_month;

drop view if exists Users_per_year cascade;

create or replace view Users_per_year as (
    select extract(year from joined_since_) as year, count(*) as users
    from user_
    group by year
);

select * from Users_per_year;

