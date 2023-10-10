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

CREATE TABLE Payments
(
    id           BIGINT AUTO_INCREMENT PRIMARY KEY,
    type_id      BIGINT,
    amount       DECIMAL,
    student_id   BIGINT,
    payment_date DATETIME,
    FOREIGN KEY (type_id) REFERENCES PaymentType (id),
    FOREIGN KEY (student_id) REFERENCES Student (id)
);
CREATE TABLE Mark
(
    id         BIGINT AUTO_INCREMENT PRIMARY KEY,
    student_id BIGINT,
    subject_id BIGINT,
    mark       INT,
    FOREIGN KEY (student_id) REFERENCES Student (id),
    FOREIGN KEY (subject_id) REFERENCES Subject (id)
);
//grade1
INSERT INTO Student(name)
VALUES ('John');
INSERT INTO Student(name)
VALUES ('Chris');
INSERT INTO Student(name)
VALUES ('Carl');
//grade2
INSERT INTO Student(name)
VALUES ('Oliver');
INSERT INTO Student(name)
VALUES ('James');
INSERT INTO Student(name)
VALUES ('Lucas');
INSERT INTO Student(name)
VALUES ('Henry');
//grade3
INSERT INTO Student(name)
VALUES ('Jacob');
INSERT INTO Student(name)
VALUES ('Logan');
//grade4
INSERT INTO Student(name)
VALUES ('Aziz');
INSERT INTO Student(name)
VALUES ('Jon');
//grade5
INSERT INTO Student(name)
VALUES ('Lena');
INSERT INTO Student(name)
VALUES ('Elena');
//subjects
INSERT INTO Subject(name, grade)
VALUES ('Art', 1);
INSERT INTO Subject(name, grade)
VALUES ('Music', 1);
INSERT INTO Subject(name, grade)
VALUES ('Geography', 2);
INSERT INTO Subject(name, grade)
VALUES ('History', 2);
INSERT INTO Subject(name, grade)
VALUES ('PE', 3);
INSERT INTO Subject(name, grade)
VALUES ('Math', 3);
INSERT INTO Subject(name, grade)
VALUES ('Science', 4);
INSERT INTO Subject(name, grade)
VALUES ('IT', 4);
INSERT INTO Subject(name, grade)
VALUES ('Labor', 5);
INSERT INTO Subject(name, grade)
VALUES ('Painting', 5);
//Payment types
INSERT INTO PaymentType(name)
VALUES ('DAILY');
INSERT INTO PaymentType(name)
VALUES ('WEEKLY');
INSERT INTO PaymentType(name)
VALUES ('MONTHLY');
//Payments
INSERT INTO Payments(type_id, student_id)
VALUES (2, 1);
INSERT INTO Payments(type_id, student_id)
VALUES (3, 4);
INSERT INTO Payments(type_id, student_id)
VALUES (2, 7);
INSERT INTO Payments(type_id, student_id)
VALUES (1, 5);
INSERT INTO Payments(type_id, student_id)
VALUES (1, 12);
//Marks
INSERT INTO Mark(student_id, subject_id, mark)
VALUES ((SELECT id FROM Student WHERE name = 'Chris'),
        (SELECT id FROM Subject WHERE name = 'Art'),
        8);
INSERT INTO Mark(student_id, subject_id, mark)
VALUES ((SELECT id FROM Student WHERE name = 'Oliver'),
        (SELECT id FROM Subject WHERE name = 'History'),
        5);
INSERT INTO Mark(student_id, subject_id, mark)
VALUES ((SELECT id FROM Student WHERE name = 'James'),
        (SELECT id FROM Subject WHERE name = 'Geography'),
        9);
INSERT INTO Mark(student_id, subject_id, mark)
VALUES ((SELECT id FROM Student WHERE name = 'Jacob'),
        (SELECT id FROM Subject WHERE name = 'Math'),
        4);
INSERT INTO Mark(student_id, subject_id, mark)
VALUES ((SELECT id FROM Student WHERE name = 'Logan'),
        (SELECT id FROM Subject WHERE name = 'PE'),
        9);
INSERT INTO Mark(student_id, subject_id, mark)
VALUES ((SELECT id FROM Student WHERE name = 'Elena'),
        (SELECT id FROM Subject WHERE name = 'IT'),
        1);

-- SELECT * from Subject where name='';


