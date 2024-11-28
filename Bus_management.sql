
 CREATE TABLE PASSANGER
(
passanger_id int NOT NULL PRIMARY KEY,
passanger_firstname varchar(100),
passanger_lastname varchar(100),
passanger_age int,
passanger_gender varchar(10),
passanger_contactno int,
passanger_emailid varchar(100)
);

 INSERT INTO PASSANGER VALUES(&id,'&firstname','&lastname',&age,'&gender',&contactno,'&emailid');

CREATE TABLE TICKET
(
 ticket_number int NOT NULL PRIMARY KEY,
 ticket_startingpoint  varchar(100),
 ticket_destination varchar(100),
 ticket_date date,
 ticket_time int
);

CREATE TABLE PAYMENT
(
 payment_id int NOT NULL PRIMARY KEY,
 payment_amount int,
 payment_date date,
 payment_time int,
 payment_mode varchar(100)
);

CREATE TABLE DRIVER
(
driver_id int NOT NULL PRIMARY KEY,
driver_firstname varchar(100),
driver_middlename varchar(100),
driver_lastname varchar(100),
driver_gender varchar(100),
driver_age int,
driver_contactno int,
driver_salarydetail varchar(100)
);

INSERT INTO DRIVER VALUES(&id,'&firstname','&middlename','&lastname','&gender',&age,&contact,'&salarydetail');






SQL> CREATE TABLE PASSANGER
  2  ( PASSANGER_ID INT NOT NULL PRIMARY KEY,
  3  PASSANGER_FIRSTNAME VARCHAR(20),
  4  PASSANGER_LASTNAME VARCHAR(20),
  5  PASSANGER_AGE INT,
  6  PASSANGER_GENDER VARCHAR(6),
  7  PASSANGER_CONTACTNO INT,
  8  PASSANGER_EMAILID VARCHAR(25))
  9  ;



SQL> INSERT INTO PASSANGER VALUES(221901,'Samir','Choughule',35,'male',9865432107,'samir07@gmail.com');

1 row created.

SQL> INSERT INTO PASSANGER VALUES(221902,'Prasad','Khandeker',32,'male',8632014578,'prasad78@gmail.com');

1 row created.

SQL> INSERT INTO PASSANGER VALUES(221903,'Namrata','Sambherao',28,'female',7530145982,'namrata82@gmail.com');

1 row created.

SQL> INSERT INTO PASSANGER VALUES(221904,'Shivali','Parab',24,'female',9320154782,'shivali82@gmail.com');

1 row created.

SQL> INSERT INTO PASSANGER VALUES(221905,'Omkar','Raut',29,'male',8653210487,'omkar87@gmail.com');

1 row created.

SQL> select * from passanger;

PASSANGER_ID PASSANGER_FIRSTNAME  PASSANGER_LASTNAME   PASSANGER_AGE PASSAN
------------ -------------------- -------------------- ------------- ------
PASSANGER_CONTACTNO PASSANGER_EMAILID
------------------- -------------------------
      221901 Samir                Choughule                       35 male
         9865432107 samir07@gmail.com

      221902 Prasad               Khandeker                       32 male
         8632014578 prasad78@gmail.com

      221903 Namrata              Sambherao                       28 female
         7530145982 namrata82@gmail.com


PASSANGER_ID PASSANGER_FIRSTNAME  PASSANGER_LASTNAME   PASSANGER_AGE PASSAN
------------ -------------------- -------------------- ------------- ------
PASSANGER_CONTACTNO PASSANGER_EMAILID
------------------- -------------------------
      221904 Shivali              Parab                           24 female
         9320154782 shivali82@gmail.com

      221905 Omkar                Raut                            29 male
         8653210487 omkar87@gmail.com


SQL> select passanger_id,passanger_firstname,passanger_age,passanger_gender
  2  from passanger;

PASSANGER_ID PASSANGER_FIRSTNAME  PASSANGER_AGE PASSAN
------------ -------------------- ------------- ------
      221901 Samir                           35 male
      221902 Prasad                          32 male
      221903 Namrata                         28 female
      221904 Shivali                         24 female
      221905 Omkar                           29 male

SQL> select passanger_id,passanger_firstname,passanger_gender
  2  from passanger;

PASSANGER_ID PASSANGER_FIRSTNAME  PASSAN
------------ -------------------- ------
      221901 Samir                male
      221902 Prasad               male
      221903 Namrata              female
      221904 Shivali              female
      221905 Omkar                male





SQL> CREATE TABLE BUS
  2  (BUS_NO INT NOT NULL PRIMARY KEY,
  3  BUS_TYPE VARCHAR(5),
  4  BUS_SEATSAVILABLE INT,
  5  BUS_STARTINGPOINT VARCHAR(20),
  6  BUS_ENDINGPOINT VARCHAR(20));

