-- =============================================
-- 07_executive_reporting.sql
-- Board-Level Reporting Queries
-- =============================================

-- Top 3 Departments by Attrition
SELECT
    d.department_name,
    ROUND(
        COUNT(*) FILTER (WHERE e.status = 'Resigned')::numeric
        / COUNT(*) * 100, 2
    ) AS attrition_rate
FROM employees e
JOIN departments d ON e.department_id = d.department_id
GROUP BY d.department_name
ORDER BY attrition_rate DESC
LIMIT 3;

