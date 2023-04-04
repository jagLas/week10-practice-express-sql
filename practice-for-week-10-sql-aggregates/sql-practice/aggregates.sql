SELECT count(*) AS number_cats FROM cats;

SELECT name, min(birth_year) FROM cats;

SELECT name, max(birth_year) FROM cats;

SELECT name, birth_year FROM cats
    WHERE birth_year IN (
        (SELECT min(birth_year) FROM cats),
        (SELECT max(birth_year) FROM cats));

SELECT cats.name, COUNT(toys.id) AS number_toys
    FROM cats JOIN toys ON cats.id = cat_id
    GROUP BY cats.name;

SELECT cats.name, COUNT(toys.id) AS number_toys
    FROM cats JOIN toys ON cats.id = cat_id
    GROUP BY cats.name HAVING number_toys >= 2;