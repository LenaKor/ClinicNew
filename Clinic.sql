USE master;
IF DB_ID('Clinic4') IS NOT NULL
DROP DATABASE Clinic4;
CREATE DATABASE Clinic4;
GO
USE Clinic4;

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
------UsersInRolese--------

IF OBJECT_ID('UsersInRoles', 'U') IS NOT NULL
DROP TABLE UsersInRoles;
CREATE TABLE dbo.UsersInRoles
(
UserInRolesId int not null IDENTITY(1,1) primary key,
UserId int not null FOREIGN KEY REFERENCES dbo.Users(UserId),
RoleId int not null FOREIGN KEY REFERENCES dbo.Roles(RoleId)
);
GO
SET IDENTITY_INSERT UsersInRoles ON;
INSERT INTO UsersInRoles(UserInRolesId, UserId,RoleId)
VALUES(1, 1, 1);
INSERT INTO UsersInRoles(UserInRolesId, UserId,RoleId)
VALUES(2, 1, 3);
INSERT INTO UsersInRoles(UserInRolesId, UserId,RoleId)
VALUES(3, 2, 4);
SET IDENTITY_INSERT UsersInRoles OFF;
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
------------Employeers--------
IF OBJECT_ID('Employeers', 'U') IS NOT NULL
DROP TABLE Employeers;
CREATE TABLE dbo.Employeers
(
EmpId int not null IDENTITY(1,1) primary key,
EmpName VARCHAR(128) NOT NULL,
--DocRank VARCHAR(128),
UserId int not null FOREIGN KEY REFERENCES dbo.Users(UserId),
--DocSpecialisation VARCHAR(128) NOT NULL,

);
GO
--SET IDENTITY_INSERT Employeers ON;
--INSERT INTO Employeers(DocId, DocName,DocRank,  DocSpecialisation)
--VALUES( 1,'Ivanov I.I.', 'Professor',  'Plastic Surgeon');
--INSERT INTO Doctors(DocId, DocName,DocRank,  DocSpecialisation)
--VALUES( 2,'Than Xao', 'Assistant Nurse', 'Massage Therapist');
--INSERT INTO Doctors(DocId, DocName,DocRank,  DocSpecialisation)
--VALUES( 3,'Abrikosov A.A.', 'Head Chief of Medicine',  'Dermogastrotomy');
--SET IDENTITY_INSERT Employeers OFF;
--GO

------EmployeersIn Cabinets--------

IF OBJECT_ID('EmpInCabinets', 'U') IS NOT NULL
DROP TABLE EmpInCabinets;
CREATE TABLE dbo.EmpInCabinets
(
EmpInCabinetsId int not null IDENTITY(1,1) primary key,
EmpId int not null FOREIGN KEY REFERENCES dbo.Employeers(EmpId),
CabinetId int not null FOREIGN KEY REFERENCES dbo.Cabinets(CabinetId)
);
GO

------------Procedures--------
IF OBJECT_ID('Procedures', 'U') IS NOT NULL
DROP TABLE Procedures;
CREATE TABLE dbo.Procedures
(
ProcId int not null IDENTITY(1,1) primary key,
ProcName VARCHAR(64) NOT NULL,
ProcDuration Time,
ProcDescription VARCHAR(128) NOT NULL,
ProcCost money not null DEFAULT(0),
);
GO
SET IDENTITY_INSERT Procedures ON;
INSERT INTO Procedures(ProcId, ProcName, ProcDuration, ProcDescription,ProcCost)
VALUES( 1,'Massage', '00:30:00', 'Aroma massage', 55.99);
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

-----------Proc in Cabinets--------
IF OBJECT_ID('ProcInCabinets', 'U') IS NOT NULL
DROP TABLE ProcInCabinets;
CREATE TABLE dbo.ProcInCabinets
(
ProcInCabId int not null IDENTITY(1,1) primary key,
ProcId int not null FOREIGN KEY REFERENCES dbo.Procedures(ProcId),
CabinetId int not null FOREIGN KEY REFERENCES dbo.Cabinets(CabinetId),
--ClientId int not null FOREIGN KEY REFERENCES dbo.Clients(ClientId),
--StartTime time,
--FinishTime time

);
GO

-----------Clients on Procedures--------
IF OBJECT_ID('ClientOnProc', 'U') IS NOT NULL
DROP TABLE ClientOnProc;
CREATE TABLE dbo.ClientOnProc
(
ClientOnProcId int not null IDENTITY(1,1) primary key,
ProcId int not null FOREIGN KEY REFERENCES dbo.Procedures(ProcId),
CabinetId int not null FOREIGN KEY REFERENCES dbo.Cabinets(CabinetId),
ClientId int not null FOREIGN KEY REFERENCES dbo.Clients(ClientId),
StartTime time,
FinishTime time

);
GO