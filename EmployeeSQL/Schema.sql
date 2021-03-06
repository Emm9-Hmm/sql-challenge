drop table if exists titles cascade;
drop table if exists employees cascade;
drop table if exists salaries cascade;
drop table if exists Departments cascade;
drop table if exists dept_manager cascade;
drop table if exists dept_emp cascade;

CREATE TABLE Titles (
    title_id varchar   NOT NULL,
    title varchar(30)   NOT NULL,
    PRIMARY KEY (title_id)
);

CREATE TABLE Employees (
    emp_no INTEGER   NOT NULL,
    emp_title_id varchar   NOT NULL,
	birth_date date,
    first_Name VARCHAR   NOT NULL,
    last_Name VARCHAR   NOT NULL,
    sex VARCHAR,
	hire_date date,
    PRIMARY KEY (emp_no),
    FOREIGN KEY(emp_title_id) REFERENCES Titles (title_id)
);

CREATE TABLE Salaries (
    emp_no INTEGER   NOT NULL,
    salary MONEY   NOT NULL,
    FOREIGN KEY(emp_no) REFERENCES Employees (emp_no)
);

CREATE TABLE Departments (
    dept_no varchar   NOT NULL,
    dept_name VARCHAR   NOT NULL,
    PRIMARY KEY (dept_no)
);

CREATE TABLE Dept_manager (
    dept_no varchar   NOT NULL,
    emp_no INTEGER   NOT NULL,
    FOREIGN KEY(dept_no) REFERENCES Departments (dept_no),
    FOREIGN KEY(emp_no) REFERENCES Employees (emp_no)
);

CREATE TABLE Dept_emp (
    emp_no INTEGER   NOT NULL,
    dept_no varchar   NOT NULL,
    FOREIGN KEY(emp_no) REFERENCES Employees (emp_no),
    FOREIGN KEY(dept_no) REFERENCES Departments (dept_no)
);