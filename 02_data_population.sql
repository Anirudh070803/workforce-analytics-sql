-- =============================================
-- 02_data_population.sql
-- Synthetic Workforce Data Generation
-- =============================================

-- Insert Departments
INSERT INTO departments (department_name, location, budget)
VALUES
('HR', 'London', 500000),
('Finance', 'London', 800000),
('IT', 'Manchester', 1200000),
('Sales', 'Birmingham', 950000),
('Marketing', 'Leeds', 600000),
('Operations', 'Liverpool', 1100000),
('Legal', 'London', 400000),
('Customer Support', 'Manchester', 550000);

-- Insert Employees (300 synthetic)
INSERT INTO employees (first_name, last_name, gender, hire_date, job_title, department_id, employment_type)
SELECT
    'First' || gs,
    'Last' || gs,
    CASE WHEN random() > 0.5 THEN 'Male' ELSE 'Female' END,
    DATE '2015-01-01' + (random() * 3650)::int,
    CASE 
        WHEN random() < 0.2 THEN 'Analyst'
        WHEN random() < 0.4 THEN 'Manager'
        WHEN random() < 0.6 THEN 'Associate'
        WHEN random() < 0.8 THEN 'Engineer'
        ELSE 'Executive'
    END,
    (random() * 7 + 1)::int,
    CASE WHEN random() > 0.7 THEN 'Contract' ELSE 'Full-time' END
FROM generate_series(1,300) gs;

-- Insert Salaries
INSERT INTO salaries (employee_id, base_salary, bonus, effective_date)
SELECT
    employee_id,
    30000 + (random() * 70000),
    random() * 10000,
    CURRENT_DATE
FROM employees;

-- Insert Performance Reviews
INSERT INTO performance_reviews (employee_id, review_date, performance_score)
SELECT
    employee_id,
    CURRENT_DATE - (random() * 1000)::int,
    (random() * 4 + 1)::int
FROM employees;

-- Simulated Behavioral Attrition
INSERT INTO attrition_log (employee_id, exit_date, reason)
SELECT
    e.employee_id,
    CURRENT_DATE - (random() * 365)::int,
    'Voluntary Resignation'
FROM employees e
JOIN salaries s ON e.employee_id = s.employee_id
WHERE s.base_salary < 45000
AND random() < 0.25;

-- Update status
UPDATE employees
SET status = 'Resigned'
WHERE employee_id IN (SELECT employee_id FROM attrition_log);

