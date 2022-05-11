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

drop view if exists User_avg_late;

create or replace view User_avg_late as (
    select user_id_, 
        avg(activated_time_ - target_day_) as diff
    from user_book_ticket_ u
    join ticket_ t on t.id = u.ticket_id_
    where check_in_ = true
    group by user_id_
);

select * from User_avg_late;

drop view if exists Employee_avg_service_time;

create or replace view Employee_avg_service_time as (
    select t.served_by_ as employee_id, 
        avg(t.diff) as avg_service_time
    from (
        select ticket_id_, 
            served_by_, 
            max(change_date_) - min(change_date_) as diff
        from ticket_log_
        group by ticket_id_, served_by_) t
    group by t.served_by_
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

