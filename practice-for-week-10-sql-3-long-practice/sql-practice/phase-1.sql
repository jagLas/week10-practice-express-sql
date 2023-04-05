--Insert new cat named "Red" born this year
-- Your code here
INSERT INTO cats (name, birth_year) VALUES ('Red', 2023);

--Assign ownership of new cat to George Beatty using subqueries
-- Your code here
INSERT INTO cat_owners (owner_id, cat_id) VALUES (
    (SELECT id FROM owners WHERE first_name = 'George' AND last_name = 'Beatty'),
    (SELECT id FROM cats WHERE name ='Red' AND birth_year = 2023)
);

--Query to verify INSERTs worked properly
-- Your code here
SELECT * FROM cats JOIN cat_owners ON cats.id = cat_id
    JOIN owners ON owners.id = owner_id
    WHERE cats.name = 'Red';