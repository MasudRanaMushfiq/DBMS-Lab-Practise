-- Example 03 -- 

use dbmslab;

create table person(nid INT PRIMARY KEY, name varchar(15), address varchar(15)
			 );
INSERT INTO person VALUES
(123451, 'Arif', 'Rajshahi'),
(123452, 'Sumon', 'Moynamati'),
(123453, 'Sagor', 'Sirajgang'),
(123454, 'Abdul', 'Rajshahi'),
(123455, 'Himesh', 'Dhaka'),
(123456, 'Amirul', 'Sylhet'),
(123457, 'Sajib', 'Chittagang');

SELECT * FROM person;
describe car;

CREATE TABLE car(licence VARCHAR(10) PRIMARY KEY, year INT, model varchar(10));

INSERT INTO car VALUES 
('12-3000', 2012, 'Axio'),
('11-3000', 2008, 'Corolla'),
('12-4000', 2013, 'Axio'),
('12-5000', 2013, 'Premio'),
('11-5000', 2010, 'Nano'),
('11-6000', 2011, 'Alto'),
('12-6000', 2015, 'Nano Twist');

SELECT * FROM car;

CREATE TABLE accident (
			date varchar(10),
            driver varchar(10),
            damage_amount int,
            PRIMARY KEY(date, driver)
            );

DESCRIBE accident;

INSERT INTO accident VALUES 
			('2013-01-12', 'Arif', 10000),
			('2015-09-25', 'Komol', 12000),
			('2014-06-20', 'Bahadur', 11000),
			('2011-12-20', 'Abdul', 8000),
			('2015-09-19', 'Akter', 7000),
			('2013-05-15', 'Arif', 20000),
			('2014-08-20', 'Arif', 15000);
            
SELECT * FROM accident;



CREATE TABLE owns (
			nid INT,
            licence varchar(10),
            PRIMARY KEY (nid, licence),
            FOREIGN KEY (nid) REFERENCES person(nid),
            FOREIGN KEY (licence) REFERENCES car(licence)
            );
select * from owns;
describe owns;

INSERT INTO owns VALUES
(123451, '11-3000'),
(123452, '12-4000'),
(123453, '12-5000'),
(123454, '11-5000'),
(123455, '11-6000'),
(123456, '12-6000'),
(123457, '12-3000'); 


CREATE TABLE log (
			licence VARCHAR(10),
			date VARCHAR(10),
			driver VARCHAR(10),
			PRIMARY KEY (licence, date, driver),
			FOREIGN KEY (licence) REFERENCES car(licence),
			FOREIGN KEY (date, driver) REFERENCES accident(date, driver)
			);
            
DESCRIBE log;

INSERT INTO log VALUES
			('11-3000', '2013-01-12', 'Arif'),
			('12-4000', '2015-09-25', 'Komol'),
			('11-6000', '2014-06-20', 'Bahadur'),
			('11-5000', '2011-12-20', 'Abdul'),
			('12-6000', '2015-09-19', 'Akter'),
			('11-3000', '2013-05-15', 'Arif'),
			('11-3000', '2014-08-20', 'Arif');

SELECT * FROM log;

SELECT name FROM person WHERE address = 'Rajshahi';
SELECT model FROM car WHERE year = 2013;

SELECT driver FROM accident WHERE damage_amount >= 10000 and damage_amount <= 15000;
SELECT o.nid FROM owns o JOIN car c ON o.licence = c.licence WHERE model = 'Axio';
SELECT p.name, p.address FROM person p JOIN owns o ON p.nid = o.nid JOIN car c ON c.licence = o.licence where c.model = 'Alto';

SELECT driver FROM accident WHERE date = '2011-12-20';
SELECT p.name FROM person p JOIN owns o On p.nid = o.nid WHERE o.licence = '12-4000';

SELECT DISTINCT p.name FROM person p JOIN owns o ON p.nid = o.nid JOIN log l ON l.licence = o.licence where l.driver = 'Arif';
SELECT DISTINCT c.model FROM car c JOIN log l ON c.licence = l.licence WHERE date = '2015-09-19';

SELECT COUNT(*) as accidentCount FROM log l JOIN owns o ON o.licence = l.licence JOIN person p ON p.nid = o.nid WHERE p.name = 'Arif';
SELECT DISTINCT l.date FROM log l JOIN owns o ON o.licence = l.licence JOIN person p ON p.nid = o.nid WHERE p.name = 'Arif';

select * from person;
SET SQL_SAFE_UPDATES = 0;
UPDATE person SET address = 'Nator' where name = 'Arif';

