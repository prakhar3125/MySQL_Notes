CREATE TABLE books 
	(
		book_id INT NOT NULL AUTO_INCREMENT,
		title VARCHAR(100),
		author_fname VARCHAR(100),
		author_lname VARCHAR(100),
		released_year INT,
		stock_quantity INT,
		pages INT,
		PRIMARY KEY(book_id)
	);

INSERT INTO books (title, author_fname, author_lname, released_year, stock_quantity, pages)
VALUES
('The Namesake', 'Jhumpa', 'Lahiri', 2003, 32, 291),
('Norse Mythology', 'Neil', 'Gaiman',2016, 43, 304),
('American Gods', 'Neil', 'Gaiman', 2001, 12, 465),
('Interpreter of Maladies', 'Jhumpa', 'Lahiri', 1996, 97, 198),
('A Hologram for the King: A Novel', 'Dave', 'Eggers', 2012, 154, 352),
('The Circle', 'Dave', 'Eggers', 2013, 26, 504),
('The Amazing Adventures of Kavalier & Clay', 'Michael', 'Chabon', 2000, 68, 634),
('Just Kids', 'Patti', 'Smith', 2010, 55, 304),
('A Heartbreaking Work of Staggering Genius', 'Dave', 'Eggers', 2001, 104, 437),
('Coraline', 'Neil', 'Gaiman', 2003, 100, 208),
('What We Talk About When We Talk About Love: Stories', 'Raymond', 'Carver', 1981, 23, 176),
("Where I'm Calling From: Selected Stories", 'Raymond', 'Carver', 1989, 12, 526),
('White Noise', 'Don', 'DeLillo', 1985, 49, 320),
('Cannery Row', 'John', 'Steinbeck', 1945, 95, 181),
('Oblivion: Stories', 'David', 'Foster Wallace', 2004, 172, 329),
('Consider the Lobster', 'David', 'Foster Wallace', 2005, 92, 343);



CONCAT(column, anotherColumn) 

SELECT CONCAT(author_fname, '@@@') FROM books;
-- +-----------------------------+
-- | CONCAT(author_fname, '@@@') |
-- +-----------------------------+
-- | Jhumpa@@@                   |
-- | Neil@@@                     |


SELECT CONCAT(author_fname, author_lname)  FROM books;
-- +------------------------------------+
-- | CONCAT(author_fname, author_lname) |
-- +------------------------------------+
-- | JhumpaLahiri                       |
-- | NeilGaiman                         |

SELECT CONCAT(author_fname," " ,author_lname)  FROM books;
-- +----------------------------------------+
-- | CONCAT(author_fname," " ,author_lname) |
-- +----------------------------------------+
-- | Jhumpa Lahiri                          |
-- | Neil Gaiman                            |

SELECT CONCAT(author_fname,"XYZ" ,author_lname,"PQR")  FROM books;
-- +------------------------------------------------+
-- | CONCAT(author_fname,"XYZ" ,author_lname,"PQR") |
-- +------------------------------------------------+
-- | JhumpaXYZLahiriPQR                             |

--Rename Concatenated Column
SELECT CONCAT(author_fname," " ,author_lname) AS author_name  FROM books; 
-- +----------------------+
-- | author_name          |
-- +----------------------+
-- | Jhumpa Lahiri        |

--Concat with Separator 
--With separator CONCAT_WS(separator , col...) , separator in between of each given column
--Separator is first element in bracket
SELECT 
    CONCAT_WS(' - ', title, author_fname, author_lname)  --
FROM books;
-- +------------------------------------------------------------------------+
-- | CONCAT_WS(' - ', title, author_fname, author_lname)                    |
-- +------------------------------------------------------------------------+
-- | The Namesake - Jhumpa - Lahiri                                         |


--Substring OR SUBSTR()   
SELECT SUBSTRING('Hello World', 1, 4); --Hell , char 1 to 4 (count 4 char from index 1), 1 based indexing
SELECT SUBSTRING('Hello World', 5); --o World , char 5 to the end
SELECT SUBSTRING('Hello World', -3); --rld ,start at 3rd char from behind
SELECT SUBSTRING('Hello World', -3, 2); --rl ,from -3 , count 2 chars


SELECT SUBSTRING(title , 1 , 5) FROM books;
-- +--------------------------+
-- | SUBSTRING(title , 1 , 5) |
-- +--------------------------+
-- | The N                    |
-- | Norse                    |

SELECT SUBSTRING(author_lname , 1 , 1) , author_lname AS initials FROM books;
-- +---------------------------------+----------------+
-- | SUBSTRING(author_lname , 1 , 1) | initials       |
-- +---------------------------------+----------------+
-- | L                               | Lahiri         |
-- | G                               | Gaiman         |


