-- How to create a database:

create database adeDB;

use adeDB;

-- How to create a table:
create table students(
	sID int,
	firstname char(20),
	lastaname varchar(20),
	dob date,
	gender bit,
	marks float,
	height decimal(3, 2),
	fees money,
	class_time time,
	signup_datetime datetime,
	st_signature nvarchar(20)
);


select sID, firstname, height, st_signature from students;

select * from students;

-- How to insert a data into table:

insert into students
values
(1, 'Aith', 'clarke', '5/23/1998', 1, 67.458876666, 1.234567, 5000, '17:30:20', '12/15/2026 10:12:45', N'வணக்கம்')

select * from students;

-- How to add a new column in existing table:

alter table students
add duration int;

update students
set duration = 2
where sID = 1;


alter table students
drop column signup_datetime;

delete from students
where st_signature = N'வணக்கம்';


select * from students;

drop table students;


use master;

drop database adeDB;

