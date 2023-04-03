-- Find All the Toys for Hermione's cats
-- Your code here

SELECT toys.name FROM owners
    JOIN cat_owners ON owner_id = owners.id
    JOIN cats ON cats.id = cat_owners.cat_id
    JOIN toys ON toys.cat_id = cats.id
    WHERE first_name = 'Hermione';