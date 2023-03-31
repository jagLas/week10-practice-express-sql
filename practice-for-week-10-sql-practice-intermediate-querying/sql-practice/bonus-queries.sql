SELECT * FROM albums WHERE title LIKE 'The%';

SELECT * FROM albums ORDER BY num_sold DESC LIMIT 2; 

SELECT * FROM albums ORDER BY num_sold DESC LIMIT 2 OFFSET 2; 