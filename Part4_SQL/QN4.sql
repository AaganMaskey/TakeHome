SELECT
    e.employee_id,
    e.name,
    c.certification_name,
    c.expiry_date
FROM certifications c
JOIN employees e
    ON c.employee_id = e.id
WHERE c.expiry_date BETWEEN DATE('now')
                        AND DATE('now', '+30 days')
ORDER BY c.expiry_date;