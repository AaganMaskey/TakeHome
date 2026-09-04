SELECT
    e.employee_id,
    e.name,
    COUNT(et.id) AS completed_trainings
FROM employees e
JOIN employee_trainings et
    ON e.id = et.employee_id
WHERE et.status = 'Completed'
GROUP BY
    e.id,
    e.employee_id,
    e.name
ORDER BY completed_trainings DESC
LIMIT 5;