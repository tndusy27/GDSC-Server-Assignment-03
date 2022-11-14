/* 전체 재실행해도 오류 없게끔 지웠다가 새로 생성*/
DROP DATABASE hw3;

/* 데이터베이스 생성 hw3 */
CREATE DATABASE hw3;

/* 데이터베이스 선택 */
use hw3;

/* 
    테이블 생성
    student : 학생 테이블 (학번(PK), 이름, 학과)
    class : 과목 테이블 (과목코드(PK), 과목이름, 교수이름)
    history : 수강(기록) (기록번호(PK), 학번(FK), 과목코드(FK), 점수(등급))
    => 수강 테이블을 수강 기록으로 생각하고 설계했음
    
    student 테이블에서 학번(student_id)은 학생마다 고유하기 때문에 기본키로 설정
    class 테이블에서 과목마다 과목코드(class_id)는 모두 다르기 때문에 기본키로 설정
    history는 student의 student_id와 class의 class_id를 외래키로 받아옴
    그리고 따로 기록마다 고유번호(history_id)를 붙여서 기본키로 설정했음
    (만든 테이블로는 학번 + 과목코드로 유일한 행을 식별할 수 없다고 판단함 : 재수강 등)
    
    관계를 하나씩 살펴보면
    student와 history는 1:N 관계, 같은 학생이 여러 개의 수강 기록을 만들 수는 있지만,
							    한 기록에 두 명 이상의 학생은 존재할 수 없음
	class와 histroy는 1:N 관계, student와 마찬가지로 한 기록에 두 개 이상의 과목은 존재 불가
    따라서 이 테이블들의 관계는 N:M 관계
 */
 CREATE TABLE student
(
   student_id INT PRIMARY KEY,
   name VARCHAR(20) NOT NULL,
   department VARCHAR(20) NOT NULL
);
 
CREATE TABLE class
(
   class_id VARCHAR(20) PRIMARY KEY,
   class_name VARCHAR(20) NOT NULL,
   professor_name VARCHAR(20) NOT NULL
);

CREATE TABLE history
(
   history_id VARCHAR(20) PRIMARY KEY,
   student_id INT NOT NULL,
   class_id VARCHAR(20) NOT NULL,
   grade VARCHAR(5) NOT NULL,
   FOREIGN KEY (student_id) REFERENCES student(student_id),
   FOREIGN KEY (class_id) REFERENCES class(class_id)
);

/* 데이터 삽입 */
INSERT INTO student (student_id, name, department) VALUES
(201914133, '방예혁', 'IT융합자율학부'),
(202020202, '홍길동', '인문융합자율학부'),
(202101202, '유재석', '사회융합자율학부');

INSERT INTO class (class_id, class_name, professor_name) VALUES
('A001', 'Java프로그래밍', '이하규'),
('A002', '이산수학', '윤명호'),
('B002', '영어문장이해Ⅱ', '김성찬'),
('B043', '거시경제학', '유철규'),
('C003', '복지국가론', '김연아');

INSERT INTO history (history_id, student_id, class_id, grade) VALUES
(1, 201914133, 'A001', 'A+'),
(2, 202020202, 'B002', 'B'),
(3, 202101202, 'C003', 'A'),
(4, 201914133, 'A002', 'A+'),
(5, 202101202, 'B043', 'C+'),
(6, 202020202, 'A001', 'B+'),
(7, 201914133, 'B043', 'C+'),
(8, 202020202, 'C003', 'A+');

/* 조인 연산, 데이터 출력 스키마 중복x */
SELECT h.*, s.name, s.department, c.class_name, c.professor_name
FROM history h JOIN student s ON h.student_id = s.student_id
			   JOIN class c ON h.class_id = c.class_id



