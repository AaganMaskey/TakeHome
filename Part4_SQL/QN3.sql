SELECT
    e.employee_id,
    e.name,
    COUNT(et.id) AS total_trainings
FROM employees e
LEFT JOIN employee_trainings et
    ON e.id = et.employee_id
GROUP BY
    e.id,
    e.employee_id,
    e.name;