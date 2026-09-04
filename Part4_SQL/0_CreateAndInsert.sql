CREATE TABLE employees (
    id INT,
    employee_id VARCHAR(50),
    name VARCHAR(100),
    email VARCHAR(150),
    department VARCHAR(100)
);

CREATE TABLE trainings (
    id INT,
    training_name VARCHAR(150)
);

CREATE TABLE employee_trainings (
    id INT,
    employee_id INT,
    training_id INT,
    status VARCHAR(50)
);

CREATE TABLE certifications (
    id INT,
    employee_id INT,
    certification_name VARCHAR(150),
    expiry_date DATE
);

INSERT INTO employees
(id, employee_id, name, email, department)
VALUES
(1, 'EMP001', 'John Smith', 'john.smith@example.com', 'IT'),
(2, 'EMP002', 'Jane Doe', 'jane.doe@example.com', 'HR'),
(3, 'EMP003', 'Robert Brown', 'robert.brown@example.com', 'Finance'),
(4, 'EMP004', 'Sarah Wilson', 'sarah.wilson@example.com', 'IT'),
(5, 'EMP005', 'David Lee', 'david.lee@example.com', 'Operations'),
(6, 'EMP006', 'Emily Davis', 'emily.davis@example.com', 'Marketing'),
(7, 'EMP007', 'Michael Taylor', 'michael.taylor@example.com', 'Finance'),
(8, 'EMP008', 'Lisa Anderson', 'lisa.anderson@example.com', 'HR');

INSERT INTO trainings
(id, training_name)
VALUES
(1, 'Security Awareness'),
(2, 'Workplace Safety'),
(3, 'Data Privacy'),
(4, 'Compliance Training'),
(5, 'Leadership Training');


INSERT INTO employee_trainings
(id, employee_id, training_id, status)
VALUES
-- EMP001
(1, 1, 1, 'Completed'),
(2, 1, 2, 'Completed'),
(3, 1, 3, 'Completed'),

-- EMP002
(4, 2, 1, 'Completed'),
(5, 2, 2, 'Pending'),

-- EMP003
(6, 3, 1, 'Completed'),
(7, 3, 2, 'Completed'),
(8, 3, 3, 'Completed'),
(9, 3, 4, 'Completed'),

-- EMP004
(10, 4, 1, 'Completed'),
(11, 4, 3, 'Pending'),

-- EMP005
(12, 5, 1, 'Pending'),
(13, 5, 2, 'Pending'),

-- EMP006
(14, 6, 1, 'Completed'),
(15, 6, 2, 'Completed'),
(16, 6, 3, 'Completed'),
(17, 6, 4, 'Completed'),
(18, 6, 5, 'Completed'),

-- EMP007
(19, 7, 1, 'Completed'),
(20, 7, 2, 'Completed'),
(21, 7, 3, 'Pending');

-- EMP008 has no assigned training


INSERT INTO certifications
(id, employee_id, certification_name, expiry_date)
VALUES
-- Within 30 days
(1, 1, 'AWS Certified Developer', '2026-09-16'),
(2, 2, 'CompTIA Security+', '2026-09-26'),

-- After 30 days
(3, 3, 'PMP Certification', '2026-11-05'),

-- Already expired
(4, 4, 'ISTQB Foundation', '2026-09-01'),

-- Within 30 days
(5, 5, 'Microsoft Azure Fundamentals', '2026-10-01'),

-- After 30 days
(6, 6, 'Certified ScrumMaster', '2026-12-05'),

-- Already expired
(7, 7, 'Oracle Certified Professional', '2026-08-22'),

-- Expires today
(8, 8, 'Google Cloud Associate', '2026-09-06');