-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/CdjuaW
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "Departments" (
    "dept_number" VARCHAR(255)   NOT NULL,
    "dept_name" VARCHAR(255)   NOT NULL,
    CONSTRAINT "pk_Departments" PRIMARY KEY (
        "dept_number"
     )
);

CREATE TABLE "Dept_Emp" (
    "emp_number" INT   NOT NULL,
    "dept_number" VARCHAR(255)   NOT NULL,
    CONSTRAINT "pk_Dept_Emp" PRIMARY KEY (
        "emp_number"
     )
);

CREATE TABLE "Dept_Manager" (
    "dept_number" VARCHAR(255)   NOT NULL,
    "emp_number" INT   NOT NULL,
    CONSTRAINT "pk_Dept_Manager" PRIMARY KEY (
        "dept_number"
     )
);

CREATE TABLE "Employees" (
    "emp_number" INT   NOT NULL,
    "emp_title_id" VARCHAR(255)   NOT NULL,
    "birth_date" DATE   NOT NULL,
    "first_name" VARCHAR(255)   NOT NULL,
    "last_name" VARCHAR(255)   NOT NULL,
    "sex" VARCHAR(255)   NOT NULL,
    "hire_date" DATE   NOT NULL,
    "dept_number" VARCHAR(30)   NOT NULL,
    CONSTRAINT "pk_Employees" PRIMARY KEY (
        "emp_number"
     )
);

CREATE TABLE "Salaries" (
    "emp_no" INT   NOT NULL,
    "salary" INT   NOT NULL,
    "dept_number" VARCHAR(30)   NOT NULL,
    CONSTRAINT "pk_Salaries" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "Titles" (
    "title_id" VARCHAR(30)   NOT NULL,
    "title" VARCHAR(255)   NOT NULL,
    "dept_number" VARCHAR(30)   NOT NULL,
    "emp_number" INT   NOT NULL,
    "emp_title_id" VARCHAR(255)   NOT NULL,
    CONSTRAINT "pk_Titles" PRIMARY KEY (
        "title_id"
     )
);

ALTER TABLE "Employees" ADD CONSTRAINT "fk_Employees__dept_number" FOREIGN KEY("", "dept_number")
REFERENCES "Departments" ("", "dept_number");

ALTER TABLE "Salaries" ADD CONSTRAINT "fk_Salaries_dept_number" FOREIGN KEY("dept_number")
REFERENCES "Departments" ("dept_number");

ALTER TABLE "Titles" ADD CONSTRAINT "fk_Titles_dept_number" FOREIGN KEY("dept_number")
REFERENCES "Departments" ("dept_number");

ALTER TABLE "Titles" ADD CONSTRAINT "fk_Titles_emp_number_emp_title_id" FOREIGN KEY("emp_number", "emp_title_id")
REFERENCES "Employees" ("emp_number", "emp_title_id");

