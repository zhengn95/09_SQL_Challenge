-- Data Engineering: Table Creation
CREATE TABLE departments(
    dept_no         VARCHAR(4)          NOT NULL        PRIMARY KEY,
    dept_name       VARCHAR(40)         NOT NULL
);

CREATE TABLE titles(
    title_id        VARCHAR(5)          NOT NULL        PRIMARY KEY,
    title           VARCHAR(50)         NOT NULL        
);

CREATE TABLE employee(
    emp_no          INT                 NOT NULL        PRIMARY KEY,
    emp_title_id    VARCHAR(5)          NOT NULL,
    birth_date      DATE                NOT NULL,
    first_name      VARCHAR(50)         NOT NULL,
    last_name       VARCHAR(50)         NOT NULL,
    sex             VARCHAR(1)          NOT NULL,
    hire_date       DATE                NOT NULL,
    FOREIGN KEY(emp_title_id) REFERENCES titles(title_id)
);

CREATE TABLE salaries(
	emp_no			INT					NOT NULL,
	salary			INT					NOT NULL,
	PRIMARY KEY(emp_no, salary),
	FOREIGN KEY(emp_no) REFERENCES employee(emp_no)
);

CREATE TABLE dept_emp(
    emp_no          INT                 NOT NULL,
    dept_no         VARCHAR(4)          NOT NULL,
    PRIMARY KEY(emp_no, dept_no), 
    FOREIGN KEY(emp_no) REFERENCES employee(emp_no),
    FOREIGN KEY(dept_no) REFERENCES departments(dept_no)
);

CREATE TABLE dept_manager(
    dept_no         VARCHAR(4)          NOT NULL,
    emp_no          INT                 NOT NULL,
    PRIMARY KEY(dept_no, emp_no), 
    FOREIGN KEY(emp_no) REFERENCES employee(emp_no),
    FOREIGN KEY(dept_no) REFERENCES departments(dept_no)
);
