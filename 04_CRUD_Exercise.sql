-- Show databases
SHOW DATABASES;

-- Use the shirt_db database
USE shirt_db;

-- Create the shirt table
CREATE TABLE shirt (
    shirt_id INT AUTO_INCREMENT PRIMARY KEY,
    article VARCHAR(100),
    color VARCHAR(100),
    size VARCHAR(100),
    worn INT
);

-- Insert initial data into the shirt table
INSERT INTO shirt (article, color, size, worn)
VALUES 
    ('t-shirt', 'white', 'S', 10),
    ('t-shirt', 'green', 'S', 200),
    ('polo shirt', 'black', 'M', 10),
    ('tank top', 'blue', 'S', 50),
    ('t-shirt', 'pink', 'S', 0),
    ('polo shirt', 'red', 'M', 5),
    ('tank top', 'white', 'S', 200),
    ('tank top', 'blue', 'M', 15);

-- Add a new shirt
INSERT INTO shirt (article, color, size, worn)
VALUES ('polo shirt', 'purple', 'M', 50);


-- Select all shirts and print out only article and color
SELECT article, color FROM shirt;

-- Select all medium shirts and print out everything but shirt_id
SELECT article, color, size, worn FROM shirt WHERE size = 'M';

-- Update all polo shirts, change their size to L
UPDATE shirt SET size = 'L' WHERE article = 'polo shirt';

-- Update the shirt last worn 15 days ago, change last_worn to 0
UPDATE shirt SET worn = 0 WHERE worn = 15;

-- Update all white shirts, change size to 'XS' and color to 'off white'
UPDATE shirt SET size = 'XS', color = 'off white' WHERE color = 'white';

-- Delete all old shirts last worn 200 days ago
DELETE FROM shirt WHERE worn = 200;

-- Delete all tank tops
DELETE FROM shirt WHERE article = 'tank top';

-- Delete all shirts
DELETE FROM shirt;

-- Drop the entire shirts table
DROP TABLE shirt;
