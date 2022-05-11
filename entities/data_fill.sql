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

select * from user_

-- /*markdown
-- Inserting data into profiles table...
-- */

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

-- /*markdown
-- Filling the interval table...
-- */

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

-- /*markdown
-- Filling the company table...
-- */

truncate table company_ cascade;

insert into company_ (id, name_, email_, phone_, address_, start_of_coop_, field_) 
values (0, 'DataBASS', 'contact@databass.com', '+1-800-DATABASS', '1123 Main St, Los Angeles, CA, 90001', '2019-01-01', 'Data Science'),
    (1, 'Covenant', 'contact@covenant.com', '+1-800-COVENT', '1123 Main St, Dubai', '2020-02-01', 'Space tourism'),
    (2, 'BuildersGuild', 'contact@builders.gld', '+1-800-BUILDERS', '1123 Main St, London', '2020-01-01', 'Construction'),
    (3, 'DestroyersGuild', 'contact@destroyers.gld', '+1-800-DESTROYERS', '1123 Main St, Paris', '2022-01-01', 'Destruction'),
    (4, 'Gugo', 'gugo@mail.am', '+1-800-GUGO', '1123 Main St, Moscow', '2017-01-01', 'Search engine');

select * from company_;

-- /*markdown
-- Filling the branch table...
-- */

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
values (0, '2022-02-01 13:44:00', TRUE, '2022-02-01 13:34:00', 0, '2022-02-01 13:43:30'),
    (1, '2022-02-04 15:23:00', TRUE, '2022-02-01 13:10:00', 3, '2022-02-01 15:44:05'),
    (2, '2022-02-05 10:03:00', TRUE, '2022-02-05 09:00:06', 3, '2022-02-05 10:01:09'),
    (3, '2022-02-05 10:15:00', FALSE, '2022-02-05 09:00:06', 2, NULL),
    (4, '2022-02-07 11:15:00', TRUE, '2022-02-07 09:24:06', 1, '2022-02-07 12:01:09'),
    (5, '2022-02-08 12:10:00', TRUE, '2022-02-08 09:23:08', 4, '2022-02-08 12:06:04'),
    (6, '2022-02-09 12:15:00', TRUE, '2022-02-09 09:28:07', 1, '2022-02-09 12:05:03'),
    (7, '2022-02-09 14:15:00', FALSE, '2022-02-09 10:30:03', 4, NULL),
    (8, '2022-02-19 13:15:00', TRUE, '2022-02-19 12:30:20', 0,  '2022-02-19 04:09:02'),
    (10, '2022-02-21 03:44:00', TRUE,  '2022-02-21 00:34:00', 0, '2022-02-21 03:43:30'),
    (11, '2022-02-24 05:23:00', TRUE,  '2022-02-21 00:10:00', 3, '2022-02-21 05:44:05'),
    (12, '2022-02-25 00:03:00', TRUE,  '2022-02-25 00:00:06', 3, '2022-02-25 00:01:09'),
    (13, '2022-02-25 00:15:00', FALSE, '2022-02-25 00:00:06', 2, NULL),
    (14, '2022-02-27 01:15:00', TRUE,  '2022-02-27 09:24:06', 1, '2022-02-27 02:01:09'),
    (15, '2022-02-28 02:10:00', TRUE,  '2022-02-28 09:23:08', 4, '2022-03-28 02:06:04'),
    (16, '2022-03-29 02:15:00', TRUE,  '2022-03-29 09:28:07', 1, '2022-03-29 02:05:03'),
    (17, '2022-03-29 04:15:00', FALSE, '2022-03-29 01:30:03', 4, NULL),
    (18, '2022-03-29 03:15:00', TRUE,  '2022-03-29 02:30:20', 0, '2022-03-29 04:09:02');
    

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
values (0, 'Open', 'Ticket is open'),
    (1, 'Closed', 'Ticket is closed'),
    (2, 'In progress', 'Ticket is in progress'),
    (3, 'Rejected', 'Ticket is rejected');


select * from ticket_status_;

truncate table ticket_log_ cascade;

insert into ticket_log_ (id, change_date_, ticket_id_, status_id_, served_by_)
values (0, '2022-02-01 09:44:00', 0, 0, 5),
    (1,  '2022-02-01 09:45:00', 0, 2, 5),
    (2,  '2022-02-01 09:45:00', 0, 1, 5),
    (3,  '2022-02-04 11:23:00', 1, 0, 2),
    (4,  '2022-02-04 11:25:00', 1, 2, 2),
    (5,  '2022-02-04 11:28:00', 1, 1, 2),
    (6,  '2022-02-05 06:01:00', 2, 0, 3),
    (7,  '2022-02-05 06:02:00', 2, 2, 3),
    (8,  '2022-02-05 06:03:00', 2, 1, 3),
    (9,  '2022-02-07 07:01:00', 3, 0, 0),
    (10, '2022-02-07 07:02:00', 3, 3, 0),
    (12, '2022-02-08 08:10:00', 4, 0, 6),
    (13, '2022-02-08 08:11:00', 4, 2, 6),
    (14, '2022-02-08 08:12:00', 4, 1, 6),
    (15, '2022-02-09 09:01:00', 5, 0, 4),
    (16, '2022-02-09 09:02:00', 5, 2, 4),
    (17, '2022-02-09 09:03:00', 5, 1, 4),
    (18, '2022-02-09 09:04:00', 6, 0, 1);


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