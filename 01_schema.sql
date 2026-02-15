-- =============================================
-- 01_schema.sql
-- Workforce Analytics Database Schema
-- PostgreSQL
-- =============================================

DROP TABLE IF EXISTS attrition_log CASCADE;
DROP TABLE IF EXISTS performance_reviews CASCADE;
DROP TABLE IF EXISTS salaries CASCADE;
DROP TABLE IF EXISTS employees CASCADE;
DROP TABLE IF EXISTS departments CASCADE;

-- Departments Table
CREATE TABLE departments (
    department_id SERIAL PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL,
    location VARCHAR(100),
    budget NUMERIC(12,2)
);

-- Employees Table
CREATE TABLE employees (
    employee_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    gender VARCHAR(10),
    hire_date DATE NOT NULL,
    job_title VARCHAR(100),
    department_id INT REFERENCES departments(department_id),
    employment_type VARCHAR(50),
    status VARCHAR(20) DEFAULT 'Active'
);

-- Salaries Table
CREATE TABLE salaries (
    salary_id SERIAL PRIMARY KEY,
    employee_id INT REFERENCES employees(employee_id),
    base_salary NUMERIC(10,2),
    bonus NUMERIC(10,2),
    effective_date DATE
);

-- Performance Reviews Table
CREATE TABLE performance_reviews (
    review_id SERIAL PRIMARY KEY,
    employee_id INT REFERENCES employees(employee_id),
    review_date DATE,
    performance_score INT CHECK (performance_score BETWEEN 1 AND 5)
);

-- Attrition Log
CREATE TABLE attrition_log (
    attrition_id SERIAL PRIMARY KEY,
    employee_id INT REFERENCES employees(employee_id),
    exit_date DATE,
    reason VARCHAR(255)
);
