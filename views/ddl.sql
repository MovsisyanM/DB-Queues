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




