drop table if exists field_, ticket_, user_, profile_, interval_, branch_, service_type_, employee_, company_, ticket_log_, ticket_status_, schedule_ cascade;

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
    start_hour_ time not null,
    end_hour_ time not null
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
    field_ varchar(50) not null
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



-- Inserting data into #1 User entity:
truncate table user_ cascade;

insert into user_ (id, first_name_, last_name_, email_) 
values (0, 'Bob', 'Builderian', 'builderian@queues.db'),
    (1, 'John', 'Doe', 'doe@queues.db'),
    (2, 'Bill', 'Fisher', 'fisher@queues.db'),
    (3, 'Papa', 'Juan', 'juan@queues.db'),
    (4, 'Senior', 'Pepper', 'pepper@queues.db'),
    (5, 'Marlin', 'Manrole', 'manrole@queues.db'),
    (6, 'Hose', 'Ignasias', 'ignasias@queues.db'),
    (7, 'Bubert', 'Scarecroyan', 'scarecroyan@queues.db'),
    (8, 'Alice', 'Wonderyan', 'wonderyan@queues.db'),
    (9, 'Addonis', 'Chadyan', 'chadyan@queues.db'),
    (10, 'Guiseppe', 'Verdi', 'verdi@queues.db'),
    (11, 'Student', 'T', 't@queues.db'),
    (12, 'Alberto', 'Einschwein', 'einschwein@queues.db'),
    (13, 'Molly', 'Popyan', 'popyan@queues.db'),
    (14, 'Aziz', 'Shavershian', 'zyzz@queues.db'),
    (15, 'Vahram', 'Papazyan', 'papazyan@queues.db'),
    (16, 'Bill', 'Nye', 'nye@queues.db'),
    (17, 'Pepe', 'Frogyan', 'frogyan@queues.db'),
    (18, 'Doge', 'Coin', 'coin@queues.db');

select * from user_;


truncate table profile_ cascade;

insert into profile_ (location_, timezone_, language_, user_id_) 
values ('Bronson Canyon', '+4', 'Klingon', 1),
    ('The Briar Patch', '+7', 'Klingon', 2),
    ('Yerevan', '+4', 'Armenian', 3),
    ('Vietnam', '+7', 'Camouflage', 4),
    ('Yerevan', '+4', 'Armenian', 5),
    ('Yerevan', '+4', 'Armenian', 6),
    ('Yerevan', '+4', 'Armenian', 7),
    ('Yerevan', '+4', 'Armenian', 8),
    ('Yerevan', '+4', 'Armenian', 9),
    ('Yerevan', '+4', 'Armenian', 10),
    ('CA, Los Angeles, Glendale', '-7', 'Armenian', 11),
    ('CA, Los Angeles, Glendale', '-7', 'English', 12),
    ('CA, Los Angeles, Glendale', '-7', 'English', 13),
    ('CA, Los Angeles, Glendale', '-7', 'English', 14),
    ('CA, Los Angeles, Glendale', '-7', 'English', 15),
    ('CA, Los Angeles, Glendale', '-7', 'English', 16),
    ('CA, Los Angeles, Glendale', '-7', 'English', 17),
    ('CA, Los Angeles, Glendale', '-7', 'English', 18);

select * from profile_;


truncate table interval_ cascade;

insert into interval_ (id, weekday_, start_hour_, end_hour_) 
values (0, 'Monday', '9:00:00', '18:00:00'),
    (1, 'Tuesday', '9:00:00', '18:00:00'),
    (2, 'Wednesday', '9:00:00', '18:00:00'),
    (3, 'Thursday', '9:00:00', '18:00:00'),
    (4, 'Friday', '9:00:00', '18:00:00'),
    (5, 'Saturday', '9:00:00', '18:00:00'),
    (6, 'Sunday', '9:00:00', '18:00:00');

select * from interval_;



truncate table company_ cascade;

insert into company_ (id, name_, email_, phone_, address_, start_of_coop_, field_) 
values (0, 'DataBASS', 'contact@databass.com', '+1-800-DATABASS', '1123 Main St, Los Angeles, CA, 90001', '2019-01-01', 'Data Science'),
    (1, 'Covenant', 'contact@covenant.com', '+1-800-COVENT', '1123 Main St, Dubai', '2020-02-01', 'Space tourism'),
    (2, 'BuildersGuild', 'contact@builders.gld', '+1-800-BUILDERS', '1123 Main St, London', '2020-01-01', 'Construction'),
    (3, 'DestroyersGuild', 'contact@destroyers.gld', '+1-800-DESTROYERS', '1123 Main St, Paris', '2022-01-01', 'Destruction'),
    (4, 'Gugo', 'gugo@mail.am', '+1-800-GUGO', '1123 Main St, Moscow', '2017-01-01', 'Search engine');

