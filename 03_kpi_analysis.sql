-- =============================================
-- 03_kpi_analysis.sql
-- Executive Workforce KPIs
-- =============================================

SELECT
    COUNT(*) AS total_employees,
    COUNT(*) FILTER (WHERE status = 'Active') AS active_employees,
    COUNT(*) FILTER (WHERE status = 'Resigned') AS resigned_employees,
    ROUND(
        COUNT(*) FILTER (WHERE status = 'Resigned')::numeric
        / COUNT(*) * 100, 2
    ) AS attrition_rate_percentage,
    ROUND(AVG(CURRENT_DATE - hire_date)/365.0,2) AS avg_tenure_years
FROM employees;

