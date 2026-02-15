-- Workforce Analytics & Attrition Modeling
-- Author: Anirudh Ramisetti
-- Description: Database schema creation

-- Departments table
CREATE TABLE departments (
    department_id SERIAL PRIMARY KEY,
    department_name VARCHAR(100),
    location VARCHAR(100),
    budget NUMERIC(12,2)
);

-- Employees table
CREATE TABLE employees (
    employee_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    gender VARCHAR(10),
    hire_date DATE,
    job_title VARCHAR(100),
    department_id INT REFERENCES departments(department_id),
    employment_type VARCHAR(50),
    status VARCHAR(20)
);
