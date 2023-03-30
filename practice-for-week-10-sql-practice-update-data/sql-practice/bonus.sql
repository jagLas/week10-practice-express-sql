-- UPDATE friends
-- SET first_name = null
-- WHERE id=5;
-- the above fails because last_name cannot be null

UPDATE friends
SET first_name = ''
WHERE id=5;