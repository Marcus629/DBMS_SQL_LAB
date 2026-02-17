--Part 1 : DDL--

CREATE TABLE Student(
    RollNo NUMBER,
    Name VARCHAR2(50),
    Dept VARCHAR2(20),
    Age NUMBER,
    Phone VARCHAR2(15)
);

CREATE TABLE Courses(
    CourseID NUMBER,
    CourseName VARCHAR2(50),
    Credits NUMBER
);

ALTER TABLE Student ADD City VARCHAR2(30);
ALTER TABLE Student ADD Semester NUMBER;
ALTER TABLE Student RENAME COLUMN Phone TO MobileNo;

--Part 2: DML--

INSERT INTO Student VALUES(100,'Harshit Mishra','CSE',23,'9876562738','Delhi',5);
INSERT INTO Student VALUES(101,'Ashish Srivastava','CSE(ML)',22,'9876562222','Mumbai',4);
INSERT INTO Student VALUES(102,'Anand Sagar','CSE(IOT)',23,'9876569878','Pune',5);
INSERT INTO Student VALUES(103,'Vishal Kumar Singh','CSE(AI)',21,'9876587638','Banglore',7);
INSERT INTO Student VALUES(104,'Rahul','CSE',20,'9876512338','Ranchi',8);

SELECT * FROM Student;

SELECT RollNo, Name FROM Student;

SELECT * FROM Student WHERE Dept = 'CSE';

SELECT * FROM Student WHERE Age > 20;

UPDATE Student SET Dept ='ECE' WHERE RollNo = 101;

UPDATE Student SET City ='Patna' WHERE Name = 'Rahul';

UPDATE Student SET Age = Age + 1;


