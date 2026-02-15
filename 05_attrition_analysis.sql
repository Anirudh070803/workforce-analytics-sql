-- =============================================
-- 05_attrition_analysis.sql
-- Attrition Insights
-- =============================================

-- Attrition by Department
SELECT
    d.department_name,
    ROUND(
        COUNT(*) FILTER (WHERE e.status = 'Resigned')::numeric
        / COUNT(*) * 100, 2
    ) AS attrition_rate
FROM employees e
JOIN departments d ON e.department_id = d.department_id
GROUP BY d.department_name
ORDER BY attrition_rate DESC;

-- Tenure Segmentation Risk
SELECT
    CASE 
        WHEN CURRENT_DATE - hire_date < 365 THEN '0-1 Years'
        WHEN CURRENT_DATE - hire_date < 730 THEN '1-2 Years'
        WHEN CURRENT_DATE - hire_date < 1825 THEN '2-5 Years'
        ELSE '5+ Years'
    END AS tenure_segment,
    ROUND(
        COUNT(*) FILTER (WHERE status = 'Resigned')::numeric
        / COUNT(*) * 100, 2
    ) AS attrition_rate
FROM employees
GROUP BY tenure_segment
ORDER BY attrition_rate DESC;
