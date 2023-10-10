CREATE TABLE Student
(
    id       BIGINT,
    name     VARCHAR,
    birthday DATE,
    "group"  INT,
    PRIMARY KEY (id)
);
CREATE TABLE Subject
(
    id          BIGINT,
    name        VARCHAR,
    description VARCHAR,
    grade       INT,
    PRIMARY KEY (id)
);
CREATE TABLE PaymentType
(
    id   BIGINT,
    name VARCHAR,
    PRIMARY KEY (id)
);
CREATE TABLE Payment
(
    id BIGINT,
    type_id BIGINT,
    amount DECIMAL,
    student_id BIGINT,
    payment_date DATETIME,
    PRIMARY KEY (id),
    FOREIGN KEY (type_id) REFERENCES PaymentType(id),
    FOREIGN KEY (student_id) REFERENCES Student(id)
);
CREATE TABLE Mark
(
    id BIGINT,
    student_id BIGINT,
    subject_id BIGINT,
    mark INT,
    PRIMARY KEY (id),
    FOREIGN KEY (student_id) REFERENCES Student(id),
    FOREIGN KEY (subject_id) REFERENCES Subject(id)
);

//DROP TABLE STUDENT;