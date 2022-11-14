create database gdsc;

use gdsc;

/* 학생 테이블 생성 */
CREATE TABLE student( StudentId int PRIMARY KEY,
name varchar(20) not null,
email varchar(30),
Major varchar(30)
);

/* 과목 테이블 생성 */
CREATE TABLE subject(
SubjectCode int PRIMARY KEY,
SubjectName varchar(20) not null,
Score varchar(30),
Room varchar(30)
);

/* 수강 테이블 생성 */
CREATE TABLE class(
ID int PRIMARY KEY,
stu_code int not null ,
class_code int not null ,

FOREIGN KEY(stu_code)
REFERENCES student(StudentID),

FOREIGN KEY(class_code)
REFERENCES subject(SubjectCode)

);

/* 학생 테이블에 데이터 넣기 */

INSERT INTO student(StudentId,name,email,Major)
VALUES(202014105, '김수연', 'tndusy27@naver.com', '소프트웨어공학');

INSERT INTO student(StudentId,name,email,Major)
VALUES(202014129, '김자경', 'rlawkrud14@naver.com', '소프트웨어공학');

INSERT INTO student(StudentId,name,email,Major)
VALUES(202014148, '에이스', 'ace@naver.com', '소프트웨어공학');

INSERT INTO student(StudentId,name,email,Major)
VALUES(202014132, '서명진', 'myoungjinseo@naver.com', '정보통신공학');

/* 과목 테이블에 데이터 넣기 */

INSERT INTO subject(SubjectCode,SubjectName,Score,Room)
VALUES(1,'인터넷보안',3,6406);

INSERT INTO subject(SubjectCode,SubjectName,Score,Room)
VALUES(2,'웹프로그래밍',3,6206);

INSERT INTO subject(SubjectCode,SubjectName,Score,Room)
VALUES(3,'사물인터넷',2,6403);

/* 수강 테이블에 데이터 넣기 */

INSERT INTO class(id,stu_code,class_code)
VALUES(1,202014105,1);

INSERT INTO class(id,stu_code,class_code)
VALUES(2,202014129,2);

INSERT INTO class(id,stu_code,class_code)
VALUES(4,202014129,3);

INSERT INTO class(id,stu_code,class_code)
VALUES(3,202014148,3);

INSERT INTO class(id,stu_code,class_code)
VALUES(5,202014129,1);

INSERT INTO class(id,stu_code,class_code)
VALUES(6,202014132,2);

INSERT INTO class(id,stu_code,class_code)
VALUES(7,202014105,2);

/* 수강테이블에 학생 테이블, 과목 테이블 join */

select * from class c join student s on c.stu_code = s.StudentId join subject b on c.class_code=b.SubjectCode;
