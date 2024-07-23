--Count Number of Rows from books Including NULL
SELECT COUNT(*) FROM books;

--Count rows with actual names , Excludes NULL
SELECT COUNT(author_fname) FROM books;

--Count only Unique/Distinct name 
SELECT COUNT(DISTINCT author_fname) FROM books;

--Count number of rows with The in the title
SELECT COUNT(*) FROM books WHERE title LIKE "%the%";

--Grouping
                                      --Lname
-- | The Namesake                     | Lahiri       |
-- | Interpreter of Maladies          | Lahiri       |

-- | Norse Mythology                  | Gaiman       |
-- | American Gods                    | Gaiman       |

--Each row with same lname grouped together
SELECT author_lname,COUNT(*) FROM books GROUP BY author_lname;
-- +----------------+----------+
-- | author_lname   | COUNT(*) |
-- +----------------+----------+
-- | Lahiri         |        2 |
-- | Gaiman         |        3 |

SELECT released_year,COUNT(*) FROM books GROUP BY released_year;

ELECT author_lname,title FROM books GROUP BY author_lname; --NOT POSSIBLE


SELECT MIN(released_year) FROM books;
SELECT MAX(pages) FROM books;

--title of longest book
SELECT MAX(pages),title FROM books;--Gives error

--Subquery

--Title of book with max pages
SELECT title ,pages FROM books WHERE pages = (SELECT MAX(pages) FROM books);
-- +-------------------------------------------+-------+
-- | title                                     | pages |
-- +-------------------------------------------+-------+
-- | The Amazing Adventures of Kavalier & Clay |   634 |

--Title of book released earliest 
SELECT title,released_year FROM books WHERE released_year = (SELECT MIN(released_year) FROM books);
-- +-------------+---------------+
-- | title       | released_year |
-- +-------------+---------------+
-- | Cannery Row |          1945 |

SELECT author_lname, COUNT(*) FROM books GROUP BY author_lname;
-- Harris         |        2 
--Multiple person with same Lname counted in this

SELECT author_lname, COUNT(*) FROM books GROUP BY author_lname,author_fname;
-- | Harris         |        1 |
-- | Harris         |        1 |

SELECT CONCAT(author_fname," ",author_lname) AS author,COUNT(*) FROM books GROUP BY author;
-- | David Foster Wallace |        2 |
-- | Dan Harris           |        1 |
-- | Freida Harris        |        1 | 



--Min/Max with Group By
--Find the year each author published their first book
SELECT author_fname, author_lname,COUNT(*) AS bookWritten,Max(released_year) AS latestRelease, Min(released_year) AS earliestRelease,MAX(pages) AS longestPageCount FROM   books GROUP  BY author_lname, author_fname; 
--Group Formed , Min/Max within group

-- +--------------+----------------+-------------+---------------+-----------------+------------------+
-- | author_fname | author_lname   | bookWritten | latestRelease | earliestRelease | longestPageCount |
-- +--------------+----------------+-------------+---------------+-----------------+------------------+
-- | Jhumpa       | Lahiri         |           2 |          2003 |            1996 |              291 |


SELECT SUM(pages) FROM books;

SELECT author_lname,SUM(pages) FROM books GROUP BY author_lname;
-- +----------------+------------+
-- | author_lname   | SUM(pages) |
-- +----------------+------------+
-- | Lahiri         |        489 |
-- | Gaiman         |        977 |

SELECT author_lname,COUNT(*),SUM(released_year) FROM books GROUP BY author_lname;
-- +----------------+----------+--------------------+
-- | author_lname   | COUNT(*) | SUM(released_year) |
-- +----------------+----------+--------------------+
-- | Lahiri         |        2 |               3999 |


SELECT AVG(released_year) FROM books;
-- +--------------------+
-- | AVG(released_year) |
-- +--------------------+
-- |          1999.7895 |

--Average stock of book released in same year
SELECT released_year,AVG(stock_quantity),COUNT(*) FROM books GROUP BY released_year;
-- +---------------+---------------------+----------+
-- | released_year | AVG(stock_quantity) | COUNT(*) |
-- +---------------+---------------------+----------+
-- |          2003 |             66.0000 |        2 |


--Exercise


-- Print the number of books in the database
 SELECT COUNT(title) FROM books;

--Print out how many books were released in each year
 SELECT released_year,COUNT(*) FROM books GROUP BY released_year;
-- +---------------+----------+
-- | released_year | COUNT(*) |
-- +---------------+----------+
-- |          2003 |        2 |
-- |          2016 |        1 |
-- |          2001 |        3 |

--Print out the total number of books in stock
 SELECT SUM(stock_quantity) FROM books;

--Find the average released_year for each author
 SELECT CONCAT(author_fname," ",author_lname) ,AVG(released_year) FROM books GROUP BY author_fname,author_lname;
-- +---------------------------------------+--------------------+
-- | CONCAT(author_fname," ",author_lname) | AVG(released_year) |
-- +---------------------------------------+--------------------+
-- | Jhumpa Lahiri                         |          1999.5000 |
-- | Neil Gaiman                           |          2006.6667 |

-- Find the full name of the author who wrote the longest book
 SELECT CONCAT(author_fname," ",author_lname) FROM books WHERE pages = (SELECT MAX(pages) FROM books);
--or
SELECT CONCAT(author_fname," ",author_lname),pages FROM books ORDER BY pages DESC LIMIT 1;

 SELECT released_year,COUNT(*) AS Books , AVG(pages) AS avg FROM books GROUP BY released_year ORDER BY released_year ;
-- +---------------+-------+----------+
-- | released_year | Books | avg      |
-- +---------------+-------+----------+
-- |          1945 |     1 | 181.0000 |