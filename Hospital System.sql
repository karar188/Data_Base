create database Hospital;
use Hospital;

CREATE TABLE Patient (
  Patient_Id int ,
  Patient_Name varchar(50),
  Phone_NO int ,
  Address varchar(50),
  Age int ,
  gender varchar (5),
  Room_NO int,
  PRIMARY KEY (Patient_Id)
);

CREATE TABLE Department (
  Department_Id int,
  Department_Name varchar(50),
  Doctor_Id int ,
  PRIMARY KEY (Department_Id)
  
);

CREATE TABLE Rooms (
  Patient_Id int ,
  Room_No int,
  Location varchar(50),
  PRIMARY KEY (Room_No)
 
);

CREATE TABLE Bill (
  Bill_NO int,
  Patient_Name varchar (50),
  Patient_Id int,
  Amount float,
  PRIMARY KEY (Bill_NO)
  
);

CREATE TABLE Receptionist (
  Receptionist_Id int,
  Name varchar (50),
  patient_Id int,
  PRIMARY KEY (Receptionist_Id)
);

CREATE TABLE Doctor (
  Doctor_ID int ,
  Name varchar(50),
  Department varchar(50),
  Specialization varchar(50),
  Phone_No int ,
  Location varchar(50),
  Nurse_Id int,
  PRIMARY KEY (Doctor_ID)
);

CREATE TABLE Nurse (
  Nurse_Name varchar(50),
  Nurse_Id int,
  Specialization varchar(50),
  PRIMARY KEY (Nurse_Id)
 
);


insert into Doctor values (1,'Ali ahmed','dentist','specialist',0125987911,'Giza',5);
insert into Doctor values (2,'Ahmed mohamed','Heart Surgery','Advisor',0105598796,'Alexandia',6);
insert into Doctor values (3,'Ahmed salam','Psychiatry','Senior consultant',012024541,'fayoum',8);
insert into Doctor values (4,'Muhammed magdy','Kidney disease','senior specialist',0128607091,'Cairo',16);
insert into Doctor values (5,'Adham reda','Oncologist','Resident doctor',01119875413,'Nasr City',10);

--To see the tables data after filling it in 
select*      from Doctor;

insert into Nurse values ('Mona Mohamed',5,'Clinical nursing.');
insert into Nurse values ('Seif Ali',16,'Burn Nursing');
insert into Nurse values ('Hamoudi Ahmed',6,'Care of the elderly');
insert into Nurse values ('zainb Nasr',8,'Operations, anesthesia and recovery');
insert into Nurse values ('Hussien Kalifa',10,'Maternity and childhood nursing');

--To see the tables data after filling it in
select*      from Nurse;

insert into Department values (102,'dentist',5);
insert into Department values (589,'Heart Surgery',6);
insert into Department values (789,'Psychiatry',8);
insert into Department values (220,'Kidney disease',16);
insert into Department values (982,'Oncologist',10);

--To see the tables data after filling it in
select *     from Department;

insert into Patient values (2125,'karar Ahmed','01205049601','Giza',40,'Male',505);
insert into Patient values (1055,'Mohammed Ahmed','0120960070','Cairo',68,'Male',680);
insert into Patient values (7852,'Ibrahim Maher','0120103564','Dakahlia',22,'Male',692);
insert into Patient values (9655,'Mohammed Sadek','0150555395','Menoufia',35,'Male',780);
insert into Patient values (8885,'Moataze fayze','0120966600','Alexandia',76,'Male',114);

--To see the tables data after filling it in
select *      from Patient;

insert into Rooms values (1055,680,'second floor');
insert into Rooms values (8885,8885,'Fourth Floor');
insert into Rooms values (2125,505,'Fifth Floor');
insert into Rooms values (9655,780,'First Floor');
insert into Rooms values (7852,692,'Third Floor');

--To see the tables data after filling it in
select *       From Rooms;

insert into Bill values (001978,'Mohamed Sadek',9655,1800.50);
insert into Bill values (008267,'Ibrahim Maher',7852,9540.45);
insert into Bill values (007892,'karar Ahmed',2125,78955.22);
insert into Bill values (005888,'Moataze fayze',8885,55780.80);
insert into Bill values (001866,'Mohammed Ahmed',1055,66372.70);

