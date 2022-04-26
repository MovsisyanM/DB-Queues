drop table if exists ticket;

-- Tickets entity:
-- https://github.com/MovsisyanM/DB-Queues/issues/2

create table ticket (
    id serial primary key,
    created_date timestamp default current_timestamp not null,
    target_day timestamp not null,
    check_in boolean not null default false,
    last_change_date timestamp default current_timestamp,
    activated_time timestamp
);


drop table if exists user_;

-- User entity:
-- https://github.com/MovsisyanM/DB-Queues/issues/1

create table user_ (
    id serial primary key,
    first_name varchar(100) not null,
    last_name varchar(100) not null,
    email varchar(100) not null,
    joined_since timestamp default current_timestamp
)

