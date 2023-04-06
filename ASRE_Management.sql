CREATE DATABASE ASRE_Management;

CREATE TABLE Collage(
Collage_no INT,
Collage_name VARCHAR(100) NOT NULL,
PRIMARY KEY (Collage_no)
);
SELECT *
FROM Activity_type;

CREATE TABLE Department_contact(
Contact_no INT,
Contact_name VARCHAR(70) NOT NULL,
Contact_email VARCHAR(20) NOT NULL,
Contact_address VARCHAR(50),
Contact_phone CHAR(12),
PRIMARY KEY (Contact_no)
);
SELECT *
FROM Department_contact;

CREATE TABLE Pathway_type(
Pathway_type_no INT,
Pathway_type_desc VARCHAR(20),
PRIMARY KEY (Pathway_type_no)
);
SELECT *
FROM Pathway_type;

CREATE TABLE User_title(
Title_no INT,
Title_desc VARCHAR(20),
PRIMARY KEY (Title_no)
);
SELECT *
FROM User_title;

CREATE TABLE Activity_type(
Activity_type_no INT,
Activity_type_desc VARCHAR(20),
PRIMARY KEY (Activity_type_no)
);
SELECT *
FROM Activity_type;

CREATE TABLE Department(
Department_no INT,
Department_name varchar(100) NOT NULL,
Collage_no INT NOT NULL,
Contact_no INT NOT NULL,
Pathway_no1 INT NOT NULL,
Pathway_no2 INT NOT NULL,
PRIMARY KEY (Department_no),
FOREIGN KEY (Collage_no) REFERENCES Collage(Collage_no),
FOREIGN KEY (Contact_no) REFERENCES Department_contact(Contact_no),
FOREIGN KEY (Pathway_no1) REFERENCES Pathway(Pathway_no),
FOREIGN KEY (Pathway_no1) REFERENCES Pathway(Pathway_no)
);
SELECT *
FROM Department;

CREATE TABLE Pathway(
Pathway_no INT,
Pathway_type_no INT NOT NULL,
PRIMARY KEY (Pathway_no),
FOREIGN KEY (Pathway_type_no) REFERENCES Pathway_type(Pathway_type_no)
);
SELECT *
FROM Pathway;

CREATE TABLE Activity(
Activity_no INT,
Activity_type_no INT NOT NULL,
Activity_name VARCHAR(30) NOT NULL,
Activity_start_date DATE NOT NULL,
Activity_end_date DATE NOT NULL,
Activity_address VARCHAR(100) NOT NULL,
Activity_time TIME NOT NULL,
Activity_desc VARCHAR(300),
PRIMARY KEY (Activity_no),
FOREIGN KEY (Activity_type_no) REFERENCES Activity_type(Activity_type_no)
);
SELECT *
FROM Activity;

CREATE TABLE Activity_Assignment (
Assign_no INT,
Pathway_no INT NOT NULL,
Activity_no INT NOT NULL,
PRIMARY KEY (Assign_no),
FOREIGN KEY (Pathway_no) REFERENCES Pathway(Pathway_no),
FOREIGN KEY (Activity_no) REFERENCES Activity(Activity_no)
);
SELECT *
FROM Activity_Assignment;

CREATE TABLE Student_Enrollment(
Enrollment_no INT,
Pathway_no INT NOT NULL,
Student_id INT NOT NULL,
Title_no INT NOT NULL,
Department_no INT NOT NULL,
Student_first_name VARCHAR(30) NOT NULL,
Student_middle_name VARCHAR(30),
Student_last_name VARCHAR(30) NOT NULL,
Student_email VARCHAR(50) NOT NULL,
Major VARCHAR(20),
Enrollment_date DATE NOT NULL,
Semester_year CHAR(4) NOT NULL,
PRIMARY KEY (Enrollment_no),
FOREIGN KEY (Title_no) REFERENCES User_title(Title_no),
FOREIGN KEY (Pathway_no) REFERENCES Pathway(Pathway_no),
FOREIGN KEY (Department_no) REFERENCES Department(Department_no)
);
SELECT *
FROM Student_Enrollment;

CREATE TABLE Employee(
Emp_id INT,
Title_no INT NOT NULL,
Department_no INT NOT NULL,
Emp_first_name VARCHAR(30) NOT NULL,
Emp_middle_name VARCHAR(30),
Emp_last_name VARCHAR(30) NOT NULL,
Emp_email VARCHAR(50) NOT NULL,
PRIMARY KEY (Emp_id ),
FOREIGN KEY (Department_no) REFERENCES Department(Department_no),
FOREIGN KEY (Title_no) REFERENCES User_title(Title_no)
);
SELECT *
FROM Employee;

CREATE TABLE Approval(
Approval_no INT,
Mentor_EmpID INT NOT NULL,
Dean_EmpID INT NOT NULL,
SCRCS_EmpID INT NOT NULL,
Assign_no INT NOT NULL,
PRIMARY KEY (Approval_no),
FOREIGN KEY (Mentor_EmpID) REFERENCES Employee(Emp_id),
FOREIGN KEY (Dean_EmpID) REFERENCES Employee(Emp_id),
FOREIGN KEY (SCRCS_EmpID) REFERENCES Employee(Emp_id)
);
SELECT *
FROM Approval;