DROP TABLE FiscalYearTable1;
DROP TABLE Absenteeism;
DROP TABLE ExcuseList;
DROP TABLE Personel;

-- Task 1: Calculate yearly tax

CREATE TABLE FiscalYearTable1
(
  fiscal_year_id                           INTEGER NOT NULL,
  fiscal_year                              INTEGER NOT NULL,
  start_date                               DATE    NOT NULL,
  end_date                                 DATE    NOT NULL,
  CONSTRAINT pk_fiscal_year                PRIMARY KEY (fiscal_year_id),
  CONSTRAINT ck_dates                      CHECK (start_date < end_date),
  CONSTRAINT ck_is_start_date_year_valid   CHECK ( (EXTRACT(YEAR FROM start_date)) = fiscal_year - 1),
  CONSTRAINT ck_is_start_date_month_valid  CHECK ( (EXTRACT(MONTH FROM start_date)) = 10),
  CONSTRAINT ck_is_start_date_day_valid    CHECK ( (EXTRACT(DAY FROM start_date)) = 01),
  CONSTRAINT ck_is_end_date_year_valid     CHECK ( (EXTRACT(YEAR FROM end_date)) = fiscal_year),
  CONSTRAINT ck_is_end_date_month_valid    CHECK ( (EXTRACT(MONTH FROM end_date)) = 09),
  CONSTRAINT ck_is_end_date_day_valid      CHECK ( (EXTRACT(DAY FROM end_date)) = 30)
);

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