select * from company_;



truncate table branch_ cascade;

insert into branch_ (id, name_, email_, phone_, address_, company_id_) 
values (0, 'DataBASS HQ', 'hq@databass.com', '+1-800-DATABASS', '1123 Main St, Los Angeles, CA, 90001', 0),
    (1, 'Covenant HQ', 'hq@covenant.com', '+1-800-COVENT', '1123 Main St, Dubai', 1),
    (2, 'BuildersGuild HQ', 'hq@builders.gld', '+1-800-BUILDERS', '1123 Main St, London', 2),
    (3, 'DestroyersGuild HQ', 'hq@destroyers.gld', '+1-800-DESTROYERS', '1123 Main St, Paris', 3),
    (4, 'Gugo HQ', 'gugo@mail.am', '+1-800-GUGO', '1123 Main St, Moscow', 4),
    (5, 'DataBASS Secondary', 'secondary@databass.com', '+1-800-DATABASS', '3 Secondary St, Los Angeles, CA, 90001', 0);

select * from branch_;


truncate table service_type_ cascade;

insert into service_type_ (id, name_, description_) 
values (0, 'Data Science', 'Data modeling as a service'),
    (1, 'Space tourism', 'Interstellar tourism at near light speeds'),
    (2, 'Construction', 'Building buildings, roads and bridges'),
    (3, 'Destruction', 'Destroying buidlings, roads and bridges'),
    (4, 'Web search', 'Providing answers based on the entirety of human knowledge');

select * from service_type_;

truncate table ticket_ cascade;

insert into ticket_ (id, target_day_, check_in_, created_date_, service_type_id_, activated_time_) 

values (0, '2022-02-01 13:00:00', TRUE, '2022-02-01 12:34:00', 0, '2022-02-01 13:23:30'),
    (1, '2022-02-01 15:30:00', TRUE, '2022-02-01 13:10:00', 3, '2022-02-01 15:44:05'),
    (2, '2022-02-05 09:55:00', TRUE, '2022-02-05 09:00:06', 3, '2022-02-05 10:01:09'),
    (3, '2022-02-05 10:15:00', TRUE, '2022-02-05 09:00:06', 2, '2022-02-05 10:15:00'),
    (4, '2022-02-07 11:15:00', TRUE, '2022-02-07 09:24:06', 1, '2022-02-07 12:01:09'),
    (5, '2022-02-08 12:00:00', TRUE, '2022-02-08 09:23:08', 4, '2022-02-08 12:06:04'),
    (6, '2022-02-09 12:15:00', TRUE, '2022-02-09 09:28:07', 1, '2022-02-09 12:25:03'),
    (7, '2022-02-09 14:15:00', FALSE, '2022-02-09 10:30:03', 4, NULL),
    (8, '2022-02-19 13:15:00', TRUE, '2022-02-19 12:30:20', 0,  '2022-02-19 13:17:00'),
    (9, '2022-02-20 14:00:00', TRUE, '2022-02-20 09:05:42', 0,  '2022-02-20 13:57:00'),
    (10, '2022-02-21 13:44:00', TRUE,  '2022-02-21 00:34:00', 0, '2022-02-21 13:43:30'),
    (11, '2022-02-24 15:23:00', TRUE,  '2022-02-21 00:10:00', 3, '2022-02-24 15:44:05'),
    (12, '2022-02-25 16:03:00', TRUE,  '2022-02-25 00:00:06', 3, '2022-02-25 16:01:09'),
    (13, '2022-02-25 00:15:00', FALSE, '2022-02-25 00:00:06', 2, NULL),
    (14, '2022-02-27 10:15:00', TRUE,  '2022-02-27 09:24:06', 1, '2022-02-27 10:30:09'),
    (15, '2022-02-28 12:10:00', TRUE,  '2022-02-28 09:23:08', 4, '2022-03-28 12:06:04'),
    (16, '2022-03-29 12:15:00', TRUE,  '2022-03-29 09:28:07', 1, '2022-03-29 12:05:03'),
    (17, '2022-03-29 14:15:00', FALSE, '2022-03-29 11:30:03', 4, NULL),
    (18, '2022-03-29 13:55:00', TRUE,  '2022-03-29 02:30:20', 0, '2022-03-29 14:09:02');
    