-- Concatenation + Substring
 SELECT CONCAT(SUBSTRING(title,1,10),'...') AS Short_Name FROM books; --Passing substring in concat 
-- +---------------+
-- | Short_Name    |
-- +---------------+
-- | The Namesa... |
-- | Norse Myth... |


SELECT CONCAT(SUBSTRING(author_fname,1,1) , "." , SUBSTRING(author_lname,1,1)) AS Initials FROM books;
-- +----------+
-- | Initials |
-- +----------+
-- | J.L      |


SELECT REPLACE(String, char to be replaced,char to be replaced with);
SELECT REPLACE('Hello World', 'Hell', '%$#@'); --%$#@o World   

 SELECT REPLACE(title , " ", "-") FROM BOOKS;
-- +-----------------------------------------------------+
-- | REPLACE(title , " ", "-")                           |
-- +-----------------------------------------------------+
-- | The-Namesake                                        |


--Reverse
SELECT REVERSE("String to be reverse");--esrever eb ot gnirtS 
SELECT REVERSE(title) FROM BOOKS;  
-- +-----------------------------------------------------+
-- | REVERSE(title)                                      |
-- +-----------------------------------------------------+
-- | ekasemaN ehT                                        |

SELECT CONCAT(author_fname , REVERSE(author_fname)) FROM BOOKS;--make palindrome ,Dave -> DaveevaD  

--Character Length
SELECT CHAR_LENGTH("Hello"); -- 5
SELECT CHAR_LENGTH(title) , title FROM BOOKS; --  12 | The Namesake 

--Upper and Lower

SELECT UPPER("Hello"); --or UCASE
SELECT LOWER("Hello"); --or LCASE

SELECT CONCAT("I LOVE " , UPPER(title), "!!!") FROM BOOKS;
-- The Namesake   --> I LOVE THE NAMESAKE!!! 

--Insert
SELECT INSERT(str,pos,len,newstr);
-- Parameters:
-- str: The original string to be modified ("Hello World")
-- pos: The position in the original string where the insertion begins (6)
--      (Note: Position is 1-based, so 6 means after the first 5 characters)
-- len: The number of characters in the original string to be replaced (4)
-- newstr: The substring to be inserted into the original string (" My")

SELECT INSERT("Hello World",6,0," My");--Hello My World  / Replace 0 chars
SELECT INSERT("Hello World",6,4," My");--Hello Myld    / Replace 4 chars
-- Number of characters to replace: 4 (characters "Worl" will be replaced)


--left and Right
SELECT LEFT(str,len);
SELECT LEFT("Hello",2); --He 
SELECT LEFT(author_lname,1) FROM BOOKS;--First Char of last name
-- +----------------------+
-- | LEFT(author_lname,1) |
-- +----------------------+
-- | L                    |

SELECT REPEAT("Hi",3);--HiHiHi  

SELECT TRIM("    hey you   ");--hey you /Trim leading and trailing spaces

--SELECT TRIM(LEADING|BOTH|TRAILING 'character_to_trim' FROM 'string');
SELECT TRIM(LEADING 'x' FROM 'xxxbarxxx'); --barxxx 
SELECT TRIM(BOTH 'x' FROM 'xxxbarxxx');--bar
SELECT TRIM(TRAILING 'xyz' FROM 'barxxyz'); --barx


--Exercise
SELECT author_lname AS forwards , REVERSE(author_lname) AS backwards FROM BOOKS;
-- +----------------+----------------+
-- | forwards       | backwards      |
-- +----------------+----------------+
-- | Lahiri         | irihaL         |

SELECT UPPER(CONCAT(author_fname," ",author_lname)) AS fulllll FROM BOOKS;
-- +----------------------+
-- | fulllll              |
-- +----------------------+
-- | JHUMPA LAHIRI        |

SELECT CONCAT(title," was released in ", released_year) AS blurb FROM BOOKS;
-- +--------------------------------------------------------------------------+
-- | blurb                                                                    |
-- +--------------------------------------------------------------------------+
-- | The Namesake was released in 2003                                        |

SELECT title , CHAR_LENGTH(title) AS charcount FROM BOOKS;
-- +-----------------------------------------------------+-----------+
-- | title                                               | charcount |
-- +-----------------------------------------------------+-----------+
-- | The Namesake                                        |        12 |

SELECT CONCAT(SUBSTRING(title,1,10),"...") AS short_title , CONCAT(author_lname , ",",author_fname) AS author , CONCAT(stock_quantity," in stock") AS quantity FROM BOOKS;
-- +---------------+----------------------+--------------+
-- | short_title   | author               | quantity     |
-- +---------------+----------------------+--------------+
-- | The Namesa... | Lahiri,Jhumpa        | 32 in stock  |
-- | Norse Myth... | Gaiman,Neil          | 43 in stock  |