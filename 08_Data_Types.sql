--Char => Char(n) upto length n 
--Takes constant space of n Bytes
CREATE TABLE states(abbr CHAR(2));--Only Upto 2 length values allowed

-- | Type      | Storage (Bytes) |
-- |-----------|------------------|
-- | TINYINT   | 1                |
-- | SMALLINT  | 2                |
-- | MEDIUMINT | 3                |
-- | INT       | 4                |
-- | BIGINT    | 8                |

--DECIMAL(m,n) => upto m digits , n digits after decimal
--(m-n).n format
DECIMAL(5, 2) --=> largest possible value 999.99
--3 digit.2 digit format
--8347.1 => error
--5.026 => 5.03 (Rounded up)

CREATE TABLE products (price DECIMAL(5,2));
INSERT INTO products (price) VALUES (4.50);
SELECT * FROM products;
-- +-------+
-- | price |
-- +-------+
-- |  4.50 |

CREATE TABLE nums (x FLOAT, y DOUBLE);
INSERT INTO nums (x,y) VALUES (1.123, 1.123);
INSERT INTO nums (x,y) VALUES (1.12345678, 1.12345678);

SELECT * FROM nums;
-- +---------+------------+
-- | x       | y          |
-- +---------+------------+
-- |   1.123 |      1.123 |
-- | 1.12346 | 1.12345678 |--Precision Decreases in Float  
--Date YYY-MM-DD 
--Time HH:MM:SS
--DATETIME YYYY-MM-DD HH:MM:SS


CREATE TABLE people (
	name VARCHAR(100),
    birthdate DATE,
    birthtime TIME,
    birthdt DATETIME
);
-- +-------+------------+-----------+---------------------+
-- | name  | birthdate  | birthtime | birthdt             |
-- +-------+------------+-----------+---------------------+
-- | Elton | 2000-12-25 | 11:00:00  | 2000-12-25 11:00:00 |
-- | Lulu  | 1985-04-11 | 09:45:10  | 1985-04-11 09:45:10 |
-- | Juan  | 2020-08-15 | 23:59:00  | 2020-08-15 23:59:00 |

SELECT CURTIME(); -- Retrieves the current time
SELECT CURDATE(); -- Retrieves the current date
SELECT NOW(); -- Retrieves the current date and time
--Add current date and time 
INSERT INTO people (name, birthdate, birthtime, birthdt) VALUES ('Hazel', CURDATE(), CURTIME(), NOW());


SELECT DAYOFMONTH('2007-02-03');

SELECT
    birthdate,
    DAY(birthdate) AS day, -- Day of the month (1-31)
    DAYNAME(birthdate) AS day_name, -- Name of the day (e.g., 'Monday')
    DAYOFMONTH(birthdate) AS day_of_month, -- Day of the month (same as DAY)
    DAYOFWEEK(birthdate) AS day_of_week, -- Day of the week (1 = Sunday, 2 = Monday, ...)
    DAYOFYEAR(birthdate) AS day_of_year -- Day of the year (1-366)
FROM people;

-- +------------+------+----------+--------------+-------------+-------------+
-- | birthdate  | day  | day_name | day_of_month | day_of_week | day_of_year |
-- +------------+------+----------+--------------+-------------+-------------+
-- | 2000-12-25 |   25 | Monday   |           25 |           2 |         360 |
SELECT
    birthdt,
    HOUR(birthdt) AS hour, -- Hour (0-23)
    MINUTE(birthdt) AS minute, -- Minute (0-59)
    SECOND(birthdt) AS second -- Second (0-59)
FROM people;


SELECT CONCAT(MONTHNAME(birthdate) ," ", DAY(birthdate) ," ", YEAR(birthdate)) FROM people;
-- +-------------------------------------------------------------------------+
-- | CONCAT(MONTHNAME(birthdate) ," ", DAY(birthdate) ," ", YEAR(birthdate)) |
-- +-------------------------------------------------------------------------+
-- | December 25 2000                                                        |


