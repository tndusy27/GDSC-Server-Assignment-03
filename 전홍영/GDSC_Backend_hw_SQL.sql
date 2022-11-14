/*
기존의 데이터 베이스 삭제 후 재생성
*/
drop database hw_3;
create database hw_3;
/*
hw_3 데이터베이스 사용
*/
use hw_3;
/*
student 테이블 생성
column
student_id (학번)을 primary key로 지정
major(전공)
student_name(이름)
*/
create table student
(
    student_id   varchar(30) primary key,
    major        varchar(30) not null,
    student_name varchar(30) not null
);
/*
student 테이블에 데이터 입력
*/
insert into student
values ('201814100', 'IT융합자율학부', '전홍영'),
       ('202013100', '사회융합자율학부', '홍길동'),
       ('202214050', '인문융합자율학부', '아무개');
/*
class 테이블 생성
column
class_id (과목코드)를 primary key로 지정
class_name (과목명)
professor_name (교수)
*/
create table class
(
    class_id       varchar(30) primary key,
    class_name     varchar(30),
    professor_name varchar(30)
);
/*
class 테이블에 데이터 입력
*/
insert into class
values ('XB00022', '빅데이터실무', '장진웅'),
       ('XC00024', 'C++프로그래밍', '이하규'),
       ('XC00031', '정보보호개론', '이종현');
/*
sugang 테이블 생성
column
sugang_id (수강번호)를 primary 키로 지정
student_id를 student 테이블의 student_id 필드를 참조하는 foreign key 제약 조건을 설정
class_id를 class 테이블의 class_id 필드를 참조하는 foreign key 제약 조건을 설정
*/
create table sugang
(
    sugnag_id  int primary key,
    student_id varchar(30),
    foreign key (student_id) REFERENCES student (student_id),
    class_id   varchar(30),
    foreign key (class_id) REFERENCES class (class_id)
);
/*
sugnag 테이블 데이터 입력
*/
insert into sugang
values ('1', '201814100', 'XC00024'),
       ('2', '201814100', 'XB00022'),
       ('3', '201814100', 'XC00031');
/*
sugang 테이블과 class, student 테이블을 join하여 조회
*/
select *
from sugang
         join class c on sugang.class_id = c.class_id
         join student s on sugang.student_id = s.student_id;
