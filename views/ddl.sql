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


select user_id_, sum(case when check_in_ then 1 else 0 end) as check_ins
from ticket_ 
join user_book_ticket_ 
on user_book_ticket_.ticket_id_ = ticket_.id
group by user_id_;

