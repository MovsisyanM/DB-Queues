drop table if exists field_, ticket_, user_, profile_, interval_, branch_, service_type_, employee_, company_, ticket_log_, ticket_status_, schedule_;

-- Tickets entity:
-- (#2) https://github.com/MovsisyanM/DB-Queues/issues/2

create table ticket_ (
    id serial primary key,
    target_day_ timestamp not null,
    check_in_ boolean not null default false,
    last_change_date_ timestamp default current_timestamp,
    created_date_ timestamp default current_timestamp not null,
    service_type_id_ int references service_type_(id) not null,
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

-- Interval entity:
-- (#28) https://github.com/MovsisyanM/DB-Queues/issues/28

create table interval_ (
    id serial primary key,
    weekday_ varchar(9),
    start_hour_ timestamp not null,
    end_hour_ timestamp not null
);


-- Company entity:
-- (#6)

create table company_ (
    id serial primary key,
    name_ varchar(50) not null,
    email_ varchar(50) not null,
    phone_ varchar(20) not null,
    address_ varchar(50) not null,
    start_of_coop_ timestamp default current_timestamp,
    field varchar(50) not null
);


-- Branch entity:
-- (#3) https://github.com/MovsisyanM/DB-Queues/issues/3

create table branch_ (
    id serial primary key,
    name_ varchar(50) not null,
    email_ varchar(50),
    phone_ varchar(20),
    address_ varchar(50) not null,
    company_id_ int references company_(id)
);


-- Service_Type entity:
-- (#4)

create table service_type_ (
    id serial primary key,
    name_ varchar(50) not null,
    description_ varchar(199) not null
);


-- Employee entity:
-- (#5)

create table employee_ (
    id serial primary key,
    first_name_ varchar(50) not null,
    last_name_ varchar(50) not null,
    email_ varchar(50) not null,
    phone_ varchar(20) not null,
    position_ varchar(30) not null
);



-- Ticket_Status entity:
-- (#8)

create table ticket_status_ (
    id serial primary key,
    name_ varchar(50) not null,
    description_ varchar(100) not null
);


-- Ticket_Log entity:
-- (#9)

create table ticket_log_ (
    id serial primary key,
    change_date_ timestamp default current_timestamp,
    ticket_id_ int references ticket_(id),
    status_id_ int references ticket_status_(id),
    served_by_ int references employee_(id)
);


-- Schedule entity:
-- (#10)

create table schedule_ (
    id serial primary key,
    start_ timestamp not null,
    end_ timestamp not null
);


-- Field entity:
-- (#7)

create table field_(
    id serial primary key,
    name_ varchar(50) not null,
    description_ varchar(100)
);
)
