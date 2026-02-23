-- Step 1: Create Department
CREATE TABLE Department (
    DepartmentID VARCHAR(10) PRIMARY KEY,
    DepartmentName VARCHAR(100),
    OfficeLocation VARCHAR(100)
);              

-- Step 2: Create Faculty
CREATE TABLE Faculty (
    FacultyID VARCHAR(10) PRIMARY KEY,
    Name VARCHAR(100),
    Designation VARCHAR(50),
    Email VARCHAR(100),
    DepartmentID VARCHAR(10),
    FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID)
);

-- Step 3: Create Student
CREATE TABLE Student (
    StudentID VARCHAR(10) PRIMARY KEY,
    Name VARCHAR(100),
    DateOfBirth DATE,
    Gender CHAR(1),
    ContactNumber VARCHAR(15),
    DepartmentID VARCHAR(10),
    FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID)
);

-- Step 4: Create Course
CREATE TABLE Course (
    CourseID VARCHAR(10) PRIMARY KEY,
    CourseName VARCHAR(100),
    Credits INT,
    DepartmentID VARCHAR(10),
    FacultyID VARCHAR(10),
    FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID),
    FOREIGN KEY (FacultyID) REFERENCES Faculty(FacultyID)
);

-- Step 5: Create Enrollment
CREATE TABLE Enrollment (
    StudentID VARCHAR(10),
    CourseID VARCHAR(10),
    Semester VARCHAR(20),
    Grade CHAR(2),
    PRIMARY KEY (StudentID, CourseID),
    FOREIGN KEY (StudentID) REFERENCES Student(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Course(CourseID)
);
COMMIT;

