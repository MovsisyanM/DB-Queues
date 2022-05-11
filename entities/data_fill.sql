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

/*markdown
Inserting data into profiles table...
*/

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

/*markdown
Filling the interval table...
*/

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

/*markdown
Filling the company table...
*/

truncate table company_ cascade;

insert into company_ (id, name_, email_, phone_, address_, start_of_coop_, field_) 
values (0, 'DataBASS', 'contact@databass.com', '+1-800-DATABASS', '1123 Main St, Los Angeles, CA, 90001', '2019-01-01', 'Data Science'),
    (1, 'Covenant', 'contact@covenant.com', '+1-800-COVENT', '1123 Main St, Dubai', '2020-02-01', 'Space tourism'),
    (2, 'BuildersGuild', 'contact@builders.gld', '+1-800-BUILDERS', '1123 Main St, London', '2020-01-01', 'Construction'),
    (3, 'DestroyersGuild', 'contact@destroyers.gld', '+1-800-DESTROYERS', '1123 Main St, Paris', '2022-01-01', 'Destruction'),
    (4, 'Gugo', 'gugo@mail.am', '+1-800-GUGO', '1123 Main St, Moscow', '2017-01-01', 'Search engine');

select * from company_;

/*markdown
Filling the branch table...
*/

truncate table branch_ cascade;

insert into branch_ (id, name_, email_, phone_, address_, company_id_) 
values (0, 'DataBASS HQ', 'hq@databass.com', '+1-800-DATABASS', '1123 Main St, Los Angeles, CA, 90001', 0),
    (1, 'Covenant HQ', 'hq@covenant.com', '+1-800-COVENT', '1123 Main St, Dubai', 1),
    (2, 'BuildersGuild HQ', 'hq@covenant.com', '+1-800-BUILDERS', '1123 Main St, London', 2),
    (3, 'DestroyersGuild HQ', 'hq@builders.gld', '+1-800-DESTROYERS', '1123 Main St, Paris', 3),
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

insert into ticket_ (id, target_day_, check_in_, created_date_, service_type_id_, activated_time) 
values (0, '2022-02-01 13:44:00', TRUE, '2022-02-01 13:34:00', 0, '2022-02-01 13:43:30'),
    (1, '2022-02-04 15:23:00', TRUE, '2022-02-01 13:10:00', 3, '2022-02-01 15:44:05'),
    (2, '2022-02-05 10:03:00', TRUE, '2022-02-05 09:00:06', 3, '2022-02-05 10:01:09'),
    (3, '2022-02-05 10:15:00', FALSE, '2022-02-05 09:00:06', 2, NULL),
    (4, '2022-02-07 11:15:00', TRUE, '2022-02-07 09:24:06', 1, '2022-02-07 12:01:09'),
    (5, '2022-02-08 12:10:00', TRUE, '2022-02-08 09:23:08', 4, '2022-02-08 12:06:04'),
    (6, '2022-02-09 12:15:00', TRUE, '2022-02-09 09:28:07', 1, '2022-02-09 12:05:03'),
    (7, '2022-02-09 14:15:00', FALSE, '2022-02-09 10:30:03', 4, NULL),
    (8, '2022-02-19 13:15:00', TRUE, '2022-02-19 12:30:20', 0,  '2022-02-19 04:09:02'),
    (10, '2022-02-31 03:44:00', TRUE, '2022-02-01 00:34:00', 0, '2022-02-01 03:43:30'),
    (11, '2022-02-34 05:23:00', TRUE, '2022-02-01 00:10:00', 3, '2022-02-01 05:44:05'),
    (12, '2022-02-35 00:03:00', TRUE, '2022-02-05 00:00:06', 3, '2022-02-05 00:01:09'),
    (13, '2022-02-35 00:15:00', FALSE, '2022-02-05 00:00:06', 2, NULL),
    (14, '2022-02-37 01:15:00', TRUE, '2022-02-07 09:24:06', 1, '2022-02-07 02:01:09'),
    (15, '2022-02-38 02:10:00', TRUE, '2022-02-08 09:23:08', 4, '2022-02-08 02:06:04'),
    (16, '2022-02-39 02:15:00', TRUE, '2022-02-09 09:28:07', 1, '2022-02-09 02:05:03'),
    (17, '2022-02-39 04:15:00', FALSE, '2022-02-09 01:30:03', 4, NULL),
    (18, '2022-02-39 03:15:00', TRUE, '2022-02-19 02:30:20', 0, '2022-02-19 04:09:02');
    

select * from employee_;

