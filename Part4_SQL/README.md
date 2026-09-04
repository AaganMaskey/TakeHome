# Employee Training & Certification Queries — Index

This project contains a set of SQL queries run against the schema and sample
data defined in `0_CreateAndInsert.sql`. Each query answers a specific
business question about employees, their assigned trainings, and their
certifications.

## Schema Overview

| Table | Columns | Description |
|---|---|---|
| `employees` | id, employee_id, name, email, department | Employee master data |
| `trainings` | id, training_name | Catalog of available trainings |
| `employee_trainings` | id, employee_id, training_id, status | Links employees to assigned trainings and tracks status (`Completed` / `Pending`) |
| `certifications` | id, employee_id, certification_name, expiry_date | Certifications held by employees and their expiry dates |

## File Index

| File | Question Answered | Status |
|---|---|---|
| [QN1.sql](./QN1.sql) | List all employees (ID, name, department) | ✅ Valid |
| [QN2.sql](./QN2.sql) | Which employees completed 100% of their assigned trainings? | ✅ Valid |
| [QN3.sql](./QN3.sql) | How many trainings are assigned to each employee? | ✅ Valid |
| [QN4.sql](./QN4.sql) | Which certifications are expiring within the next 30 days? | ✅ Valid |
| [QN5.txt](./QN5.txt) | (Requires `due_date` on `employee_trainings`) | ❌ Cannot be validated — column missing from schema |
| [QN6.sql](./QN6.sql) | Top 5 employees by number of completed trainings | ✅ Valid |
| [0_CreateAndInsert.sql](./0_CreateAndInsert.sql) | Schema definition + sample data | — Setup file |

## Query Details

### QN1 — List All Employees
Simple projection of `employee_id`, `name`, and `department` from `employees`.
No joins or filters; returns all rows.

### QN2 — Fully Completed Employees
Inner-joins `employees` to `employee_trainings`, groups by employee, and uses
`HAVING COUNT(et.id) = SUM(status = 'Completed')` to isolate employees whose
assigned trainings are **all** completed (zero pending). Employees with no
assigned trainings are excluded because of the inner join.

### QN3 — Total Trainings Per Employee
Same idea as QN2 but uses a `LEFT JOIN`, so employees with **no** assigned
trainings still appear in the output (with a count of 0) instead of being
dropped.

### QN4 — Certifications Expiring in 30 Days
Joins `certifications` to `employees` and filters on
`expiry_date BETWEEN DATE('now') AND DATE('now', '+30 days')`, an inclusive
window from today through the next 30 days. Sorted by soonest expiry first.

> ⚠️ Uses SQLite-specific `DATE('now', ...)` syntax — needs adjustment for
> MySQL (`CURDATE()`), PostgreSQL (`CURRENT_DATE`), or SQL Server (`GETDATE()`).

### QN5 — Not Validated
This question depends on a `due_date` column on `employee_trainings`, which
does **not** exist in the current schema (only `status` is tracked). Marked
as unanswerable until the schema is updated or the requirement is clarified.

### QN6 — Top 5 by Completed Trainings
Filters `employee_trainings` to `status = 'Completed'`, groups by employee,
counts completions, and returns the top 5 in descending order.

> 💡 Consider adding a secondary `ORDER BY e.employee_id` for deterministic
> tie-breaking among employees with equal completed-training counts.

## Known Gaps / Follow-ups

- **QN5** needs schema confirmation: either add a `due_date` column to
  `employee_trainings`, or clarify what the original question intended.
- **QN4** should be ported to standard SQL if this needs to run outside SQLite.
- **QN6** ties are currently broken arbitrarily by SQLite's default row order.
