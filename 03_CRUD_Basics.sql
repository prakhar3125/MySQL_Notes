SELECT * FROM <table> --show whole table
SELECT <col> from <table> --show a paticular column
SELECT <col1>,<col2> from <table> --show col 1 and col 2 only

SELECT * FROM cats;
-- +--------+----------------+------------+------+
-- | cat_id | name           | breed      | age  |
-- +--------+----------------+------------+------+
-- |      1 | Ringo          | Tabby      |    4 |
-- |      2 | Cindy          | Maine Coon |   10 |
-- |      3 | Dumbledore     | Maine Coon |   11 |
-- |      4 | Egg            | Persian    |    4 |
-- |      5 | Misty          | Tabby      |   13 |
-- |      6 | George Michael | Ragdoll    |    9 |
-- |      7 | Jackson        | Sphynx     |    7 |
-- +--------+----------------+------------+------+
--WHERE
SELECT * FROM cats WHERE age=4;
SELECT * FROM cats WHERE name='Ringo'; --Rows with age 4 ONLY
-- +--------+-------+---------+------+
-- | cat_id | name  | breed   | age  |
-- +--------+-------+---------+------+
-- |      1 | Ringo | Tabby   |    4 |
-- |      4 | Egg   | Persian |    4 |
-- +--------+-------+---------+------+

SELECT name,age FROM cats WHERE age=4; --only Name and Age col with Age = 4 Row
-- +-------+------+
-- | name  | age  |
-- +-------+------+
-- | Ringo |    4 |
-- | Egg   |    4 |
-- +-------+------+
SELECT name, age FROM cats WHERE age = 4 AND breed = "yes";



SELECT cat_id AS id, name FROM cats; -- Rename temperoraly  cat_id -> id
-- +----+----------------+
-- | id | name           |
-- +----+----------------+
-- |  1 | Ringo          |
-- |  2 | Cindy          |

--UPDATE
UPDATE cats SET col1=val1 , col2=val2 WHERE col=selectCol
UPDATE cats SET age=14  --update age of cats with name Misty to 14
WHERE name='Misty';

SELECT * FROM cats WHERE name='Misty'; --check first what is to be updated 
-- +--------+-------+-------+------+
-- | cat_id | name  | breed | age  |
-- +--------+-------+-------+------+
-- |      5 | Misty | Tabby |   13 |
-- +--------+-------+-------+------+
UPDATE cats SET age=14 
WHERE name='Misty';
-- +--------+-------+-------+------+
-- | cat_id | name  | breed | age  |
-- +--------+-------+-------+------+
-- |      5 | Misty | Tabby |   14 |
-- +--------+-------+-------+------+



--Delete
DELETE FROM cats; --Delete all data from table
DELETE FROM cats WHERE name="P";
