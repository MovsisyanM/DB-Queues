drop view if exists Most_used_languages cascade;

create or replace view Most_used_languages as (
    select language_ as language, 
        count(*) as users
    from profile_
    group by language_
    order by users desc
);

select * from Most_used_languages;


drop view if exists Most_visited_branches cascade;

create or replace view Most_visited_branches as (
    select branch_id_ as branch, 
        count(ticket_id_) as visits 
    from ticket_located_in_branch_
    group by branch_id_
    order by visits desc
);

select * from Most_visited_branches;


drop view if exists User_check_in_rate cascade;


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
    where ticket_id_ not in (select ticket_id_ from ticket_ where status_id_ = 3)
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
    left join ticket_log_
        on ticket_log_.ticket_id_ = Ticket_wait_time.ticket_id_
    where not ticket_log_.status_id_ = 3
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

drop view if exists Most_used_languages_proportion cascade;

create or replace view Most_used_languages_proportion as (
    select language, round(cast(users as decimal(7,2)) / cast(n as decimal(7,2)) * 100.0) as percent
    from Most_used_languages, (select count(*) n from profile_) as total
);

select * from Most_used_languages_proportion;

drop view if exists Tickets_served_a_day cascade;

create or replace view Tickets_served_a_day as (
    select extract(day from activated_time_) as day, count(*) 
    from ticket_ 
    where check_in_ = true
    group by day
);

select * from Tickets_served_a_day;



drop view if exists Tickets_served_a_week cascade;

create or replace view Tickets_served_a_week as (
    select extract(week from activated_time_) as week, count(*) 
    from ticket_ 
    where check_in_ = true
    group by week
);

select * from Tickets_served_a_week;



drop view if exists Tickets_served_a_month cascade;

create or replace view Tickets_served_a_month as (
    select extract(month from activated_time_) as month, count(*) 
    from ticket_ 
    where check_in_ = true
    group by month
);

select * from Tickets_served_a_month;


drop view if exists Tickets_served_a_year cascade;

create or replace view Tickets_served_a_year as (
    select extract(year from activated_time_) as year, count(*) 
    from ticket_ 
    where check_in_ = true
    group by year
);

select * from Tickets_served_a_year;



drop view if exists Tickets_served_an_hour cascade;

create or replace view Tickets_served_an_hour as (
    select extract(hour from activated_time_) as hour, count(*) 
    from ticket_ 
    where check_in_ = true
    group by hour
);

select * from Tickets_served_an_hour;


drop view if exists Tickets_served_a_date cascade;

create or replace view Tickets_served_a_date as (
    select extract(year from activated_time_) as year, 
        extract(month from activated_time_) as month,
        extract(day from activated_time_) as day,
        count(*) 
    from ticket_ 
    where check_in_ = true
    group by year, month, day
);

select * from Tickets_served_a_date;

drop view if exists Tickets_served cascade;

create or replace view Tickets_served as (
    select count(*) 
    from ticket_
    where check_in_ = true
);

select * from Tickets_served;

drop view if exists Top_companies_by_tickets_served;

create or replace view Top_companies_by_tickets_served as (
    select company_id_ as company_id,
        count(*) as tickets_booked
    from ticket_located_in_branch_
    left join branch_ 
        on branch_.id = ticket_located_in_branch_.branch_id_
    left join ticket_
        on ticket_.id = ticket_located_in_branch_.ticket_id_
    where ticket_.check_in_ = true
    group by company_id
    order by tickets_booked desc
);

select * from Top_companies_by_tickets_served;

drop view if exists Avg_wait_time_by_branch;

create or replace view Avg_wait_time_by_branch as (
    select branch_id_ as branch_id,
        avg(diff) as avg_wait_time
    from Ticket_wait_time
    left join ticket_located_in_branch_
        on ticket_located_in_branch_.ticket_id_ = Ticket_wait_time.ticket_id_
    left join ticket_log_
        on ticket_log_.ticket_id_ = Ticket_wait_time.ticket_id_
    where not ticket_log_.status_id_ = 3
    group by branch_id_
);

select * from Avg_wait_time_by_branch;

drop view if exists Employees_in_company;

create or replace view Employees_in_company as (
    select company_id, count(*) 
    from (select distinct employee_id_, company_id_ as company_id from Employee_works_at_company) a
    group by company_id
);

select * from Employees_in_company;

drop view if exists Employees_in_branch_company;

create or replace view Employees_in_branch_company
as (
    select company_id, branch_id, count(*) 
    from (
        select distinct e.employee_id_, 
            company_id_ as company_id,
            branch_id_ as branch_id
        from Employee_works_at_company e
        left join employee_works_at_ b
            on e.employee_id_ = b.employee_id_) a
    group by company_id, branch_id
);

select * from Employees_in_branch_company;

drop view if exists Branches_in_company;

create or replace view Branches_in_company as (
    select company_id_ as company_id, count(*)
    from branch_
    group by company_id
);

select * from Branches_in_company;

drop view if exists Tickets_per_employee_per_company;

create or replace view Tickets_per_employee_per_company as (
    select distinct employee_id_ as employee_id, 
        company_id_ as company_id, 
        tickets_served
    from Employee_stats
    left join Employee_works_at_company
        on Employee_stats.employee_id = Employee_works_at_company.employee_id_
    order by tickets_served desc, company_id
);

select * from Tickets_per_employee_per_company;



select * from Ticket_miss_rate_by_user;

drop view if exists Ticket_miss_rate_by_branch;

create or replace view Ticket_miss_rate_by_branch as (
    select branch_id_ as branch, 
        count(ticket_log_.ticket_id_) as missed_tickets 
    from ticket_located_in_branch_
    left join ticket_log_
        on ticket_log_.ticket_id_ = ticket_located_in_branch_.ticket_id_
    where ticket_log_.status_id_ = 3
    group by branch_id_
    order by missed_tickets desc
);

select * from Ticket_miss_rate_by_branch;

drop view if exists Ticket_miss_rate_by_user;

create or replace view Ticket_miss_rate_by_user as (
    select user_id_ as user, 
        count(ticket_log_.ticket_id_) as missed_tickets 
    from user_book_ticket_
    left join ticket_log_
        on ticket_log_.ticket_id_ = user_book_ticket_.ticket_id_
    where ticket_log_.status_id_ = 3
    group by user_id_
    order by missed_tickets desc
);

select * from Ticket_miss_rate_by_user;

