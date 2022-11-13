CREATE DATABASE 성은;

USE 성은;
CREATE TABLE 학생(id INT PRIMARY KEY , name VARCHAR(30), birth_date DATE);
CREATE TABLE 과목(cid INT PRIMARY KEY, cname VARCHAR(30), professor VARCHAR(30));

CREATE TABLE 수강
(
    enroll_date DATE,
    student_id INT,
    class_id INT,
    foreign key(student_id) references 학생(id),
    foreign key(class_id) references 과목(cid));

INSERT INTO 학생(id, name, birth_date) VALUES
                                                      (2020001, '곽성은', '2001-07-20'),
                                                      (2020002, '김윤지', '2001-05-14'),
                                                      (2020003, '이민주', '2001-03-15');
INSERT INTO 과목(cid, cname, professor) VALUES
                                              (001, '자료구조', '홍은지'),
                                              (002, '운영체제', '노은하'),
                                              (003, 'Java프로그래밍', '임충규');
INSERT INTO 수강(enroll_date, student_id, class_id) VALUES
                                          ('2022-02-15', 2020001, 001),
                                          ('2022-02-15', 2020002, 001),
                                          ('2022-02-17', 2020003, 003);
select * from 수강 join 학생 on 수강.student_id = 학생.id;
select * from 수강 join 과목 on 수강.class_id = 과목.cid;
SHOW COLUMNS FROM 수강;