Table created.

SQL> INSERT INTO BUS
  2  VALUES(301,'AC',45,'Mumbai csmt rs','pune rs'
  3  );

1 row created.

SQL> INSERT INTO BUS
  2  VALUES(302,'AC',30,'Mumbai csmt rs','nashik rs');

1 row created.

SQL> INSERT INTO BUS
  2  VALUES(303,'NONAC',45,'Mumbai csmt rs','palghar rs');

1 row created.

SQL> SELECT * FROM BUS;

    BUS_NO BUS_T BUS_SEATSAVILABLE BUS_STARTINGPOINT    BUS_ENDINGPOINT
---------- ----- ----------------- -------------------- --------------------
       301 AC                   45 Mumbai csmt rs       pune rs
       302 AC                   30 Mumbai csmt rs       nashik rs
       303 NONAC                45 Mumbai csmt rs       palghar rs



SQL> DROP TABLE DRIVER;

Table dropped.

SQL> CREATE TABLE DRIVER
  2  (
  3  DRIVER_ID INT NOT NULL PRIMARY KEY
  4  ,
  5  DRIVER_FIRSTNAME VARCHAR(20),
  6  DRIVER_LASTNAME VARCHAR(20),
  7  DRIVER_AGE INT,
  8  DRIVER_CONTACTNO INT,
  9  DRIVER_SALARY INT,
 10  DRIVER_BUS INT);

Table created.

SQL> alter table driver add constraint drives Foreign key(driver_bus) references bus(bus_no);

Table altered.

SQL> INSERT INTO DRIVER VALUES(1901,'Balkrishna','Parab',23,9987370456,20000,301);

1 row created.

SQL> INSERT INTO DRIVER VALUES(1902,'Omkar','Sawant',27,9532014563,20000,302);

1 row created.

SQL> INSERT INTO DRIVER VALUES(1903,'Akshit','Gala',32,8532014796,25000,303);

1 row created.

SQL> select * from driver;

 DRIVER_ID DRIVER_FIRSTNAME     DRIVER_LASTNAME      DRIVER_AGE DRIVER_CONTACTNO
---------- -------------------- -------------------- ---------- ----------------
DRIVER_SALARY DRIVER_BUS
------------- ----------
      1901 Balkrishna           Parab                        23       9987370456
        20000        301

      1902 Omkar                Sawant                       27       9532014563
        20000        302

      1903 Akshit               Gala                         32       8532014796
        25000        303


SQL> select driver_id,driver_firstname,driver_bus from driver;

 DRIVER_ID DRIVER_FIRSTNAME     DRIVER_BUS
---------- -------------------- ----------
      1901 Balkrishna                  301
      1902 Omkar                       302
      1903 Akshit                      303



SQL> select driver_id,driver_firstname,driver_age
  2  from driver
  3  where driver_bus in (select bus_no from bus where bus_type='AC');

 DRIVER_ID DRIVER_FIRSTNAME     DRIVER_AGE
---------- -------------------- ----------
      1901 Balkrishna                   23
      1902 Omkar                        27

SQL> select * from bus;

    BUS_NO BUS_T BUS_SEATSAVILABLE BUS_STARTINGPOINT    BUS_ENDINGPOINT
---------- ----- ----------------- -------------------- --------------------
       301 AC                   45 Mumbai csmt rs       pune rs
       302 AC                   30 Mumbai csmt rs       nashik rs
       303 NONAC                45 Mumbai csmt rs       palghar rs

SQL> select driver_id,driver_firstname,driver_age,bus_type
  2  from driver , bus
  3  where driver_bus in (select bus_no from bus where bus_type='AC');

 DRIVER_ID DRIVER_FIRSTNAME     DRIVER_AGE BUS_T
---------- -------------------- ---------- -----
      1901 Balkrishna                   23 AC
      1901 Balkrishna                   23 AC
      1901 Balkrishna                   23 NONAC
      1902 Omkar                        27 AC
      1902 Omkar                        27 AC
      1902 Omkar                        27 NONAC

6 rows selected

SQL> drop table ticket;

Table dropped.

SQL> create table ticket
  2  (ticket_no int not null primary key,
  3  ticket_passanger int,
  4  ticket_bus int,
  5  ticket_destination varchar(20),
  6  ticket_date date,
  7  ticket_time timestamp,
  8  ticket_fare int);

Table created.

SQL> alter table ticket add constraint belongs foreign key(ticket_passanger) references passanger(passanger_id);

Table altered
