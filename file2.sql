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

select * from students;

-- How to insert a data into table:

insert into clients
values
(2, 'Vijay', 'samson', '5/23/1998', 1, 67.458876666, 1.234567, 5000, '17:30:20', '12/15/2026 10:12:45', N'வணக்கம்')

select * from clients;


----------------- Renaming

EXEC sp_rename 'students.dob', 'date_of_birth';

EXEC sp_rename 'students', 'clients';

select * from clients;

----------------------------------------

alter database adeDB
set single_user with rollback immediate;

alter database adeDB
modify name = myDB;

alter database myDB
set multi_user

-----------------------------------------------------------

select distinct *
from clients;


select * from clients
where firstname = 'Vijay';