select * from ticket_;

truncate table employee_ cascade;

insert into employee_ (id, first_name_, last_name_, email_, phone_, position_) 
values (0, 'Bob', 'Builder', 'bob@builders.gld', '+1-800-BOB', 'Builder'),
    (1, 'Halal', 'Azizyan', 'john@builders.gld', '+1-800-JOHN', 'Builder'),
    (2, 'Karen', 'Destroyer', 'karen@destroyers.gld', '+1-800-KAREN', 'Destroyer'),
    (3, 'Kevin', 'Destroyer', 'kevin@destroyers.gld', '+1-800-KEVIN', 'Destroyer'),
    (4, 'Gugo', 'Srchyan', 'gugo@mail.am', '+1-800-GUGO', 'Web crawler'),
    (5, 'Jane', 'Doe', 'doe@databass.com', '+1-800-DOE', 'Data scientist'),
    (6, 'Mary', 'Jane', 'jane@covenant.com', '+1-800-JANE', 'Space guide');


select * from employee_;

truncate table ticket_status_ cascade;

insert into ticket_status_ (id, name_, description_) 
values (0, 'Called', 'Ticket is Called'),
    (1, 'Closed', 'Ticket is closed'),
    (2, 'In progress', 'Ticket is in progress'),
    (3, 'Missed', 'Ticket is Missed');


select * from ticket_status_;

truncate table ticket_log_ cascade;

insert into ticket_log_ (id, change_date_, ticket_id_, status_id_, served_by_)
values (0, '2022-02-01 13:25:30', 0, 0, 5),
    (1,  '2022-02-01 13:25:40', 0, 2, 5),
    (2,  '2022-02-01 13:35:40', 0, 1, 5),
    (3,  '2022-02-04 15:44:05', 1, 0, 2),
    (4,  '2022-02-04 15:46:05', 1, 2, 2),
    (5,  '2022-02-04 15:56:37', 1, 1, 2),
    (6,  '2022-02-05 10:02:15', 2, 0, 3),
    (7,  '2022-02-05 10:04:15', 2, 2, 3),
    (8,  '2022-02-05 10:25:15', 2, 1, 3),
    (9,  '2022-02-05 10:16:00', 3, 0, 0),
    (10, '2022-02-05 10:17:33', 3, 2, 0),
    (11, '2022-02-05 10:35:00', 3, 1, 0),
    (12, '2022-02-08 12:01:09', 4, 0, 6),
    (13, '2022-02-08 12:05:13', 4, 2, 6),
    (14, '2022-02-08 12:35:13', 4, 1, 6),
    (15, '2022-02-09 12:10:04', 5, 0, 4),
    (16, '2022-02-09 12:10:54', 5, 2, 4),
    (17, '2022-02-09 12:19:54', 5, 1, 4),
    (18, '2022-02-09 12:25:23', 6, 0, 1),
    (19, '2022-02-09 12:26:23', 6, 2, 1),
    (20, '2022-02-09 12:35:23', 6, 1, 1),
    (24, '2022-02-19 13:19:07', 8, 0, 4),
    (25, '2022-02-19 13:19:30', 8, 2, 4),
    (26, '2022-02-19 13:29:30', 8, 1, 4),
    (27, '2022-02-20 14:17:00', 9, 0, 4),
    (28, '2022-02-19 14:27:00', 9, 3, 4),
    (29, '2022-02-21 14:03:00', 10, 0, 6),
    (30, '2022-02-21 14:15:00', 10, 3, 6),
    (31, '2022-02-24 15:26:04', 11, 0, 4),
    (32, '2022-02-24 15:28:54', 11, 2, 4),
    (33, '2022-02-24 15:33:54', 11, 1, 4);


select * from ticket_log_;

truncate table schedule_ cascade;

