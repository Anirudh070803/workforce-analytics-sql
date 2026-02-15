-- Indexes for performance optimization

CREATE INDEX idx_employees_department
ON employees(department_id);

CREATE INDEX idx_employees_status
ON employees(status);

CREATE INDEX idx_salaries_employee
ON salaries(employee_id);

CREATE INDEX idx_performance_employee
ON performance_reviews(employee_id);

CREATE INDEX idx_attrition_employee
ON attrition_log(employee_id);

CREATE INDEX idx_employees_hire_date
ON employees(hire_date);
