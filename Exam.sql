create database EmployeeDB;
use EmployeeDB;

create table Department (
Departld int primary key identity(1,1),
DepartName varchar(50) not null,
Description varchar(100) not null
);

create table Employee(
Empcode char(6) primary key, 
FirstName varchar(30) not null,
LastName varchar(30) not null,
Birthday smalldatetime not null,
Gender Bit default 1,
Address varchar(100),
DepartID int foreign key references Department(Departld),
Salary decimal(16,0)
);
--drop table Department;
--drop table Employee;

insert into Department (DepartName,Description)
values('Flight to Italy','Trip to Italy');
insert into Department (DepartName,Description)
values('Flight to France','Trip to France');
insert into Department (DepartName,Description)
values('Flight to Germany','Trip to Germany');


insert into Employee(Empcode,FirstName,LastName,Birthday,Gender,Address,Salary)
values('T2204FT','Nhat','Long','2000-09-03',0,'Italy',20000);
insert into Employee(Empcode,FirstName,LastName,Birthday,Gender,Address,Salary)
values('T22043T','Phan','Ha','1990-09-07',0,'France',10000);
insert into Employee(Empcode,FirstName,LastName,Birthday,Gender,Address,Salary)
values('T22023FT','Nguyen','Phuong','1998-05-06',0,'Germany',16000);


update Employee set Salary = Salary+(Salary*10/100);

alter table Salary
add constraint CK_Salary check(Salary>0)

--create trigger tg_chkBirthday

create index IX_DepartmentName on Department(DepartName);

create view V_Epl_Dpm as 
select FirstName,LastName,DepartName from Employee as e join Department as d on e.DepartID = d.Id 

alter procedure sp_getAllEmp @ID char(6) as 
select * from Employee where DepartID in 
(select Id from  Department where Id = 
(select DepartID from Employee where  EmpCode = @ID ))

exec sp_getAllEmp @ID = 'T2204FT'


create procedure sp_delDept @ID char(6) as 
delete from Employee where EmpCode = @ID

exec sp_delDept @ID = 'T2204FT'

select * from Employee
select * from Department