-- Your code here
DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS coffee_orders;

CREATE TABLE customers (
    id INTEGER PRIMARY KEY,
    name VARCHAR(40),
    phone NUMERIC(10, 0),
    email VARCHAR(255),
    points INTEGER DEFAULT 5,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE coffee_orders (
    id INT PRIMARY KEY,
    is_redeemed BOOLEAN DEFAULT 0,
    ordered_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);