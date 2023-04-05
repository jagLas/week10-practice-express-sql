-- Give "Red" the cat one of every toy the other cats have
-- Your code here
INSERT INTO toys (name, cat_id)
SELECT name, (SELECT id FROM cats WHERE name = 'Red') FROM toys
    WHERE cat_id NOT IN (SELECT id FROM cats WHERE name = 'Red');

-- Query spoiled cats reporting the most spoiled first
-- Your code here
SELECT cats.name, COUNT(*) AS num_toys FROM cats JOIN toys ON cat_id = cats.id
    GROUP BY cats.name HAVING num_toys >= 2 ORDER BY num_toys;