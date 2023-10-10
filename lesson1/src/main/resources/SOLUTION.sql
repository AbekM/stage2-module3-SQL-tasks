CREATE TABLE Student
(
    id       BIGINT AUTO_INCREMENT PRIMARY KEY,
    name     VARCHAR,
    birthday DATE,
    "group"  INT
);
CREATE TABLE Subject
(
    id          BIGINT AUTO_INCREMENT PRIMARY KEY,
    name        VARCHAR,
    description VARCHAR,
    grade       INT
);
CREATE TABLE PaymentType
(
    id   BIGINT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR
);

CREATE TABLE Payment
(
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    type_id BIGINT,
    amount DECIMAL,
    student_id BIGINT,
    payment_date DATETIME,
    FOREIGN KEY (type_id) REFERENCES PaymentType(id),
    FOREIGN KEY (student_id) REFERENCES Student(id)
);
CREATE TABLE Mark
(
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    student_id BIGINT,
    subject_id BIGINT,
    mark INT,
    FOREIGN KEY (student_id) REFERENCES Student(id),
    FOREIGN KEY (subject_id) REFERENCES Subject(id)
);
//grade1
INSERT INTO Student(name) VALUES ('John');
INSERT INTO Student(name) VALUES ('Chris');
INSERT INTO Student(name) VALUES ('Carl');
//grade2
INSERT INTO Student(name) VALUES ('Oliver');
INSERT INTO Student(name) VALUES ('James');
INSERT INTO Student(name) VALUES ('Lucas');
INSERT INTO Student(name) VALUES ('Henry');
//grade3
INSERT INTO Student(name) VALUES ('Jacob');
INSERT INTO Student(name) VALUES ('Logan');
//grade4
INSERT INTO Student(name) VALUES ('Aziz');
INSERT INTO Student(name) VALUES ('Jon');
//grade5
INSERT INTO Student(name) VALUES ('Lena');
INSERT INTO Student(name) VALUES ('Elena');

INSERT INTO Subject(name, grade) VALUES ( 'Art and music', 1 );
INSERT INTO Subject(name, grade) VALUES ( 'Geography and history', 2 );
INSERT INTO Subject(name, grade) VALUES ( 'PE and math', 3 );
INSERT INTO Subject(name, grade) VALUES ( 'Science and IT', 4 );
INSERT INTO Subject(name, grade) VALUES ( 'Labor', 5 );
INSERT INTO Subject(name, grade) VALUES ( 'Painting', 5 );

/* Drop table Student;
DELETE FROM Student ;*/

