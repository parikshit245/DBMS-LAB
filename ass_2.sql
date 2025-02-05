
-- create
create table Students(
  PRN int primary key,
  firstName varchar(50) not null,
  lastName varchar(50) not null,
  middleName varchar(50),
  year int not null,
  email varchar(100) unique,
  age int not null,
  department varchar(100)
);
-- insertion
insert into Students (PRN, firstName, lastName, middleName, year, email, age, department)
values
  (101, 'john', 'doe', '.A', 2, 'john.doe@gmail.com', 20, 'computer science'),
  (102, 'Jane', 'Smith', '.A', 1, 'jane.smith@gmail.com', 19, 'mechanical engineering'),
  (103, 'alice', 'johnson', null, 3, 'alice.johnson@gmail.com', 21, 'electronics'),
  (104, 'brod', 'stud', '.A', 2, 'brod.stud@gmail.com', 21, 'computer science');

select * from Students;

-- update table
update Students
set year=2
where prn=239;
select * from Students;

-- delete in table
delete from Students
where PRN = 240;

-- alter table
alter table Students
add PhoneNumber varchar(15);

-- distinct values for years
select distinct department
from Students;

-- find distinct count for years
select count(distinct department)
from Students;

-- distinct age of computer science
select distinct age 
from Students 
where department='computer science';

-- distinct ffirstName of age<21
select distinct firstName
from Students
where age<=20;


-- full details of age>20
select * from Students
where age>20;

-- all details having year=3
select * from Students
where year=3;

-- firstName and lastName
select firstName, lastName from Students
where PRN>101;

-- emails
select firstName, lastName, email from Students
where department='electronics';

-- details
select * from Students
where department='computer science' and age>19;

