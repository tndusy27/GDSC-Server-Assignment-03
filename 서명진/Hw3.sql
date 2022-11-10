create database Hw3;
use Hw3;
create table student(id int primary key, name varchar(30) not null, studentNo int);

create table subject(id int primary key, name varchar(30) not null, departmentName varchar(30) not null);

create table signUp(studentId int, subjectId int, credit int not null, primary key(studentId,subjectId));

insert into student(id, name , studentNo) values(1,'서명진',202014132);
alter table subject modify column id varchar(20);
alter table signUp modify column subjectid varchar(20);

insert into subject(id,name,departmentName) values('XB00027','백엔드프레임워크','소프트웨어공학') ,
('XB00008','웹프로그래밍','소프트웨어공학'), ('XB00028','Java 프로젝트','소프트웨어공학'),
('AE00097','한국경제의 이해','교양'),('XB00024','네트워크 프로그래밍','소프트웨어공학'),
('XB00026','서버구축및형상관리','소프트웨어공학');

insert into signUp(studentId, subjectId, credit) values(1,'XB00027',3),
(1,'XB00008',3),(1,'XB00028',3),(1,'AE00097',3),(1,'XB00024',3),(1,'XB00026',3);

select st.studentNo,st.name studentName,  su.name subjectName, su.departmentName,si.* from signUp si
join student st on si.studentId = st.id join subject su on su.id = si.subjectId;