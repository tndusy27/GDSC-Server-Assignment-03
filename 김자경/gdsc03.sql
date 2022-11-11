/* 데이터베이스 선택 */
use gdsc;

/* 데이터베이스가 제대로 생성되었는지 확인*/
show databases;

/* 학생 테이블 생성 */
create table student (num int primary key, name varchar(30) not null, department varchar(30));
show columns from student;

/* 과목 테이블 생성 */
create table major (code int primary key, subject varchar(30) not null, credit int, professor varchar(30), class varchar(30));
show columns from major;

/* 수강 테이블 생성 */
create table course(id int primary key, num int not null, code int not null, constraint fk_num foreign key(num) references student(num), constraint fk_code foreign key(code) references major(code));
show columns from course;

/* 학생 테이블에 데이터 삽입 */
insert into student(num, name, department) values (202014105, '김수연', '정보통신공학과'), (202014129, '김자경', '정보통신공학과'), (202014132, '서명진', '소프트웨어공학과'), (202014148, '조성우', '영어영문학과');
select * from student;

/* 과목 테이블에 데이터 삽입 */
insert into major(code, subject, credit, professor, class) values (1, '웹 프로그래밍', 3, '이승진', '6202'), (2, '사물인터넷', 3, '정인철', '6406'), (3, '마을 만들기', 2, '한지수', 'M205');
select * from major;

/* 수강 테이블에 데이터 삽입 */
insert into course(id, num, code) values (1, 202014105, 1), (2, 202014105, 2), (3, 202014105, 3), (4, 202014129, 1), (5, 202014129, 2), (6, 202014129, 3), (7, 202014132, 1), (8, 202014132, 2), (9, 202014148, 1);

/* 수강 테이블과 학생 테이블 JOIN */
select * from course c join student s on c.num = s.num;
select * from student;

/* 수강 테이블과 과목 테이블 JOIN */
select * from course c join major m on c.code = m.code;
select * from major;