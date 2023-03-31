-- Your code here
DROP TABLE IF EXISTS relationships;
DROP TABLE IF EXISTS perf_reviews;
DROP TABLE IF EXISTS parties;
DROP TABLE IF EXISTS employees;


CREATE TABLE `employees` (
  `id` INTEGER PRIMARY KEY AUTOINCREMENT,
  `first_name` VARCHAR(50) NOT NULL,
  `last_name` VARCHAR(50) NOT NULL,
  `department` VARCHAR(50),
  `role` VARCHAR(50)
);

CREATE TABLE `relationships` (
  `id` INTEGER PRIMARY KEY AUTOINCREMENT,
  `employee1` INTEGER,
  `employee2` INTEGER,
  FOREIGN KEY(employee1) REFERENCES employees(id),
  FOREIGN KEY(employee2) REFERENCES employees(id)
);

CREATE TABLE `perf_reviews` (
  `id` INTEGER PRIMARY KEY AUTOINCREMENT,
  `employee_id` INTEGER,
  `score` NUMERIC(3, 1) CHECK(score <= 10 AND score >= 0),
  FOREIGN KEY (employee_id) REFERENCES employees(id)
);

CREATE TABLE `parties` (
  `id` INTEGER PRIMARY KEY AUTOINCREMENT,
  `budget` NUMERIC(9, 2),
  `onsite` BOOLEAN
);

-- Events 1-7
INSERT INTO employees (first_name, last_name, department, role) VALUES
    ('Michael', 'Scott', 'Management', 'Regional Manager'),
    ('Dwight', 'Schrute', 'Sales', 'Assitant Regional Manager'),
    ('Jim', 'Halpert', 'Sales', 'Sales Representative'),
    ('Pam', 'Beesly', 'Reception', 'Receptionist'),
    ('Kelly', 'Kapoor', 'Product Oversight', 'Customer Service Representative'),
    ('Angela', 'Martin', 'Accounting', 'Head of Accounting'),
    ('Roy', 'Anderson', 'Warehouse', 'Warehouse Staff');

-- Event 8-21
SELECT * FROM employees WHERE first_name = 'Pam' OR first_name = 'Roy';
INSERT INTO relationships (employee1, employee2) VALUES (4, 7);

INSERT INTO employees (first_name, last_name, department, role) VALUES
  ('Ryan', 'Howard', 'Reception', 'Temp');

INSERT INTO parties (budget, onsite) VALUES (100.00, 1);

SELECT * FROM employees WHERE first_name="Dwight";
INSERT INTO perf_reviews (employee_id, score) VALUES (2, 3.3);
SELECT * FROM employees WHERE first_name="Jim";
INSERT INTO perf_reviews (employee_id, score) VALUES (3, 4.2);
UPDATE perf_reviews SET score = 9.0 WHERE id = 1;
UPDATE perf_reviews SET score = 9.3 WHERE id = 2;

UPDATE employees SET role = 'Assistant Regional Manager' WHERE id = 3;

UPDATE employees SET
  role = 'Sales Representative',
  department = 'Sales'
WHERE id = 8;

INSERT INTO parties (budget, onsite) VALUES (200.00, 1);

INSERT INTO relationships (employee1, employee2) VALUES (6, 2);

INSERT INTO perf_reviews (employee_id, score) VALUES (6, 6.2);

INSERT INTO relationships (employee1, employee2) VALUES (8, 5);

INSERT INTO parties (budget, onsite) VALUES (50.00, 1);

-- 22-25
DELETE FROM perf_reviews WHERE employee_id = 3;
DELETE FROM employees WHERE id = 3;

DELETE FROM relationships WHERE employee1 = 4;

INSERT INTO perf_reviews (employee_id, score) VALUES (4, 7.6);
INSERT INTO perf_reviews (employee_id, score) VALUES (2, 8.7);

-- 26-29
select * FROM perf_reviews WHERE employee_id = 8;
select * FROM relationships WHERE employee1 = 8 OR employee2 = 8;
DELETE FROM relationships WHERE employee1 = 8;
DELETE FROM employees WHERE id = 8;

INSERT INTO employees (first_name, last_name, department, role) VALUES
  ('Jim', 'Halpert', 'Sales', 'Sales Representative'),
  ('Karen', 'Filippelli', 'Sales', 'Sales Representative');

INSERT INTO relationships (employee1, employee2) VALUES (9, 10);

-- 30-33
INSERT INTO parties (budget, onsite) VALUES (120.00, 1);
SELECT * FROM parties;
DELETE FROM parties WHERE id = 4;
INSERT INTO parties (budget, onsite) VALUES (300.00, 0);

SELECT * FROM relationships;
DELETE FROM relationships WHERE employee1 = 9;

INSERT INTO relationships (employee1, employee2) VALUES (4, 9);

-- I would add a table called party details that list employees at a part and link it using a foreing key to the party

-- I would add a field for vacation days remaining in the employee table