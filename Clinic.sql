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
DocName VARCHAR(128) NOT NULL,
DocRank VARCHAR(128),
CabinetId int not null FOREIGN KEY REFERENCES dbo.Cabinets(CabinetId),
DocSpecialisation VARCHAR(64) NOT NULL,

);
GO
SET IDENTITY_INSERT Doctors ON;
INSERT INTO Doctors(DocId, DocName,DocRank, CabinetId, DocSpecialisation)
VALUES( 1,'Ivanov I.I.', 'Professor', 1, 'Plastic Surgeon');
INSERT INTO Doctors(DocId, DocName,DocRank, CabinetId, DocSpecialisation)
VALUES( 2,'Than Xao',  'Assistant Nurse', 2, 'Massage Therapist');
INSERT INTO Doctors(DocId, DocName,DocRank, CabinetId, DocSpecialisation)
VALUES( 3,'Abrikosov A.A.', 'Head Chief of Medicine', 1, 'Dermogastrotomy');
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
INSERT INTO Procedures(ProcId, DocId, ProcName, DateStart, DateFinish, ProcDescription,ProcCost)
VALUES( 2,2,'Laser Hair Removal',  '2016-09-09 10:00:00', '2016-09-09 10:59:00', 'Affordable laser hair removal for men and women', 10.99);
SET IDENTITY_INSERT Procedures OFF;
GO
---------Clients-----------
IF OBJECT_ID('Clients', 'U') IS NOT NULL
DROP TABLE Clients;
CREATE TABLE dbo.Clients
(
ClientId int not null IDENTITY(1,1) primary key,
ClientName VARCHAR(128) NOT NULL,
ClientLastName VARCHAR(128) NOT NULL,
ClientAddress VARCHAR(64) NOT NULL,
ClientDataBirthday Date NOT NULL,
ClientPhone VARCHAR(64),
ClientEmail VARCHAR(64)
);
GO
SET IDENTITY_INSERT Clients ON;
INSERT INTO Clients(ClientId, ClientName,ClientLastName, ClientAddress, ClientDataBirthday,ClientPhone, ClientEmail )
VALUES( 1, 'Alina', 'Romashova','Mechnikova 8, kv.16', '1963-09-07', '555-0256', 'ght@yahoo.com');
INSERT INTO Clients(ClientId, ClientName,ClientLastName, ClientAddress, ClientDataBirthday,ClientPhone, ClientEmail)
VALUES( 2, 'Iryna', 'Belokurova','Belogorodskaya vul, bud 57d, kv.90', '1991-12-12', '666-9875', 'belokurova@gmail.com');
INSERT INTO Clients(ClientId, ClientName,ClientLastName, ClientAddress, ClientDataBirthday,ClientPhone, ClientEmail)
VALUES( 3, 'Natalia', 'Kovalchuck','Komarova prospekt 14, kv.15', '2000-01-02', '224-1900', 'natkoval@gmail.com');
INSERT INTO Clients(ClientId, ClientName,ClientLastName, ClientAddress, ClientDataBirthday,ClientPhone, ClientEmail)
VALUES( 4, 'Rebecca', 'Klark','Chernobylskaya 6, kv.27', '1999-11-10', '066-8614', 'klark@ukr.net');
INSERT INTO Clients(ClientId, ClientName,ClientLastName, ClientAddress, ClientDataBirthday,ClientPhone, ClientEmail)
VALUES( 5, 'Olga', 'Taran','1 Maya, bud.4, kv.9', '1980-03-05', '781-8745', 'manager@microsoft.com');
INSERT INTO Clients(ClientId, ClientName,ClientLastName, ClientAddress, ClientDataBirthday,ClientPhone, ClientEmail)
VALUES( 6, 'Malvina', 'Mamedova','Schevchenko bulvar 53, kv.2', '1975-05-03', '148-1890', 'mamed@yandex.ru');
INSERT INTO Clients(ClientId, ClientName,ClientLastName, ClientAddress, ClientDataBirthday,ClientPhone, ClientEmail)
VALUES( 7, 'Lyubov', 'Sandugei','Lyuteranskaya 11 k.3, kv.19', '1981-12-01', '128-8549', 'sunflower@flower.com');
INSERT INTO Clients(ClientId, ClientName,ClientLastName, ClientAddress, ClientDataBirthday,ClientPhone, ClientEmail)
VALUES( 8, 'Zemfira', 'Ramazanova','Trehsvyatitelskaya 1, kv.5', '1978-01-01', '333-3578', 'zemfira@google.com');
INSERT INTO Clients(ClientId, ClientName,ClientLastName, ClientAddress, ClientDataBirthday,ClientPhone, ClientEmail)
VALUES( 9, 'Yanina', 'Petrovich','Pobedy prospekt 134, kv.20', '1969-10-10', '190-3308', 'topmanager@itstep.com');
INSERT INTO Clients(ClientId, ClientName,ClientLastName, ClientAddress, ClientDataBirthday,ClientPhone, ClientEmail)
VALUES( 10, 'Tereza', 'Yankovskaya','Bankovskaya 31, kv.50a', '1977-03-03', '460-7311', 'jdhj@yankovskaya.com');
INSERT INTO Clients(ClientId, ClientName,ClientLastName, ClientAddress, ClientDataBirthday,ClientPhone, ClientEmail)
VALUES( 11, 'Snezhana', 'Babenko','Sedova vul, bud.1', '1955-02-06', '980-6209', 'babenko@babenko.ua');


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
---------Appointment-----------
IF OBJECT_ID('Appointment', 'U') IS NOT NULL
DROP TABLE Appointment;
CREATE TABLE dbo.Appointment
(
AppointmentId int not null IDENTITY(1,1) primary key,
ClientId int not null FOREIGN KEY REFERENCES dbo.Clients(ClientId),


);
GO
