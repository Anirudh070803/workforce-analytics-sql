-- =============================================
-- 06_risk_model.sql
-- Rule-Based Attrition Risk Model
-- =============================================

WITH performance_avg AS (
    SELECT employee_id, AVG(performance_score) AS avg_score
    FROM performance_reviews
    GROUP BY employee_id
),
employee_features AS (
    SELECT 
        e.employee_id,
        e.status,
        s.base_salary,
        p.avg_score,
        CURRENT_DATE - e.hire_date AS tenure_days,
        NTILE(4) OVER (ORDER BY s.base_salary) AS salary_quartile
    FROM employees e
    JOIN salaries s ON e.employee_id = s.employee_id
    LEFT JOIN performance_avg p ON e.employee_id = p.employee_id
),
risk_scoring AS (
    SELECT *,
        (
            CASE WHEN avg_score < 3 THEN 2 ELSE 0 END +
            CASE WHEN salary_quartile = 1 THEN 2 ELSE 0 END +
            CASE WHEN tenure_days < 730 THEN 1 ELSE 0 END
        ) AS risk_score
    FROM employee_features
)
SELECT
    COUNT(*) FILTER (WHERE risk_score >= 3 AND status = 'Active') 
        AS high_risk_active_employees
FROM risk_scoring;

