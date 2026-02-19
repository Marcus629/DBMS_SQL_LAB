DROP TABLE Enrollment CASCADE CONSTRAINTS;
DROP TABLE Student CASCADE CONSTRAINTS;
DROP TABLE Course CASCADE CONSTRAINTS;
DROP TABLE Faculty CASCADE CONSTRAINTS;
DROP TABLE Department CASCADE CONSTRAINTS;

--Create Department
CREATE TABLE Department (
    DepartmentID VARCHAR2(10) PRIMARY KEY,
    DepartmentName VARCHAR(100),
    OfficeLocation VARCHAR(100)
);

--Create Faculty
CREATE TABLE Faculty (
    FacultyID VARCHAR2(10) PRIMARY KEY,
    Name VARCHAR(100),
    Designation VARCHAR(50),
    Email VARCHAR(100),
    DepartmentID VARCHAR(10),
    FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID)
);

-- Create Student
CREATE TABLE Student (
    StudentID VARCHAR2(10) PRIMARY KEY,
    Name VARCHAR(100),
    DateOfBirth DATE,
    Gender CHAR(1),
    ContactNumber VARCHAR(15),
    DepartmentID VARCHAR2(10),
    FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID)
);

-- Create Course
CREATE TABLE Course (
    CourseID VARCHAR2(10) PRIMARY KEY,
    CourseName VARCHAR(100),
    Credits INT,
    DepartmentID VARCHAR2(10),
    FacultyID VARCHAR2(10),
    FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID),
    FOREIGN KEY (FacultyID) REFERENCES Faculty(FacultyID)
);

