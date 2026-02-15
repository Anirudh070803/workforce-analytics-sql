-- =============================================
-- 04_salary_analysis.sql
-- Salary & Compensation Analysis
-- =============================================

-- Average Salary by Department
SELECT
    d.department_name,
    ROUND(AVG(s.base_salary),2) AS avg_salary
FROM employees e
JOIN departments d ON e.department_id = d.department_id
JOIN salaries s ON e.employee_id = s.employee_id
GROUP BY d.department_name
ORDER BY avg_salary DESC;

-- Salary Quartiles
SELECT
    employee_id,
    base_salary,
    NTILE(4) OVER (ORDER BY base_salary) AS salary_quartile
FROM salaries;

-- Salary vs Performance Correlation
SELECT
    CORR(s.base_salary, p.performance_score) AS salary_performance_correlation
FROM salaries s
JOIN performance_reviews p
ON s.employee_id = p.employee_id;