--To see the tables data after filling it in
select *       from Bill;

insert into Receptionist values (4752,'Nour Mohammed',2125);
insert into Receptionist values (3697,'Aya Emad',1055);
insert into Receptionist values (8410,'Israa Alaa',8885);
insert into Receptionist values (9048,'Rokia Ali',9655);
insert into Receptionist values (7064,'Mostafa Ahmed',7852);

--To see the tables data after filling it in
select *      from Receptionist;

use Hospital;

Select lower(Name)                      From Doctor;
Select Upper(Patient_Name)              From patient;
Select sum(Doctor_Id)                   From Doctor; 
Select Distinct location                From Doctor ; 
Select location,Name                    From Doctor                         order by Location , Name ASC;
Select AVG(Age)                         From Patient;
Select Right (Nurse_Name ,6)            from Nurse;
Select Department_Name ,Department_Id   From Department   order by department_Name,Department_Id;
Select Concat      ('Muhammad','Ali'); 
Select stuff ('Muhammad alaa',1,4,'A.K');
Select   cast(3030.75 As int);
Select nChar (65);  
Select Difference ('Muhammad','Mohammod');  
Select SQRT    (225);
Select Doctor_Id                         From Doctor              union 
Select Nurse_Id                          From  Nurse ;
Select *                                 From patient                         limit5;
Select Max(Amount)                       From Bill;
select Min (Amount)                      From Bill;
Select LEN ('Mona Ahmed');
select CharIndex ('M','Muhammad');

--Select statements using sub query

Select patient_Name ,Amount     From Bill    where Amount >(
Select AVG(amount )                   From Bill
)
Order by Amount DESC;

select * from patient where patient_Id in (select Room_NO from Rooms where Room_NO = patient_Id);

select * from Nurse where Nurse_id in (select Doctor_Id from Doctor where Nurse_id = Doctor_Id);

--Select Statements using Count and Group Functions

Select location  ,count (doctor_Id)   
From Doctor    
Group by location;

Select Bill_NO ,count (Amount)
From Bill
Group by Bill_NO;
  
--Select Statements using different joins

select *        From Doctor inner join Department 
On Doctor . Doctor_Id =Department . Doctor_Id; 

select *        From Doctor left join Department 
On Doctor . Doctor_Id  =  Department . Doctor_Id;

select *        From Doctor right  join Department 
On Doctor . Doctor_Id  =  Department . Doctor_Id;

Select *       From Patient full join Bill 
On Patient . patient_Id = Bill . Patient_Id;

select *       From Patient left join Bill 
On Patient . patient_Id = Bill . Patient_Id;

--Insert statement 

Insert into Doctor (Doctor_id,Name,Department,Specialization,Phone_No,Location,Nurse_Id)
Values (102, 'Ahmed Mohamed', 'surgery','Advisor', 01202454117,' Giza', 15);

Insert into patient (Patient_id, Patient_Name, Phone_No, Address, Age, Gender, Room_No)
Values(15, 'Ali Ahmed', 01283691890, 'Cairo', 20, 'Male', 25 );

Insert into Nurse (Nurse_Name,Nurse_Id,Specialization)
Values('Mai Ali', 150 , 'Dental assistant'); 

Insert into Bill(Bill_No,Patient_Name,Patient_Id,Amount)
Values(0021586,'Mona Ahmed',1588,1530.00);

Insert into Rooms(Patient_Id ,Room_No,  Location)
Values(1972, 982, 'The first floor' );

--Update statements

update Doctor  SET Name ='Omer Ahmed'  Where Doctor_id=102;
update Patient SET Room_No=500         Where Patient_Id =15;
update Nurse   SET Nurse_Id =458       Where Nurse_Name ='Mai Ali';          
update Bill    SET Bill_No = 0087955   Where Patient_Id = 1588;
update Rooms   SET Room_No = 8564      Where Location ='The first floor';

--Delete statements

Delete From doctor     Where Doctor_Id=3;
Delete From Patient    Where Gender ='Male';
Delete From Nurse      Where Nurse_Name ='Mona Mohamed';
Delete From Bill       Where Patient_Name ='Mohamed Sadek';
Delete From Rooms      Where  Patient_Id   =2125; 

