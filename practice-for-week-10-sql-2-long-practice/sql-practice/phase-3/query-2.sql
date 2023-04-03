-- Find All the Toys for Hermione's cats
-- Your code here

-- 3 JOINS
-- SELECT toys.name FROM owners
--     JOIN cat_owners ON owner_id = owners.id
--     JOIN cats ON cats.id = cat_owners.cat_id
--     JOIN toys ON toys.cat_id = cats.id
--     WHERE first_name = 'Hermione';

-- 2 JOINS
SELECT toys.name FROM toys
    JOIN cat_owners ON toys.cat_id = cat_owners.cat_id
    JOIN owners ON owner_id = owners.id
    WHERE owners.first_name = 'Hermione';