drop table Driver cascade constraints;
create table Driver(
ID char(8),
Name varchar2(30) not NULL,
phone_num number(10),
constraints ID_PK PRIMARY KEY(ID));

drop table Car cascade constraints;
create table Car (
car_plate char(7),
model CHAR(4),
dID char(8),
constraints carpalte_PK PRIMARY KEY(car_plate),
constraints dID_Fk1 FOREIGN KEY(dID) REFERENCES Driver(ID));

drop table Appear cascade constraints;
create table Appear (
A_time date,
dID char(8),

constraints dID_PK PRIMARY KEY(dID),
constraints dID_Fk2 FOREIGN KEY(dID) REFERENCES Driver(ID));


drop table Rider cascade constraints;
create table Rider (
ID char(9),
name VARCHAR2(30) not NULL,
phone_num NUMBER(10),
constraints RID_PK PRIMARY KEY(ID));


drop table Payment cascade constraints;
create table Payment (
payment_id char(7),
cash NUMBER(30),
RID char(9),
constraints payId_PK PRIMARY KEY(payment_id),
constraints RID_Fk1 FOREIGN KEY(RID) REFERENCES Rider(ID));


drop table Payment_CC cascade constraints;
create table Payment_CC (
payment_id char(7),
credit_card NUMBER (30),
constraints creditC_pk PRIMARY KEY(credit_card),
constraints payId_FK FOREIGN KEY(payment_id) REFERENCES payment(payment_id));


drop table Location cascade constraints;
create table Location (
P_time date ,
street VARCHAR2(20),
zip NUMBER(8),
RID char (9),
constraints t_Pk PRIMARY KEY(P_time),
constraints RID_Fk2 FOREIGN KEY(RID) REFERENCES Rider(ID));

Alter table Appear add constraints A_time_fk FOREIGN KEY(A_time) REFERENCES Location(P_time); 

insert into Driver VALUES('12345','mohamed',05488392235);
insert into Driver VALUES('11334','ahmed',0588293674);
insert into Driver VALUES('37778','ali',0588997744);

insert into Car VALUES('All3789','2010','12345');
insert into Car VALUES('llk7890','2018','11334');
insert into Car VALUES('kkj3892','2020','37778');

insert into Appear VALUES('12-dec-01 ','12345');
insert into Appear VALUES('13-jan-09','11334');
insert into Appear VALUES('14-may-15 ','37778');

insert into Rider VALUES('33324','salman',0599884476);
insert into Rider VALUES('67890','sara',0594776382);
insert into Rider VALUES('99887','fajr',05874935678);

insert into Payment VALUES('226788',6677588,'33324');
insert into Payment VALUES('455554',4555788,'67890');
insert into Payment VALUES('668900',4667389,'99887');


insert into Payment_CC VALUES('226788',488888889999933);
insert into Payment_CC VALUES('455554',399388877000003);
insert into Payment_CC VALUES('668900',667488890004400);

insert into Location VALUES('12-dec-01','mazar',44564,'33324');
insert into Location VALUES('13-jan-09 ','nada',88744,'67890');
insert into Location VALUES('14-may-15 ','yasmen',46777,'99887');

Select* from driver;

Select zip from Location where street='nada';

Select ID from Driver Where ID ='12345';

Select Car_plate from Car Where Car_plate like '%A______';

Select Name , count(*) from Driver
Group by Name
Having count(*)=1
Order by Name;

Select payment_id , SUM(cash)
from payment
Group by payment_id 
Order by payment_id ;