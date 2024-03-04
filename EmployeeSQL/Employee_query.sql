CREATE TABLE "departments" (
    "dept_no" VARCHAR(5)   NOT NULL,
    "dept_name" VARCHAR(20)   NOT NULL,
    CONSTRAINT "departments_prikey" PRIMARY KEY ("dept_no")
);


CREATE TABLE "dept_emp" (
    "emp_no" INT NOT NULL,
    "dept_no" VARCHAR(10) NOT NULL
);


CREATE TABLE "dept_manager" (
    "dept_no" VARCHAR(10) NOT NULL,
    "emp_no" INT NOT NULL
);


CREATE TABLE "employees" (
    "emp_no" INT NOT NULL,
    "emp_title_id" VARCHAR(10)  NOT NULL,
    "birth_date" DATA NOT NULL,
    "first_name" VARCHAR(50)  NOT NULL,
    "last_name" VARCHAR(50)  NOT NULL,
    "sex" VARCHAR(5)  NOT NULL,
    "hire_date" DATA  NOT NULL,
    CONSTRAINT "employees_prikey" PRIMARY KEY ("emp_no")
);

CREATE TABLE "salaries" (
    "emp_no" INT  NOT NULL,
    "salary" INT  NOT NULL
);


CREATE TABLE "titles" (
    "title_id" VARCHAR(10) NOT NULL,
    "title" VARCHAR(30) NOT NULL,
    CONSTRAINT "titles_prikey" PRIMARY KEY ("title_id")
);

ALTER TABLE "dept_emp" ADD CONSTRAINT "forkey_dept_emp_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "dept_emp" ADD CONSTRAINT "forkey_dept_emp_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "forkey_dept_manager_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "salaries" ADD CONSTRAINT "forkey_salaries_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "forkey_dept_manager_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "employees" ADD CONSTRAINT "forkey_employees_emp_title_id" FOREIGN KEY("emp_title_id")
REFERENCES "titles" ("title_id");