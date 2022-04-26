drop table if exists ticket user_, profile_;

-- Tickets entity:
-- (#2) https://github.com/MovsisyanM/DB-Queues/issues/2

create table ticket_ (
    id serial primary key,
    created_date_ timestamp default current_timestamp not null,
    target_day_ timestamp not null,
    check_in_ boolean not null default false,
    last_change_date_ timestamp default current_timestamp,
    activated_time_ timestamp
);


-- User entity:
-- (#1) https://github.com/MovsisyanM/DB-Queues/issues/1

create table user_ (
    id serial primary key,
    first_name_ varchar(100) not null,
    last_name_ varchar(100) not null,
    email_ varchar(100) not null,
    joined_since_ timestamp default current_timestamp
);

-- Profile entity:
-- (#27) https://github.com/MovsisyanM/DB-Queues/issues/27

create table profile_ (
    id serial primary key,
    location_ varchar(50),
    timezone_ varchar(50),
    language_ varchar(20),
    user_id_ int references user_(id)
);