-- | Specifier | Description                                                   |
-- |-----------|---------------------------------------------------------------|
-- | %a        | Abbreviated weekday name (Sun..Sat)                           |
-- | %b        | Abbreviated month name (Jan..Dec)                             |
-- | %c        | Month, numeric (0..12)                                        |
-- | %D        | Day of the month with English suffix (0th, 1st, 2nd, 3rd, …) |
-- | %d        | Day of the month, numeric (00..31)                             |
-- | %e        | Day of the month, numeric (0..31)                              |
-- | %H        | Hour (00..23)                                                 |
-- | %i        | Minutes, numeric (00..59)                                     |
-- | %S        | Seconds (00..59)                                              |
-- | %M        | Month name (January..December)                                |
-- | %p        | AM or PM                                                       |
-- | %T        | Time, 24-hour (hh:mm:ss)                                      |


SELECT
    birthdate,
    DATE_FORMAT(birthdate, "%a"), -- Abbreviated weekday name (Sun..Sat)
    DATE_FORMAT(birthdate, "%b"), -- Abbreviated month name (Jan..Dec)
    DATE_FORMAT(birthdate, "%c"), -- Month, numeric (0..12)
    DATE_FORMAT(birthdate, "%D"), -- Day of the month with English suffix (0th, 1st, 2nd, …)
    DATE_FORMAT(birthdate, "%d"), -- Day of the month, numeric (00..31)
    DATE_FORMAT(birthdate, "%e") -- Day of the month, numeric (0..31)
FROM people;


-- +------------+------+------+------+------+------+------+
-- | birthdate  | %a   | %b   | %c   | %D   | %d   | %e   |
-- +------------+------+------+------+------+------+------+
-- | 2000-12-25 | Mon  | Dec  | 12   | 25th | 25   | 25   |


--Combine Specifier

SELECT
    birthdate,
    DATE_FORMAT(birthdate, "%a %b %D") -- Abbreviated weekday name, abbreviated month name, and day of the month with English suffix
FROM people;

-- +------------+--------------+
-- | birthdate  | %a %b %D     |
-- +------------+--------------+
-- | 2000-12-25 | Mon Dec 25th |


SELECT
    birthdate,
    CONCAT(
        'Born on ', 
        DATE_FORMAT(birthdate, "%a"), ' ', -- Abbreviated weekday name
        'in ', 
        DATE_FORMAT(birthdate, "%b"), ' ', -- Abbreviated month name
        'the ', 
        DATE_FORMAT(birthdate, "%D") -- Day of the month with English suffix
    ) AS formatted_date
FROM people;
-- +------------+-----------------------------+
-- | birthdate  | formatted_date              |
-- +------------+-----------------------------+
-- | 2000-12-25 | Born on Mon in Dec the 25th |







-- DATEDIFF(expr1,expr2) returns expr1 − expr2 
SELECT birthdate, DATEDIFF(CURDATE(),birthdate) FROM people;
-- +------------+-------------------------------+
-- | birthdate  | DATEDIFF(CURDATE(),birthdate) |
-- +------------+-------------------------------+
-- | 2000-12-25 |                          8612 |


-- DATE_ADD(date, INTERVAL expr unit)
-- DATE_SUB(date, INTERVAL expr unit)

SELECT
    birthdate,
    DATE_ADD(birthdate, INTERVAL 1 YEAR) AS next_year, -- Adds 1 year to birthdate
    DATE_ADD(birthdate, INTERVAL 6 MONTH) AS next_six_months, -- Adds 6 months to birthdate
    DATE_SUB(birthdate, INTERVAL 1 YEAR) AS last_year, -- Subtracts 1 year from birthdate
    DATE_SUB(birthdate, INTERVAL 7 DAY) AS one_week_ago -- Subtracts 7 days from birthdate
FROM people;

-- +------------+------------+-----------------+------------+--------------+
-- | birthdate  | next_year  | next_six_months | last_year  | one_week_ago |
-- +------------+------------+-----------------+------------+--------------+
-- | 2000-12-25 | 2001-12-25 | 2001-06-25      | 1999-12-25 | 2000-12-18   |



