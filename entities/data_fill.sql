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