-- Create Enrollment
CREATE TABLE Enrollment (
    StudentID VARCHAR2(10),
    CourseID VARCHAR2(10),
    Semester VARCHAR(20),
    Grade CHAR(2),
    PRIMARY KEY (StudentID, CourseID),
    FOREIGN KEY (StudentID) REFERENCES Student(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Course(CourseID)
);

-- INSERT DATA SECTION

-- Insert Into Department
INSERT INTO Department VALUES ('D01', 'Computer Science and Engineering', 'Main building');
INSERT INTO Department VALUES ('D02', 'Computer Science and Engineering(AIML)', 'Main building');
INSERT INTO Department VALUES ('D03', 'Civil Engineering', 'Main building');
INSERT INTO Department VALUES ('D04', 'Electrical and Electronics Engineering', 'Main building');
INSERT INTO Department VALUES ('D05', 'Civil Engineering with Computer Application', 'Main building');
INSERT INTO Department VALUES ('D06', '3D Animation and Graphics', 'Main building');

-- Insert Into Faculty
INSERT INTO Faculty VALUES ('F01','Prof.Murlidhar Prasad Singh',' Assistant Professor, Head of Department','singhmurlidhar@gmail.com','D01');
INSERT INTO Faculty VALUES ('F02','Prof. Md. Ehtashamoul Haque',' Assistant Professor, Head of Department','ehtasham47@gmail.com','D02');
INSERT INTO Faculty VALUES ('F03','Prof. Arun Kumar',' Assistant Professor(Guest)','arunkr75@gmail.com','D01');
INSERT INTO Faculty VALUES ('F04','Prof. Akhilesh Kumar',' Assistant Professor','akhileshkumar3804@gmail.com','D03');
INSERT INTO Faculty VALUES ('F05','Prof. Kunal Kumar',' Assistant Professor','kunal1989kumar@gmail.com','D05');
INSERT INTO Faculty VALUES ('F06','Prof. Praveen Kumar',' Assistant Professor','praveenkumaryadav782@gmail.com','D06');
INSERT INTO Faculty VALUES ('F07','Prof. Hare Krishna Mishra',' Assistant Professor',' hare.dbit@gmail.com','D04');

-- Insert Into Students
INSERT INTO Student 
VALUES ('S01', 'Anand Sagar', 
        TO_DATE('2004-05-12','YYYY-MM-DD'),
        'M', 
        '9871923210', 
        'D01');
INSERT INTO Student 
VALUES ('S02', 'Mital Prasad', 
        TO_DATE('2005-11-17','YYYY-MM-DD'),
        'M', 
        '9876984210', 
        'D04');
INSERT INTO Student 
VALUES ('S03', 'Vishal Kumar Singh', 
        TO_DATE('2004-05-19','YYYY-MM-DD'),
        'M', 
        '9986543210', 
        'D02');
INSERT INTO Student 
VALUES ('S04', 'Anubhav', 
        TO_DATE('2003-01-12','YYYY-MM-DD'),
        'M', 
        '8812743210', 
        'D06');
INSERT INTO Student 
VALUES ('S05', 'Ananya Kumari', 
        TO_DATE('2003-08-21','YYYY-MM-DD'),
        'F', 
        '7776598750', 
        'D01');
INSERT INTO Student 
VALUES ('S06', 'Raj Kishore', 
        TO_DATE('2004-07-22','YYYY-MM-DD'),
        'M', 
        '8471234210', 
        'D03');
INSERT INTO Student 
VALUES ('S07', 'Amrit Kumar', 
        TO_DATE('2005-07-21','YYYY-MM-DD'),
        'M', 
        '7878764210', 
        'D05');
INSERT INTO Student 
VALUES ('S08', 'Aayushi Srivastava', 
        TO_DATE('2003-06-09','YYYY-MM-DD'),
        'F', 
        '9123489710', 
        'D02');
INSERT INTO Student 
VALUES ('S09', 'Ashish Srivastava', 
        TO_DATE('2003-11-14','YYYY-MM-DD'),
        'M', 
        '9556543210', 
        'D01');
INSERT INTO Student 
VALUES ('S10', 'Harshit Mishra', 
        TO_DATE('2004-07-07','YYYY-MM-DD'),
        'M', 
        '8765543210', 
        'D01');

-- Insert Course        

-- CSE
INSERT INTO Course VALUES ('C01','Database Management Systems',5,'D01','F01');
INSERT INTO Course VALUES ('C02','Data Structures and Algorithms',5,'D01','F02');
INSERT INTO Course VALUES ('C03','Artificial Intelligence',3,'D01','F03');
INSERT INTO Course VALUES ('C04','Operating Systems',5,'D01','F01');

-- Civil Engineering
INSERT INTO Course VALUES ('C05','Structural Analysis',4,'D03','F04');
INSERT INTO Course VALUES ('C06','Geotechnical Engineering',4,'D03','F04');
INSERT INTO Course VALUES ('C07','Environmental Engineering',3,'D03','F04');

-- Electrical
INSERT INTO Course VALUES ('C08','Power Systems',4,'D04','F07');
INSERT INTO Course VALUES ('C09','Control Systems',3,'D04','F07');
INSERT INTO Course VALUES ('C10','Electrical Machines',4,'D04','F07');

-- Insert Enrollment
INSERT INTO Enrollment VALUES ('S01','C01','Semester 4','A');
INSERT INTO Enrollment VALUES ('S01','C02','Semester 3','A+');

INSERT INTO Enrollment VALUES ('S02','C08','Semester 3','A-');
INSERT INTO Enrollment VALUES ('S02','C09','Semester 4','B+');

INSERT INTO Enrollment VALUES ('S03','C03','Semester 3','A+');
INSERT INTO Enrollment VALUES ('S03','C04','Semester 3','B+');

INSERT INTO Enrollment VALUES ('S06','C07','Semester 4','A');
INSERT INTO Enrollment VALUES ('S04','C05','Semester 4','B');

INSERT INTO Enrollment VALUES ('S08','C01','Semester 3','A');
INSERT INTO Enrollment VALUES ('S08','C03','Semester 4','A-');

--Part A: Basic Data Display (Using Aliases)

SELECT 
    StudentID as Roll_No,
    Name as Student_Name,
    DateOfBirth as DOB,
    Gender as Student_Gender,
    ContactNumber as Mobile_no,
    DepartmentID as Dept_ID
FROM Student;

SELECT 
    StudentID AS Roll_No,
    Name AS Student_Name,
    DepartmentID AS Dept_ID
FROM Student;

SELECT 
    FacultyID AS Faculty_ID,
    Name AS Faculty_Name,
    Designation AS Job_Title,
    Email AS Email_Address
FROM Faculty;

SELECT 
    CourseID AS Course_ID,
    CourseName AS Course_Name,
    Credits AS Credit_Value,
    DepartmentID AS Dept_ID
FROM Course;

SELECT 
    StudentID AS Roll_No,
    CourseID AS Course_ID,
    Semester AS Semester_Number,
    Grade AS Final_Grade
FROM Enrollment;

--Part B: Conditional Data Display (WHERE Clause)

SELECT *
FROM Student
WHERE DepartmentID = 'D01';

SELECT *
FROM Student
WHERE Gender = 'F';

SELECT *
FROM Faculty
WHERE Designation = 'Assistant Professor';

SELECT *
FROM Faculty
WHERE DepartmentID = 'D02';

SELECT *
FROM Course
WHERE Credits >= 4;

SELECT *
FROM Student
WHERE DateOfBirth > TO_DATE('2003-11-14','YYYY-MM-DD');

SELECT *
FROM Enrollment
WHERE Semester = 'Semester 4';


--Part C: Sorting and Limiting Results

SELECT *
FROM Student
ORDER BY Name ASC;

SELECT *
FROM Student 
ORDER BY DateOfBirth DSC;

SELECT *
FROM Faculty
ORDER BY Designation ASC;

SELECT *
FROM Course
ORDER BY Credits DESC;

SELECT *
FROM Student
ORDER BY DepartmentID ASC, Name ASC;

SELECT *
FROM Enrollment
ORDER BY Semester ASC;

--Part D: Derived / Computed Output (No Table Modification)

SELECT 
    Name,
    FLOOR(MONTHS_BETWEEN(SYSDATE, DateOfBirth) / 12) AS Age
FROM Student;


SELECT 
    CourseName,
    Credits + 1 AS Updated_Credits
FROM Course;

SELECT 
    EnrollmentID,
    StudentID,
    CourseID,
    Semester,
    Grade AS Final_Grade
FROM Enrollment;

SELECT 
    Name,
    EXTRACT(YEAR FROM DateOfBirth) AS Birth_Year
FROM Student;


SELECT 
    Name,
    SUBSTR(Email, INSTR(Email, '@') + 1) AS Email_Domain
FROM Faculty;







