-- Find the name of the cats co-owned by both George Beatty and Melynda Abshire
-- Your code here
SELECT cats.name
    FROM cats WHERE id IN (
        SELECT cat_id FROM cat_owners WHERE owner_id = (
            SELECT id FROM owners WHERE first_name = 'George' AND last_name = 'Beatty'
        )

        INTERSECT
        
        SELECT cat_id FROM cat_owners WHERE owner_id = (
            SELECT id FROM owners WHERE first_name = 'Melynda' AND last_name = 'Abshire'
        )
    );

-- Alternate solution
SELECT cats.name
    FROM cats WHERE id IN (
        SELECT cat_id FROM cat_owners WHERE owner_id = (
            SELECT id FROM owners WHERE first_name = 'George' AND last_name = 'Beatty'
        )
    )
    AND id in (
        SELECT cat_id FROM cat_owners WHERE owner_id = (
            SELECT id FROM owners WHERE first_name = 'Melynda' AND last_name = 'Abshire'
        )
    );