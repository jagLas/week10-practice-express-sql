-- Your code here

DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS relationships;
DROP TABLE IF EXISTS perf_reviews;
DROP TABLE IF EXISTS parties;

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
  FOREIGN KEY (employee1) REFERENCES employees(id),
  FOREIGN KEY (employee2) REFERENCES employees(id)
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

-- Event 8