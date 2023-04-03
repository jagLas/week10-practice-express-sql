-- Find names of the cats whose owners are both George Beatty and Melynda Abshire, or just George Beatty, or just Melynda Abshire
-- Your code here
SELECT DISTINCT name FROM owners
    JOIN cat_owners ON owner_id = owners.id
    JOIN cats ON cat_id = cats.id
    WHERE first_name IN ('George', 'Melynda')
    AND last_name IN ('Beatty', 'Abshire');