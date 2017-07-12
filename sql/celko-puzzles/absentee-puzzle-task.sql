DROP TABLE Absenteeism;
DROP TABLE ExcuseList;
DROP TABLE Personel;

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