CREATE DATABASE SchoolSysDB

CREATE TABLE Class(
ClassId int primary key identity(1,1) not null,
ClassName varchar(50) null
)
CREATE TABLE Subject(
SubjectId int primary key identity(1,1) not null,
ClassId int foreign key references Class(ClassId) null,
SubjectName varchar(50) null
)
CREATE TABLE Student(
StudentId int primary key identity(1,1) not null,
Name varchar(50) null,
DOB date  null,
Gender varchar(50) null,
Mobile bigint null,
RollNo varchar(50) null,
Address varchar(max) null,
ClassId int foreign key references Class (ClassId) null
)

CREATE TABLE Teacher(
TeacherId int primary key identity(1,1) not null,
Name varchar(50) null,
DOB date  null,
Gender varchar(50) null,
Mobile bigint null,
Email varchar(50) null,
Address varchar(max) null,
Password varchar(20) null,
ClassId int foreign key references Class (ClassId) null
)

CREATE TABLE TeacherSubject(
Id int primary key identity(1,1) not null,
ClassId int foreign key references Class (ClassId) null,
SubjectId int foreign key references [Subject](SubjectId) null,
TeacherId int foreign key references Teacher(TeacherId) null
)

CREATE TABLE TeacherAttendence(
Id int primary key identity(1,1) not null,
TeacherId int foreign key references Teacher(TeacherId) null,
Status bit null,
Date date null
)
CREATE TABLE StufentAttendence(
Id int primary key identity(1,1) not null,
ClassId int foreign key references Class (ClassId) null,
SubjectId int foreign key references [Subject](SubjectId) null,
RollNo varchar(20) null,
Status bit null,
Date date null
)

CREATE TABLE Fees(
FeesId INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
ClassId int foreign key references Class (ClassId) null,
FeesAmount int null
)
CREATE TABLE Exam(
ExamId int primary key identity(1,1) not null,
ClassId int foreign key references Class (ClassId) null,
SubjectId int foreign key references [Subject](SubjectId) null,
RollNo varchar(20) null,
TotalMarks int null,
OutOfMarks int null
)

Create table Expenses(
ExpenseId int primary key identity(1,1) not null,
ClassId int foreign key references Class (ClassId) null,
SubjectId int foreign key references [Subject](SubjectId) null,
ChargeAmount int null
)