CREATE TABLE Student
(
    id       BIGINT AUTO_INCREMENT PRIMARY KEY,
    name     VARCHAR,
    birthday DATE NOT NULL,
    "group"  INT
);
CREATE TABLE Subject
(
    id          BIGINT AUTO_INCREMENT PRIMARY KEY,
    name        VARCHAR,
    description VARCHAR,
    grade       INT CHECK (grade >= 1 AND grade <= 5)
);
CREATE TABLE PaymentType
(
    id   BIGINT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR UNIQUE
);

CREATE TABLE Payment
(
    id           BIGINT AUTO_INCREMENT PRIMARY KEY,
    type_id      BIGINT NOT NULL,
    amount       DECIMAL,
    student_id   BIGINT,
    payment_date DATETIME,
    FOREIGN KEY (type_id) REFERENCES PaymentType (id),
    FOREIGN KEY (student_id) REFERENCES Student (id)
);
CREATE TABLE Mark
(
    id         BIGINT AUTO_INCREMENT PRIMARY KEY,
    student_id BIGINT NOT NULL,
    subject_id BIGINT NOT NULL,
    mark       INT CHECK (mark >= 1 AND mark <= 10),
    FOREIGN KEY (student_id) REFERENCES Student (id),
    FOREIGN KEY (subject_id) REFERENCES Subject (id)
);
//grade1
INSERT INTO Student(name, birthday)
VALUES ('John', '2000-01-01');
INSERT INTO Student(name, birthday)
VALUES ('Chris', '2000-01-01');
INSERT INTO Student(name, birthday)
VALUES ('Carl', '2000-01-01');
//grade2
INSERT INTO Student(name, birthday)
VALUES ('Oliver', '2000-01-01');
INSERT INTO Student(name, birthday)
VALUES ('James', '2000-01-01');
INSERT INTO Student(name, birthday)
VALUES ('Lucas', '2000-01-01');
INSERT INTO Student(name, birthday)
VALUES ('Henry', '2000-01-01');
//grade3
INSERT INTO Student(name, birthday)
VALUES ('Jacob', '2000-01-01');
INSERT INTO Student(name, birthday)
VALUES ('Logan', '2000-01-01');
//grade4
INSERT INTO Student(name, birthday)
VALUES ('Aziz', '2000-01-01');
INSERT INTO Student(name, birthday)
VALUES ('Jon', '2000-01-01');
//grade5
INSERT INTO Student(name, birthday)
VALUES ('Lena', '2000-01-01');
INSERT INTO Student(name, birthday)
VALUES ('Elena', '2000-01-01');
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
INSERT INTO Payment(type_id, student_id)
VALUES (2, 1);
INSERT INTO Payment(type_id, student_id)
VALUES (3, 4);
INSERT INTO Payment(type_id, student_id)
VALUES (2, 7);
INSERT INTO Payment(type_id, student_id)
VALUES (1, 5);
INSERT INTO Payment(type_id, student_id)
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
//task4
SELECT *
FROM Student;
SELECT *
FROM Student
LIMIT 50;
SELECT name
FROM Student;
SELECT DISTINCT amount
FROM Payment;
//task5
SELECT *
FROM Payment
WHERE amount >= 500;
SELECT *
FROM Student
WHERE DATEADD('YEAR', 20, birthday) < CURRENT_DATE;
SELECT *
FROM Student
WHERE "group" = 10
  AND DATEADD('YEAR', 20, birthday) > CURRENT_DATE;
SELECT *
FROM Student
WHERE name = 'Mike'
   OR "group" IN (4, 5, 6);
SELECT *
FROM Payment
WHERE DATEADD('MONTH', -8, CURRENT_DATE) <= payment_date;
SELECT *
FROM Student
WHERE name LIKE 'A%';
SELECT *
FROM Student
WHERE (name = 'Roxi' AND "group" = 6)
   OR (name = 'Tallie' AND "group" = 9);
//task6
SELECT *
FROM Payment
WHERE type_id = (SELECT id FROM PaymentType WHERE name = 'MONTHLY');
SELECT *
FROM Mark
WHERE subject_id = (SELECT id FROM Subject WHERE name = 'Art');
SELECT *
FROM Student
         JOIN Payment P on Student.id = P.student_id
WHERE P.type_id = (SELECT id FROM PaymentType WHERE name = 'WEEKLY');
SELECT *
FROM Student
         JOIN Mark M on Student.id = M.student_id AND subject_id = (SELECT id FROM Subject WHERE Subject.name = 'Math');
//task7
SELECT *
FROM Mark
WHERE mark > 6
ORDER BY mark DESC;
SELECT *
FROM Payment
WHERE amount < 300
ORDER BY amount;
SELECT *
FROM PaymentType
ORDER BY name;
SELECT *
FROM Student
ORDER BY name DESC;
SELECT *
FROM Student
         JOIN Payment P on Student.id = P.student_id
WHERE p.amount > 1000
ORDER BY birthday;
//task8
SELECT MIN(birthday)
FROM Student;
SELECT MIN(payment_date)
FROM Payment;
SELECT AVG(mark)
FROM Mark
WHERE subject_id = (SELECT id FROM Subject WHERE name = 'Math');
SELECT MIN(amount)
FROM Payment
         JOIN PaymentType PT on PT.id = Payment.type_id
WHERE pt.name = 'WEEKLY';
//task9
INSERT INTO Payment(type_id, amount, student_id, payment_date)
VALUES (1, 2, 4, '2019-04-05');
SELECT *
FROM Student s
         JOIN (SELECT student_id, AVG(mark) as average_mark FROM Mark GROUP BY student_id HAVING AVG(mark) > 8)
              ON s.id = student_id;
SELECT DISTINCT id, name
FROM Student s
         JOIN (SELECT student_id, MIN(mark) as minimum_mark FROM Mark GROUP BY student_id HAVING MIN(mark) > 7)
              ON s.id = student_id;
SELECT id, name
FROM Student s
         JOIN (SELECT student_id, COUNT(*) as payment_count
               FROM Payment
               WHERE YEAR(payment_date) = 2019
               GROUP BY student_id

               HAVING COUNT(*) > 2) ON s.id = student_id;
SELECT student_id, COUNT(*) as payment_count
FROM Payment
WHERE YEAR(payment_date) = 2019
GROUP BY student_id
HAVING COUNT(*) > 2
