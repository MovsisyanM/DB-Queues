drop table if exists ticket;

-- Tickets entity:
-- https://github.com/MovsisyanM/DB-Queues/issues/2

create table ticket (
    id int primary key,
    created_date timestamp default current_timestamp not null,
    target_day timestamp not null,
    check_in boolean not null default false,
    last_change_date timestamp default current_timestamp,
    activated_time timestamp
);