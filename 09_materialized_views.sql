-- Executive Summary View

CREATE MATERIALIZED VIEW vw_executive_summary AS
WITH base_metrics AS (
    SELECT 
        COUNT(*) AS total_employees,
        COUNT(*) FILTER (WHERE status = 'Active') AS active_employees,
        COUNT(*) FILTER (WHERE status = 'Resigned') AS resigned_employees,
        ROUND(AVG(CURRENT_DATE - hire_date) / 365.0, 2) AS avg_tenure_years
    FROM employees
),
salary_metrics AS (
    SELECT 
        ROUND(AVG(base_salary), 2) AS avg_salary
    FROM salaries
)
SELECT 
    b.total_employees,
    b.active_employees,
    ROUND((b.resigned_employees::numeric / b.total_employees) * 100, 2)
        AS attrition_rate_percent,
    b.avg_tenure_years,
    s.avg_salary
FROM base_metrics b
CROSS JOIN salary_metrics s;
