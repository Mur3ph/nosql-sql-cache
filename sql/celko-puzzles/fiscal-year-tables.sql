-- Adding constraints to Table:
--		1. "NOT NULL" constraint
--		2. "PRIMARY KEY" constraint
--		3. "UNIQUE" constraint
--		4. "CHECK" constraint

CREATE TABLE FiscalYearTable1
(
	fiscal_id										INTEGER NOT NULL,
    fiscal_year 									INTEGER NOT NULL,
    start_date  									DATE NOT NULL,
    end_date    									DATE NOT NULL,
	CONSTRAINT pk_fiscal_year 						PRIMARY KEY(fiscal_id),
	CONSTRAINT unique_start_date 					UNIQUE (start_date),
	CONSTRAINT unique_end_date 						UNIQUE (end_date),
	CONSTRAINT chk_start_date_less_than_end_date 	CHECK (start_date <= end_date),
	CONSTRAINT chk_valid_start_date 				CHECK ((EXTRACT (YEAR FROM start_date) = fiscal_year - 1)),
	CONSTRAINT chk_valid_end_date 					CHECK ((EXTRACT (YEAR FROM end_date) = fiscal_year))
);

INSERT INTO FiscalYearTable1 
VALUES(101, 1967, '1-April-1966', '22-September-1967');

SELECT * 
FROM FiscalYearTable1;

SELECT F1.fiscal_year
FROM FiscalYearTable1 AS F1
WHERE outside_date BETWEEN F1.start_date AND F1.end_date