insert into schedule_ (id, start_, end_)
values (0, '2022-02-01 09:00:00', '2022-02-01 18:00:00'),
    (1, '2022-02-02 09:00:00', '2022-02-02 18:00:00'),
    (2, '2022-02-03 09:00:00', '2022-02-03 18:00:00'),
    (3, '2022-02-04 09:00:00', '2022-02-04 18:00:00'),
    (4, '2022-02-05 09:00:00', '2022-02-05 18:00:00'),
    (5, '2022-02-06 09:00:00', '2022-02-06 18:00:00'),
    (6, '2022-02-07 09:00:00', '2022-02-07 18:00:00'),
    (7, '2022-02-08 09:00:00', '2022-02-08 18:00:00'),
    (8, '2022-02-09 09:00:00', '2022-02-09 18:00:00'),
    (9, '2022-02-10 09:00:00', '2022-02-10 18:00:00'),
    (10, '2022-02-11 09:00:00', '2022-02-11 18:00:00'),
    (11, '2022-02-12 09:00:00', '2022-02-12 18:00:00'),
    (12, '2022-02-13 09:00:00', '2022-02-13 18:00:00'),
    (13, '2022-02-14 09:00:00', '2022-02-14 18:00:00'),
    (14, '2022-02-15 09:00:00', '2022-02-15 18:00:00'),
    (15, '2022-02-16 09:00:00', '2022-02-16 18:00:00'),
    (16, '2022-02-17 09:00:00', '2022-02-17 18:00:00'),
    (17, '2022-02-18 09:00:00', '2022-02-18 18:00:00'),
    (18, '2022-02-19 09:00:00', '2022-02-19 18:00:00'),
    (19, '2022-02-20 09:00:00', '2022-02-20 18:00:00'),
    (20, '2022-02-21 09:00:00', '2022-02-21 18:00:00'),
    (21, '2022-02-22 09:00:00', '2022-02-22 18:00:00'),
    (22, '2022-02-23 09:00:00', '2022-02-23 18:00:00'),
    (23, '2022-02-24 09:00:00', '2022-02-24 18:00:00'),
    (24, '2022-02-25 09:00:00', '2022-02-25 18:00:00'),
    (25, '2022-02-26 09:00:00', '2022-02-26 18:00:00'),
    (26, '2022-02-27 09:00:00', '2022-02-27 18:00:00'),
    (27, '2022-02-28 09:00:00', '2022-02-28 18:00:00'),
    (28, '2022-03-01 09:00:00', '2022-03-01 18:00:00'),
    (29, '2022-03-02 09:00:00', '2022-03-02 18:00:00'),
    (30, '2022-03-03 09:00:00', '2022-03-03 18:00:00');


select * from schedule_;

truncate table field_ cascade;

insert into field_ (id, name_, description_)
values (0, 'Data Science', 'Data modeling as a service'),
    (1, 'Space tourism', 'Interstellar tourism at near light speeds'),
    (2, 'Construction', 'Building buildings, roads and bridges'),
    (3, 'Destruction', 'Destroying buidlings, roads and bridges'),
    (4, 'Web search', 'Providing answers based on the entirety of human knowledge');


select * from field_;



drop table if exists ticket_located_in_branch_, 
    company_provides_service_type_, 
    company_specializes_in_field_, 
    branch_open_interval_, 
    final_status_, 
    user_book_ticket_, 
    employee_works_at_ cascade;

