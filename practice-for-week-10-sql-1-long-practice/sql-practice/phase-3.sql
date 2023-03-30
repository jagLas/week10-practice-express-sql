-- Your code here

-- Rachel added to customers
INSERT INTO customers (name, phone)
VALUES ('Rachel', 1111111111);

-- Rachel buys 1 coffee
SELECT points FROM customers WHERE id = 1;
UPDATE customers SET points = 6 WHERE id = 1;
INSERT INTO coffee_orders (is_redeemed) VALUES(0);

-- Monica and Phoebe sign up
INSERT INTO customers (name, email, phone)
VALUES 
    ('Monica', 'monica@friends.show', 2222222222),
    ('Phoebe', 'phoebe@friends.show', 3333333333);


-- Phoebe purchases three coffees
SELECT points FROM customers WHERE id = 3;
UPDATE customers SET points = 8 WHERE id = 3;
INSERT INTO coffee_orders (is_redeemed) VALUES
    (0),
    (0),
    (0);

-- Rachel and Monica each purchase four coffees
SELECT id, name, points FROM customers WHERE ID=1 OR id=2;
UPDATE customers SET points = 10 WHERE id = 1;
UPDATE customers SET points = 9 WHERE id = 2;
INSERT INTO coffee_orders (is_redeemed) VALUES
    (0),
    (0),
    (0),
    (0),
    (0),
    (0),
    (0),
    (0);

-- Monica wants to know her new point total.
SELECT id, name, points FROM customers WHERE id = 2;

-- Rachel wants to check her total points. Redeem her points for a coffee if she has enough points. If she doesn't, she wants to purchase a coffee.
SELECT id, name, points FROM customers WHERE id = 1;
UPDATE customers SET points = 0 WHERE id = 1;
INSERT INTO coffee_orders (is_redeemed) VALUES (1);

-- Three new customers joined the loyalty program with the following customer information:
INSERT INTO customers (name, email) VALUES
    ('Joey', 'joey@friends.show'),
    ('Chandler', 'chandler@friends.show'),
    ('Ross', 'ross@friends.show');

-- Ross purchases six coffees.
SELECT id, name, points FROM customers WHERE ID = 6;
UPDATE customers SET points = 11 WHERE id = 6;
INSERT INTO coffee_orders DEFAULT VALUES;
INSERT INTO coffee_orders DEFAULT VALUES;
INSERT INTO coffee_orders DEFAULT VALUES;
INSERT INTO coffee_orders DEFAULT VALUES;
INSERT INTO coffee_orders DEFAULT VALUES;
INSERT INTO coffee_orders DEFAULT VALUES;

-- Monica purchases three coffees.
SELECT id, name, points FROM customers WHERE name='Monica';
UPDATE customers SET points = 12 WHERE id = 2;
INSERT INTO coffee_orders (is_redeemed) VALUES
    (0),
    (0),
    (0);

-- Phoebe wants to check her points Redeem her points for a coffee if she has enough points. If she doesn't, she wants to purchase a coffee.
SELECT id, name, points FROM customers WHERE name='Phoebe';
UPDATE customers SET points = 9 WHERE id = 3;
INSERT INTO coffee_orders DEFAULT VALUES;

-- Ross demands a refund for the last two coffees that he ordered. (Make sure you delete Ross's coffee orders and not anyone else's. Update his points to reflect the returned purchases.)
SELECT id, name, points FROM customers WHERE name='Ross';
UPDATE customers SET points = 9 WHERE id = 6;
DELETE FROM coffee_orders WHERE id = 18 OR id = 19;

-- Joey purchases two coffees.
SELECT id, name, points FROM customers WHERE name='Joey';
UPDATE customers SET points = 7 WHERE id = 4;
INSERT INTO coffee_orders DEFAULT VALUES;
INSERT INTO coffee_orders DEFAULT VALUES;

-- Monica wants to check her total points. Redeem her points for a coffee if she has enough points. If she doesn't, she wants to purchase a coffee.
SELECT id, name, points FROM customers WHERE name='Monica';
UPDATE customers SET points = 2 WHERE id = 2;
INSERT INTO coffee_orders (is_redeemed) VALUES (1);

--Chandler wants to delete his loyalty program account.
SELECT id FROM customers WHERE name = 'Chandler';
DELETE FROM customers WHERE id = 5;

-- Ross wants to check his total points. Redeem his points for a coffee if he has enough points. If he doesn't, he wants to purchase a coffee.
SELECT id, name, points FROM customers WHERE name='Ross';
UPDATE customers SET points = 10 WHERE id = 6;
INSERT INTO coffee_orders DEFAULT VALUES;

-- Joey wants to check his total points. Redeem his points for a coffee if he has enough points. If he doesn't, he wants to purchase a coffee
SELECT id, name, points FROM customers WHERE name='Joey';
UPDATE customers SET points = 8 WHERE id = 4;
INSERT INTO coffee_orders DEFAULT VALUES;

-- Phoebe wants to change her email to p_as_in_phoebe@friends.show.
SELECT id, name FROM customers WHERE name='Phoebe';
UPDATE customers SET email = 'p_as_in_phoebe@friends.show' WHERE id = 3;