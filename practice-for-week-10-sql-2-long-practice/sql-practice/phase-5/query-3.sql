-- Find the name of the cats who have an owner whose first name begins with an "H"
-- Your code here
SELECT cats.name FROM cats JOIN cat_owners ON cat_id = cats.id
    JOIN owners ON owner_id = owners.id
    WHERE first_name LIKE 'H%';