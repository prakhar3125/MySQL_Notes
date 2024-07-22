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