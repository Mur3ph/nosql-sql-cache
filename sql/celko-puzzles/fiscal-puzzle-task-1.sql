DROP TABLE FiscalYearTable1;

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

