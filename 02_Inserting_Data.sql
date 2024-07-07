-- Create a table 'cats' with columns for name and age
CREATE TABLE cats (
    name VARCHAR(100),
    age INT
);

-- Describe the structure of the 'cats' table
DESC cats;
-- Output:
-- +-------+--------------+------+-----+---------+-------+
-- | Field | Type         | Null | Key | Default | Extra |
-- +-------+--------------+------+-----+---------+-------+
-- | name  | varchar(100) | YES  |     | NULL    |       |
-- | age   | int          | YES  |     | NULL    |       |
-- +-------+--------------+------+-----+---------+-------+

-- Inserting a single row into the 'cats' table
INSERT INTO cats(name, age)
VALUES ('Jetson', 7);

-- Inserting into 'cats' table with columns in different order
INSERT INTO cats(age, name)
VALUES (12, 'Victoria');

-- Inserting multiple rows into 'cats' table at once
INSERT INTO cats(name, age)
VALUES ('Charlie', 10),
       ('Sadie', 3),
       ('Lazy Bear', 1);

-- Select all records from 'cats' table
SELECT * FROM cats;
-- Output:
-- +------------+-----+
-- | name       | age |
-- +------------+-----+
-- | Jetson     | 7   |
-- | Victoria   | 12  |
-- | Charlie    | 10  |
-- | Sadie      | 3   |
-- | Lazy Bear  | 1   |
-- +------------+-----+

-- Creating 'cats' table allowing NULL values
CREATE TABLE cats (
    name VARCHAR(100),
    age INT
);

-- Inserting values allowing NULL
INSERT INTO cats(name)
VALUES ('Bean');

INSERT INTO cats()
VALUES ();

-- Output with NULL values allowed:
-- +------+-----+
-- | name | age |
-- +------+-----+
-- | Bean | NULL|
-- | NULL | NULL|
-- +------+-----+

-- Creating 'cats2' table with columns not allowing NULL values
CREATE TABLE cats2 (
    name VARCHAR(100) NOT NULL,
    age INT NOT NULL
);

-- Inserting values into 'cats2' table
INSERT INTO cats2(name)
VALUES ('Bean'); -- Error: Not enough values

INSERT INTO cats2(name, age)
VALUES ('Another Cat', 3);

-- Creating 'cats3' table with default values
CREATE TABLE cats3 (
    name VARCHAR(100) DEFAULT 'unnamed',
    age INT DEFAULT 99
);

-- Creating 'cats4' table with default values and not allowing NULL
CREATE TABLE cats4 (
    name VARCHAR(100) NOT NULL DEFAULT 'unnamed',
    age INT NOT NULL DEFAULT 99
);

-- Creating 'unique_cats' table with a primary key
CREATE TABLE unique_cats (
    cat_id INT PRIMARY KEY,
    name VARCHAR(100),
    age INT
);

-- Inserting values into 'unique_cats' table
INSERT INTO unique_cats(cat_id, name, age)
VALUES (1, 'a', 2);

-- Error: Trying to insert a duplicate primary key value
INSERT INTO unique_cats(cat_id, name, age)
VALUES (1, 'b', 3);

-- Creating 'unique_cats' table with primary key using alternate syntax
CREATE TABLE unique_cats (
    cat_id INT,
    name VARCHAR(100),
    age INT,
    PRIMARY KEY(cat_id)
);

-- Creating 'unique_cats3' table with auto increment primary key
CREATE TABLE unique_cats3 (
    cat_id INT AUTO_INCREMENT,
    name VARCHAR(100),
    age INT,
    PRIMARY KEY (cat_id)
);

-- Inserting values into 'unique_cats3' table
INSERT INTO unique_cats3(name, age)
VALUES ('P', 20);

INSERT INTO unique_cats3(name, age)
VALUES ('P', 21);

-- Output with auto-incremented primary key:
-- +--------+------+-----+
-- | cat_id | name | age |
-- +--------+------+-----+
-- |   1    | P    |  20 |
-- |   2    | P    |  21 |
-- +--------+------+-----+

-- Creating 'employees' table with specified fields

-- id - number(automatically increments) and  primary key
-- last_name - text, mandatory
-- first_name - text, mandatory
-- middle_name - text, not mandatory
-- age - number mandatory
-- current_status - text, mandatory, defaults to 'employed'
CREATE TABLE employees (
    id INT AUTO_INCREMENT PRIMARY KEY,
    last_name VARCHAR(100) NOT NULL,
    first_name VARCHAR(100) NOT NULL,
    middle_name VARCHAR(100),
    age INT NOT NULL,
    current_status VARCHAR(100) NOT NULL DEFAULT 'employed'
);
