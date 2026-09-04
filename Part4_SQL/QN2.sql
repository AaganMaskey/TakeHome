SELECT
    e.employee_id,
    e.name,
    e.department
FROM employees e
JOIN employee_trainings et
    ON e.id = et.employee_id
GROUP BY
    e.id,
    e.employee_id,
    e.name,
    e.department
HAVING
    COUNT(et.id) = SUM(
        CASE
            WHEN et.status = 'Completed' THEN 1
            ELSE 0
        END
    );