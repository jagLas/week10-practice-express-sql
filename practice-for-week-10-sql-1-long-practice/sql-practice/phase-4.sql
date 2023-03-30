-- Your code here

DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS relationships;
DROP TABLE IF EXISTS perf_reviews;
DROP TABLE IF EXISTS parties;

CREATE TABLE `employees` (
  `id` INTEGER PRIMARY KEY,
  `first_name` VARCHAR(50) NOT NULL,
  `last_name` VARCHAR(50) NOT NULL,
  `department` VARCHAR(50),
  `role` VARCHAR(50)
);

CREATE TABLE `relationships` (
  `id` INTEGER PRIMARY KEY,
  `employee1` INTEGER,
  `employee2` INTEGER,
  FOREIGN KEY (employee1) REFERENCES employees(id),
  FOREIGN KEY (employee2) REFERENCES employees(id)
);

CREATE TABLE `perf_reviews` (
  `id` INTEGER PRIMARY KEY,
  `employee_id` INTEGER,
  `score` NUMERIC(3, 1) CHECK(score <= 10 AND score >= 0),
  FOREIGN KEY (employee_id) REFERENCES employees(id)
);

CREATE TABLE `parties` (
  `id` INTEGER PRIMARY KEY,
  `budget` NUMERIC(9, 2),
  `onsite` BOOLEAN
);

