--Select books that were not released in 2017
SELECT title FROM books WHERE year != 2017;

--Select books with titles that don't start with 'W'
SELECT title FROM books WHERE title NOT LIKE 'W%';
--NOT LIKE"%a%" => doesnot contain a 
 
--Select books released after the year 2000
SELECT * FROM books WHERE released_year > 2000;
SELECT * FROM books WHERE released_year < 2000;
SELECT 99 > 1;
--True:1
--False:0

SELECT * FROM books WHERE released_year >= 2000;
SELECT * FROM books WHERE released_year <= 2000;

--SELECT books written by Dave Eggers, published after the year 2010
SELECT * FROM books WHERE author_lname='Eggers' AND released_year > 2010;
SELECT * FROM books WHERE author_lname='Eggers' OR released_year > 2010;

--Between
SELECT title, released_year FROM books WHERE released_year >= 2004 AND released_year <= 2015;
--OR
SELECT title, released_year FROM books WHERE released_year BETWEEN 2004 AND 2015;

--Not Between
SELECT title, released_year FROM books WHERE released_year NOT BETWEEN 2004 AND 2015;


--Extract year and compare
SELECT * FROM people WHERE YEAR(birthdate)<2005;  
-- +-------+------------+-----------+---------------------+
-- | name  | birthdate  | birthtime | birthdt             |
-- +-------+------------+-----------+---------------------+
-- | Elton | 2000-12-25 | 11:00:00  | 2000-12-25 11:00:00 |

--CAST(expression AS target_type)
CREATE TABLE orders (
  order_id INT,
  order_total VARCHAR(10)
);

INSERT INTO orders (order_id, order_total) VALUES (1, '150.50'), (2, '75.20');
SELECT order_id, CAST(order_total AS DECIMAL(10,2)) AS total FROM orders;
-- +----------+--------+
-- | order_id | total  |
-- +----------+--------+
-- |        1 | 150.50 |


SELECT * FROM people WHERE birthtime BETWEEN CAST('10:00:00' AS TIME) AND CAST('16:00:00' AS TIME);
-- +-------+------------+-----------+---------------------+
-- | name  | birthdate  | birthtime | birthdt             |
-- +-------+------------+-----------+---------------------+
-- | Elton | 2000-12-25 | 11:00:00  | 2000-12-25 11:00:00 |


--Select all books written by... Carver or Lahiri or Smith
SELECT title, author_lname FROM books WHERE author_lname='Carver' OR author_lname='Lahiri' OR author_lname='Smith';
--Or
SELECT title, author_lname FROM books
WHERE author_lname IN ('Carver', 'Lahiri', 'Smith');

--Select all books not published in 2000,2002,....  ie Even years 
SELECT title, released_year FROM books
WHERE released_year NOT IN 
(2000,2002,2004,2006,2008,2010,2012,2014,2016);
--OR use modulo
SELECT title, released_year FROM books
WHERE released_year >= 2000 AND
released_year % 2 != 0;





--Case Statement
-- SELECT 
--     column1,
--     column2,
--     CASE 
--         WHEN condition1 THEN result1
--         WHEN condition2 THEN result2
--         ...
--         ELSE default_result
--     END AS alias_name
-- FROM 
--     table_name;

--AS alias_name: Assigns a name (alias_name) to the result of the CASE statement.

SELECT title, released_year,
       CASE 
         WHEN released_year >= 2000 THEN 'Modern Lit'
         ELSE '20th Century Lit'
       END AS GENRE
FROM books; 
-- +-----------------------------------------------------+---------------+------------------+
-- | title                                               | released_year | GENRE            |
-- +-----------------------------------------------------+---------------+------------------+
-- | The Namesake                                        |          2003 | Modern Lit       |

SELECT title, stock_quantity,
    CASE 
        WHEN stock_quantity BETWEEN 0 AND 50 THEN '*'
        WHEN stock_quantity BETWEEN 51 AND 100 THEN '**'
        ELSE '***'
    END AS STOCK
FROM books;   
-- +-----------------------------------------------------+----------------+-------+
-- | title                                               | stock_quantity | STOCK |
-- +-----------------------------------------------------+----------------+-------+
-- | The Namesake                                        |             32 | *     |


--IS NULL , IS NOT NULL 
SELECT * FROM books WHERE title IS NULL;