CREATE TABLE FiscalYearTable1
(
  fiscal_year_id  INTEGER NOT NULL,
  fiscal_year     INTEGER NOT NULL,
  start_date      DATE    NOT NULL,
  end_date        DATE    NOT NULL,
  CONSTRAINT check_dates CHECK (start_date < end_date),
  CONSTRAINT pk_fiscal_year PRIMARY KEY (fiscal_year_id)
);