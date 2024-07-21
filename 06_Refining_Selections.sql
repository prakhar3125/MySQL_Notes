--Select Distinct Values

SELECT DISTINCT author_lname FROM books;--Shows only Distinct lnames

SELECT DISTINCT(CONCAT(author_fname, " ",author_lname)) AS fullname FROM BOOKS;
--or SELECT DISTINCT author_fname,author_lname FROM BOOKS;

--Sort Results
--Ascending Order
SELECT author_lname FROM books ORDER BY author_lname; --Sort byy author lname
 --ORDER BY author_lname as Suffix 
SELECT book_id,author_fname,author_lname FROM books ORDER BY author_lname;
-- +---------+--------------+----------------+
-- | book_id | author_fname | author_lname   |
-- +---------+--------------+----------------+
-- |      11 | Raymond      | Carver         |
-- |      12 | Raymond      | Carver         |
-- |       7 | Michael      | Chabon         |

 --Descending Order
SELECT book_id,author_fname,author_lname FROM books ORDER BY author_lname DESC;
-- +---------+--------------+----------------+-------+
-- | book_id | author_fname | author_lname   | pages |
-- +---------+--------------+----------------+-------+
-- |       7 | Michael      | Chabon         |   634 |
-- |      12 | Raymond      | Carver         |   526 |

--Order by Column Index
SELECT book_id,author_fname,author_lname FROM books ORDER BY 2;--Order by 2nd column ie author

--Multi-Column Order
SELECT author_lname,released_year,title FROM books ORDER BY author_lname,released_year;
--After sorting by lastname , for same lastname , sort by title
-- +----------------+---------------+-----------------------------------------------------+
-- | author_lname   | released_year | title                                               |
-- +----------------+---------------+-----------------------------------------------------+
-- | Carver         |          1981 | What We Talk About When We Talk About Love: Stories |
-- | Carver         |          1989 | Where I'm Calling From: Selected Stories            |
-- | Chabon         |          2000 | The Amazing Adventures of Kavalier & Clay           |

--Order by Concatenated Name
--Name referenced and ordered by  
SELECT CONCAT(author_fname," ",author_lname) AS author FROM books ORDER BY author;
-- +----------------------+
-- | author               |
-- +----------------------+
-- | Dan Harris           |
-- | Dave Eggers          |


--Limit Results

--Get first N items 
SELECT title, released_year FROM books ORDER BY released_year DESC LIMIT 5;

SELECT title, released_year FROM books ORDER BY released_year LIMIT 5;
-- +-----------------------------------------------------+---------------+
-- | title                                               | released_year |
-- +-----------------------------------------------------+---------------+
-- | Cannery Row                                         |          1945 |
-- | What We Talk About When We Talk About Love: Stories |          1981 |

--Start at Row 3 and get 5 items 
SELECT title, released_year FROM books ORDER BY released_year LIMIT 3,5;--starting row , count
 


 --Searching using LIKE
SELECT title , author_fname , author_lname FROM books WHERE author_fname LIKE "%da%";
--table where author first name contains "da" in it
--%test% == something>text<something 

SELECT title , author_fname , author_lname FROM books WHERE author_fname LIKE "____";
--_ _ _ _ ie 4 underscore = 4 chars

--"%" 0 or more chars
--"_a_" => Dan ie 3 chars , a in middle
--"%a"=>end with a
--"a%" => start with a

--WHERE author_fname LIKE "%\%%" => "%(\%)%"
--Same for single - =>"%\_%"
SELECT * FROM books WHERE title LIKE "%\%%"; --title contains one % (mentioned as \%)
-- +---------+-------------+--------------+--------------+---------------+----------------+-------+
-- | book_id | title       | author_fname | author_lname | released_year | stock_quantity | pages |
-- +---------+-------------+--------------+--------------+---------------+----------------+-------+
-- |      17 | 10% Happier | Dan          | Harris       |          2014 |             29 |   256 |
-- +---------+-------------+--------------+--------------+---------------+----------------+-------+


 
--Exercise

--Titles  That contain 'stories'
 SELECT title FROM books WHERE title LIKE "%stories%";
-- +-----------------------------------------------------+
-- | title                                               |
-- +-----------------------------------------------------+
-- | What We Talk About When We Talk About Love: Stories |
-- | Where I'm Calling From: Selected Stories            |
-- | Oblivion: Stories                                   |
-- +-----------------------------------------------------+

--Print Out the Title and Page Count Print Out the Title and Page Count
SELECT title,pages FROM books ORDER BY CHAR_LENGTH(title) DESC LIMIT 1;
-- +-----------------------------------------------------+-------+
-- | title                                               | pages |
-- +-----------------------------------------------------+-------+
-- | What We Talk About When We Talk About Love: Stories |   176 |
-- +-----------------------------------------------------+-------+

--Print a summary containing the title and year, for the 3 most recent books
SELECT CONCAT(title," - ",released_year) AS summary FROM books  ORDER BY released_year DESC LIMIT 3;
-- +-----------------------------+
-- | summary                     |
-- +-----------------------------+
-- | Lincoln In The Bardo - 2017 |
-- | Norse Mythology - 2016      |
-- | 10% Happier - 2014          |
-- +-----------------------------+

--Find all books with an author_lname that contains a space(" ")
that contains a space(" ")
SELECT title,author_lname FROM books WHERE author_lname LIKE "% %";
-- +----------------------+----------------+
-- | title                | author_lname   |
-- +----------------------+----------------+
-- | Oblivion: Stories    | Foster Wallace |
-- | Consider the Lobster | Foster Wallace |
-- +----------------------+----------------+

--Find The 3 Books With The Lowest Stock Select title, year, and stock
SELECT title,released_year,stock_quantity FROM books ORDER BY 3 LIMIT 3;
-- +-----------------------------------------------------+---------------+----------------+
-- | title                                               | released_year | stock_quantity |
-- +-----------------------------------------------------+---------------+----------------+
-- | Where I'm Calling From: Selected Stories            |          1989 |             12 |
-- | American Gods                                       |          2001 |             12 |
-- | What We Talk About When We Talk About Love: Stories |          1981 |             23 |
-- +-----------------------------------------------------+---------------+----------------+

--Print title and author_lname, sorted first by author_lname and then by title
SELECT title,author_lname FROM books ORDER BY author_lname,title;

--Make This Happen... Sorted Alphabetically By Last Name
SELECT CONCAT("MY FAV ", UPPER(CONCAT(author_fname," ",author_lname))) AS yell FROM books ORDER BY author_lname;