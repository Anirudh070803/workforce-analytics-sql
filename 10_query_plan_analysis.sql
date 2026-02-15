EXPLAIN ANALYZE
SELECT 
    d.department_name,
    COUNT(*) FILTER (WHERE e.status = 'Resigned') AS resigned_count
FROM employees e
JOIN departments d
ON e.department_id = d.department_id
GROUP BY d.department_name;
