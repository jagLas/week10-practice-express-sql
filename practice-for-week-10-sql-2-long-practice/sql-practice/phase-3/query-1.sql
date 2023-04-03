-- Find Hermione's cats
-- Your code here

SELECT name FROM owners
    JOIN cat_owners ON owner_id = owners.id
    JOIN cats ON cats.id = cat_id
    WHERE first_name = 'Hermione';