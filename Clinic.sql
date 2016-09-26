USE master;
IF DB_ID('Clinic') IS NOT NULL
DROP DATABASE Clinic;
CREATE DATABASE Clinic;
GO
USE Clinic;

----Roles--------
IF OBJECT_ID('Roles', 'U') IS NOT NULL
DROP TABLE Roles;
CREATE TABLE dbo.Roles
(
RoleId int not null IDENTITY(1,1) primary key,
RoleName VARCHAR(64) NOT NULL,
);
GO
SET IDENTITY_INSERT Roles ON;
INSERT INTO Roles(RoleId, RoleName)
VALUES(1, 'Admin');
INSERT INTO Roles(RoleId, RoleName)
VALUES(2, 'Sudo');
INSERT INTO Roles(RoleId, RoleName)
VALUES(3, 'Doctor');
INSERT INTO Roles(RoleId, RoleName)
VALUES(4, 'Assistant');
SET IDENTITY_INSERT Roles OFF;
GO
----Users--------
IF OBJECT_ID('Users', 'U') IS NOT NULL
DROP TABLE Users;
CREATE TABLE dbo.Users
(
UserId int not null IDENTITY(1,1) primary key,
UserName VARCHAR(64) NOT NULL,
UserPass VARCHAR(64) NOT NULL,
);
GO
SET IDENTITY_INSERT Users ON;
INSERT INTO Users(UserId, UserName,UserPass)
VALUES(1, 'admin', 'admin');
INSERT INTO Users(UserId, UserName,UserPass)
VALUES(2, 'doctor', '123');
SET IDENTITY_INSERT Users OFF;
GO
---------Cabinets----------
IF OBJECT_ID('Cabinets', 'U') IS NOT NULL
DROP TABLE Cabinets;
CREATE TABLE dbo.Cabinets
(
CabinetId int not null IDENTITY(1,1) primary key,
CabinetNumber int not null,
);
GO
SET IDENTITY_INSERT Cabinets ON;
INSERT INTO Cabinets(CabinetId, CabinetNumber)
VALUES( 1,102);
INSERT INTO Cabinets(CabinetId, CabinetNumber)
VALUES(2, 222);
SET IDENTITY_INSERT Cabinets OFF;
GO
------------Doctors--------
IF OBJECT_ID('Doctors', 'U') IS NOT NULL
DROP TABLE Doctors;
CREATE TABLE dbo.Doctors
(
DocId int not null IDENTITY(1,1) primary key,
DocName VARCHAR(64) NOT NULL,
CabinetId int not null FOREIGN KEY REFERENCES dbo.Cabinets(CabinetId),
DocSpecialisation VARCHAR(64) NOT NULL,
);
GO
SET IDENTITY_INSERT Doctors ON;
INSERT INTO Doctors(DocId, DocName,CabinetId, DocSpecialisation)
VALUES( 1,'Ivanov I.I.', 1, 'Plastic Surgeon');
INSERT INTO Doctors(DocId, DocName,CabinetId, DocSpecialisation)
VALUES( 2,'Than Xao', 2, 'Massage Therapist');
SET IDENTITY_INSERT Doctors OFF;
GO

------------Procedures--------
IF OBJECT_ID('Procedures', 'U') IS NOT NULL
DROP TABLE Procedures;
CREATE TABLE dbo.Procedures
(
ProcId int not null IDENTITY(1,1) primary key,
DocId int not null FOREIGN KEY REFERENCES dbo.Doctors(DocId),
ProcName VARCHAR(64) NOT NULL,
DateStart Datetime not null,
DateFinish Datetime not null,
ProcDescription VARCHAR(128) NOT NULL,
ProcCost money not null DEFAULT(0),
);
GO
SET IDENTITY_INSERT Procedures ON;
INSERT INTO Procedures(ProcId, DocId, ProcName, DateStart, DateFinish, ProcDescription,ProcCost)
VALUES( 1,2,'Massage',  '2016-09-09 10:00:00', '2016-09-09 10:59:00', 'Aroma massage', 55.99);
SET IDENTITY_INSERT Procedures OFF;
GO
---------Clients-----------
IF OBJECT_ID('Clients', 'U') IS NOT NULL
DROP TABLE Clients;
CREATE TABLE dbo.Clients
(
ClientId int not null IDENTITY(1,1) primary key,
ClientName VARCHAR(128) NOT NULL,
ClientAddress VARCHAR(64) NOT NULL,
ClientDataBirthday Date NOT NULL,


);
GO
SET IDENTITY_INSERT Clients ON;
INSERT INTO Clients(ClientId, ClientName, ClientAddress, ClientDataBirthday)
VALUES( 1,'Romashova Alina ', 'Mechnikova 8, kv.16', '1963-09-07');

SET IDENTITY_INSERT Clients OFF;
GO

---------Schedule-----------
IF OBJECT_ID('Schedule', 'U') IS NOT NULL
DROP TABLE Schedule;
CREATE TABLE dbo.Schedule
(
ScheduleId int not null IDENTITY(1,1) primary key,
--DocId int not null FOREIGN KEY REFERENCES dbo.Doctors(DocId),

ScheduleDay VARCHAR(64) NOT NULL,
ScheduleHour int not null,
ScheduleMinute int not null
);
GO
SET IDENTITY_INSERT Schedule ON;
INSERT INTO Schedule(ScheduleId,ScheduleDay, ScheduleHour, ScheduleMinute)
VALUES( 1,'Monday', 2, 30);

SET IDENTITY_INSERT Schedule OFF;
GO