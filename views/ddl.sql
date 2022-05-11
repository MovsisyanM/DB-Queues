drop view if exists Most_used_languages;

create or replace view Most_used_languages as (
    select language_, count(*) as users
    from profile_
    group by language_
    order by users desc
);

select * from Most_used_languages;