-- final_status relationship:
-- (#12)

create table final_status_ (
    ticket_id_ int references ticket_(id) primary key,
    ticket_log_id_ int references ticket_log_(id)
);


-- user_book_ticket relationship:
-- (#13)

create table user_book_ticket_ (
    ticket_id_ int references ticket_(id) primary key,
    user_id_ int references user_(id)
);


-- employee_works_schedule and employee_is_in_branch relationship:
-- (#17, #18, #20)

create table employee_works_at_ (
    employee_id_ int references employee_(id),
    schedule_id_ int references schedule_(id),
    branch_id_ int references branch_(id),
    primary key (employee_id_, schedule_id_)
);


-- branch_open_interval relationship:
-- (#21)

create table branch_open_interval_ (
    branch_id_ int references branch_(id),
    interval_id_ int references interval_(id),
    primary key (branch_id_, interval_id_)
);


-- ticket_located_in_branch 
-- (#22)

create table ticket_located_in_branch_ (
    ticket_id_ int references ticket_(id) primary key,
    branch_id_ int references branch_(id)
);


-- company_provides_service_type relationship:
-- (#24)

create table company_provides_service_type_ (
    company_id_ int references company_(id),
    service_type_id_ int references service_type_(id),
    primary key (company_id_, service_type_id_)
);


-- company_specializes_in_field 
-- (#25)

create table company_specializes_in_field_ (
    company_id_ int references company_(id),
    field_id_ int references field_(id),
    primary key (company_id_, field_id_)
);



truncate table final_status_ cascade;

insert into final_status_ (ticket_id_, ticket_log_id_)
select tm.ticket_id_, tm.ticket_log_id_
from (
    select t.id as ticket_id_, tl.id as ticket_log_id_, max(tl.change_date_) as mcd, tl.change_date_ as change_date_
    from ticket_ t
    join ticket_log_ tl on t.id = tl.ticket_id_
    where tl.status_id_ = 2
    group by t.id, tl.id) tm
where tm.mcd = tm.change_date_;


select * from final_status_;

truncate table user_book_ticket_ cascade;

insert into user_book_ticket_ (ticket_id_, user_id_)
values (0, 0),
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 5),
    (6, 6),
    (7, 7),
    (8, 8),
    (10, 10),
    (11, 11),
    (12, 12),
    (13, 13),
    (14, 14),
    (15, 1),
    (16, 2),
    (17, 3),
    (18, 4);


select * from user_book_ticket_;

truncate table employee_works_at_ cascade;

insert into employee_works_at_ (employee_id_, schedule_id_, branch_id_)
values (0, 0, 2),
    (1, 0, 2),
    (2, 0, 3),
    (3, 0, 3),
    (4, 0, 4),
    (5, 0, 5),
    (6, 0, 1),
    (0, 1, 2),
    (1, 1, 2),
    (2, 1, 3),
    (3, 1, 3),
    (4, 1, 4),
    (5, 1, 5),
    (6, 1, 1),
    (0, 2, 2),
    (1, 2, 2),
    (2, 2, 3),
    (3, 2, 3),
    (4, 2, 4),
    (5, 2, 5),
    (6, 2, 1),
    (0, 3, 2),
    (1, 3, 2),
    (2, 3, 3),
    (3, 3, 3),
    (4, 3, 4),
    (5, 3, 5),
    (6, 3, 1),
    (0, 4, 2),
    (1, 4, 2),
    (2, 4, 3),
    (3, 4, 3),
    (4, 4, 4),
    (5, 4, 5),
    (6, 4, 1),
    (0, 5, 2),
    (1, 5, 2),
    (2, 5, 3),
    (3, 5, 3),
    (4, 5, 4),
    (5, 5, 5),
    (6, 5, 1),
    (0, 6, 2),
    (1, 6, 2),
    (0, 7, 2),
    (1, 7, 2),
    (0, 8, 2),
    (1, 8, 2),
    (0, 9, 2),
    (1, 9, 2),
    (0, 10, 2),
    (1, 10, 2);


select * from employee_works_at_;

select * from branch_;
select * from interval_;

truncate table branch_open_interval_ cascade;

insert into branch_open_interval_ (branch_id_, interval_id_)
values (0, 0),
    (1, 0),
    (2, 0),
    (3, 0),
    (4, 0),
    (5, 0),
    (0, 1),
    (1, 1),
    (2, 1),
    (3, 1),
    (4, 1),
    (5, 1),
    (0, 2),
    (1, 2),
    (2, 2),
    (3, 2),
    (4, 2),
    (5, 2),
    (0, 3),
    (1, 3),
    (2, 3),
    (3, 3),
    (4, 3),
    (5, 3),
    (0, 4),
    (1, 4),
    (2, 4),
    (3, 4),
    (4, 4),
    (5, 4),
    (2, 5),
    (2, 6);



select * from branch_open_interval_;

truncate table ticket_located_in_branch_ cascade;

insert into ticket_located_in_branch_ (ticket_id_, branch_id_)
select id as ticket_id_, service_type_id_ as branch_id_ from ticket_;


select * from ticket_located_in_branch_;

truncate table company_provides_service_type_ cascade;

insert into company_provides_service_type_ (company_id_, service_type_id_)
values (0, 0),
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4);


select * from company_provides_service_type_;

truncate table company_specializes_in_field_ cascade;

insert into company_specializes_in_field_ (company_id_, field_id_)
values (0, 0),
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4);

select * from company_specializes_in_field_;


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
