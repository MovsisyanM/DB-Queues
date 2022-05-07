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
    (2, 'BuildersGuild', 'contact@builders.gld', '+1-800-BUILDERS', '1123 Main St, London', '2019-01-01', 'Construction'),
    (3, 'DestroyersGuild', 'contact@destroyers.gld', '+1-800-DESTROYERS', '1123 Main St, Paris', '2019-01-01', 'Destruction'),
    (4, 'Gugo', 'gugo@mail.am', '+1-800-GUGO', '1123 Main St, Moscow', '2019-01-01', 'Search engine');

select * from company_;