--TIMEDIFF(expr1, expr2)
SELECT TIMEDIFF('14:00:00', CURTIME()) AS time_difference; -- Difference between 2:00 PM and current time
-- +-----------------+
-- | time_difference |
-- +-----------------+
-- | 12:19:15        |


SELECT name, birthdate, birthdate + INTERVAL 21 YEAR FROM people;
-- +-------+------------+------------------------------+
-- | name  | birthdate  | birthdate + INTERVAL 21 YEAR |
-- +-------+------------+------------------------------+
-- | Elton | 2000-12-25 | 2021-12-25                   |

SELECT name, birthdate, YEAR(birthdate + INTERVAL 21 YEAR) FROM people;
-- +-------+------------+------------------------------------+
-- | name  | birthdate  | YEAR(birthdate + INTERVAL 21 YEAR) | 
-- +-------+------------+------------------------------------+
-- | Elton | 2000-12-25 |                               2021 |







SELECT
    -- Convert a date to datetime with default time
    TIMESTAMP('2024-07-24') AS timestamp_date, -- '2024-07-24 00:00:00'
    
    -- Add 1 month to the current datetime
    TIMESTAMPADD(MONTH, 1, NOW()) AS next_month, -- e.g., if NOW() is '2024-07-24 14:00:00', result will be '2024-08-24 14:00:00'
    
    -- Subtract 15 days from a specific datetime
    TIMESTAMPADD(DAY, -15, '2024-07-24 14:00:00') AS fifteen_days_ago, -- '2024-07-09 14:00:00'
    
    -- Calculate the difference in days between two datetimes
    TIMESTAMPDIFF(DAY, '2024-07-01', '2024-07-24') AS days_difference, -- 23
    
    -- Combine a date and a time into a single datetime and add 1 hour to it
    TIMESTAMPADD(HOUR, 1, TIMESTAMP('2024-07-24', '15:00:00')) AS one_hour_later -- '2024-07-24 16:00:00'
FROM dual;
-- timestamp_date:      2024-07-24 00:00:00 — Date converted to datetime with default time.
-- next_month:          2024-08-24 01:49:30 — Current datetime plus 1 month. (Assumes NOW() was 2024-07-24 00:49:30).
-- fifteen_days_ago:    2024-07-09 14:00:00 — Date and time 15 days before 2024-07-24 14:00:00.
-- days_difference:     23 — Number of days between 2024-07-01 and 2024-07-24.
-- one_hour_later:      2024-07-24 16:00:00 — 1 hour added to 2024-07-24 15:00:00.



--Default TimeStam p
CREATE TABLE captions (
  text VARCHAR(150),
  created_at TIMESTAMP default  NOW() --OR  created_at TIMESTAMP default CURRENT_TIMESTAMP
);
INSERT INTO captions (text) VALUES ("hey"), ("yay");
-- +------+---------------------+
-- | text | created_at          |
-- +------+---------------------+
-- | hey  | 2024-07-24 01:54:05 |
-- | yay  | 2024-07-24 01:54:05 |




CREATE TABLE captions2 (
  text VARCHAR(150),
  created_at TIMESTAMP default CURRENT_TIMESTAMP,
  updated_at TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

  -- Column to store the timestamp when the row was created
  -- Default value is set to the current timestamp at the time of insertion
+------+---------------------+------------+
| text | created_at          | updated_at |
+------+---------------------+------------+
| hey  | 2024-07-24 02:01:35 | NULL       |


  -- Column to store the timestamp when the row was last updated
  -- Automatically updates to the current timestamp whenever the row is modified
UPDATE captions2 SET text= "yay";
-- +------+---------------------+---------------------+
-- | text | created_at          | updated_at          |
-- +------+---------------------+---------------------+
-- | yay  | 2024-07-24 02:01:35 | 2024-07-24 02:02:33 |