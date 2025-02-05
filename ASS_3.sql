create database StudentManagement_238;
use StudentManagement_238;

create table Courses(
	CourseId int primary key not null,
    CourseName varchar(100) not null unique,
    Credits int default 3
);

create table Students(
	StudentID int not null,
    FirstName varchar(50) not null,
    LastName varchar(50),
    Email varchar(50) unique,
    DOB date not null,
    CourseId int,
    primary key (StudentID),
    foreign key (CourseId) references Courses(CourseId)
);

-- Insert data into Courses table
INSERT INTO Courses 
VALUES
    (1, 'Mathematics', 3),
    (2, 'Computer Science', 4),
    (3, 'Physics', 3),
    (4, 'Chemistry', 3),
    (5, 'Biology', 3);
    
select * from Courses;

-- Insert data into Students table
INSERT INTO Students (StudentID, FirstName, LastName, Email, DOB, CourseId)
VALUES
    (101, 'John', 'Doe', 'john.doe@example.com', '2000-05-10', 1),
    (102, 'Jane', 'Smith', 'jane.smith@example.com', '1999-08-15', 2),
    (103, 'Alice', 'Johnson', 'alice.johnson@example.com', '2001-03-22', 3),
    (104, 'Bob', 'Brown', 'bob.brown@example.com', '2000-11-30', 4),
    (105, 'Charlie', 'Davis', 'charlie.davis@example.com', '2002-07-05', 5);

select * from students;

-- Test 1: Attempt to insert a NULL value into a NOT NULL column
INSERT INTO Students (StudentID, FirstName, LastName, Email, DOB, CourseId)
VALUES (106, NULL, 'Taylor', 'taylor@example.com', '2001-09-12', 2);

-- Test 2: Attempt to insert a duplicate value into a UNIQUE column (Email)
INSERT INTO Students (StudentID, FirstName, LastName, Email, DOB, CourseId)
VALUES (107, 'David', 'Miller', 'john.doe@example.com', '2000-01-25', 3);

-- Test 3: Attempt to insert a record with an invalid FOREIGN KEY reference
INSERT INTO Students (StudentID, FirstName, LastName, Email, DOB, CourseId)
VALUES (108, 'Emily', 'Williams', 'emily.williams@example.com', '2001-12-18', 999);

select FirstName, LastName from students
where DOB > '2000-12-31';

-- 2. Write a query to update the course credits for "Computer Science" to 4.
update Courses 
set Credits=5 
where CourseName = 'Computer Science';
select * from Courses;

-- 3. Write a query to delete a student record whose email is 'test@example.com'.
delete from students
where email = 'john.doe@example.com';
select * from students;

-- 4. Write a query to find students who are not enrolled in any course.
SELECT FirstName, LastName
FROM Students
WHERE CourseId IS NULL;

-- 5. Test the UNIQUE constraint by inserting a duplicate email into the Students
-- table.
INSERT INTO Students (StudentID, FirstName, LastName, Email, DOB, CourseId)
VALUES (109, 'Lucas', 'King', 'jane.smith@example.com', '2001-10-20', 1);

-- 6. Test the FOREIGN KEY constraint by inserting a student with a CourseID
-- that does not exist in the Courses table
INSERT INTO Students (StudentID, FirstName, LastName, Email, DOB, CourseId)
VALUES (110, 'Mia', 'Green', 'mia.green@example.com', '2002-02-28', 999);
