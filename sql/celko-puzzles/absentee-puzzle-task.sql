DROP TABLE Absenteeism;
DROP TABLE ExcuseList;
DROP TABLE Personel;

TRUNCATE TABLE Absenteeism;
TRUNCATE TABLE ExcuseList;
TRUNCATE TABLE Personel;

DELETE mytablename;

-- Task 2: Missing days at work

CREATE TABLE Personel
(
  employee_id              INTEGER     NOT NULL,
  first_name               VARCHAR(50) NOT NULL,
  last_name                VARCHAR(50)  NOT NULL,
  CONSTRAINT pk_personel   PRIMARY KEY (employee_id)
);

CREATE TABLE ExcuseList
(
  reason_code                   CHAR(40)        NOT NULL,
  employee_id                   INTEGER         NOT NULL,
  excuse                        VARCHAR(100)    NOT NULL,
  CONSTRAINT pk_excuse_list     PRIMARY KEY (reason_code),
  CONSTRAINT fk_personel_excuse FOREIGN KEY (employee_id) REFERENCES Personel
);

CREATE TABLE Absenteeism
(
  employee_id                         INTEGER NOT NULL,
  absent_date                         DATE    NOT NULL,
  reason_code                         CHAR(40)NOT NULL,
  severity_points                     INTEGER NOT NULL,
  CONSTRAINT pk_absenteeism           PRIMARY KEY (employee_id, absent_date),
  CONSTRAINT fk_personel_absent       FOREIGN KEY (employee_id) REFERENCES Personel,
  CONSTRAINT fk_excuse_list_absent    FOREIGN KEY (reason_code) REFERENCES ExcuseList,
  CONSTRAINT ck_severity_points       CHECK (severity_points BETWEEN 0 AND 4)
);

-- INSERTS INTO Personnel table
INSERT INTO Personel (employee_id, first_name, last_name)
  VALUES (1, 'Minnie', 'Wang');
INSERT INTO Personel (employee_id, first_name, last_name)
  VALUES (2, 'Joey', 'TheLips');
INSERT INTO Personel (employee_id, first_name, last_name)
  VALUES (3, 'Joe', 'Bloggs');

-- INSERTS INTO Excuse List table
INSERT INTO ExcuseList (reason_code, employee_id, excuse)
  VALUES ('Hit by beer truck.!', 1, 'Hit by beer truck.!');
INSERT INTO ExcuseList (reason_code, employee_id, excuse)
  VALUES ('Bad hair day!', 2, 'Bad hair day!');
INSERT INTO ExcuseList (reason_code, employee_id, excuse)
  VALUES ('Dog ate my homework!', 3, 'Dog ate my homework!');

-- INSERTS INTO Absenteeism table
INSERT INTO Absenteeism (employee_id, absent_date, reason_code, severity_points)
  VALUES (1, TO_DATE('2016/05/03 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Hit by beer truck.!', 1);
INSERT INTO Absenteeism (employee_id, absent_date, reason_code, severity_points)
  VALUES (2, TO_DATE('2015/05/03 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Bad hair day!', 2);
INSERT INTO Absenteeism (employee_id, absent_date, reason_code, severity_points)
  VALUES (3, TO_DATE('2017/05/03 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 'Dog ate my homework!', 3);
INSERT INTO Absenteeism (employee_id, absent_date, reason_code, severity_points)
  VALUES (1, TO_DATE('03-05-2016 02:03:14', 'dd-mm-yyyy hh24:mi:ss'), 'Hit by beer truck.!', 1);
INSERT INTO Absenteeism (employee_id, absent_date, reason_code, severity_points)
  VALUES (1, TO_DATE('07-09-2015 02:03:14', 'dd-mm-yyyy hh24:mi:ss'), 'Hit by beer truck.!', 4);
  
-- Select statements for Absenteeism table
SELECT *
FROM Absenteeism;

-- Select statements for ExcuseList table
SELECT *
FROM ExcuseList;

-- Select statements for Personel table
SELECT *
FROM Personel;
