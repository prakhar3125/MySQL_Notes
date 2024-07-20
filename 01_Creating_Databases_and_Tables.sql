-- Database Operations

-- Create a new database
CREATE DATABASE <database_name>;

-- Show all existing databases
SHOW DATABASES;

-- Change the current database to the specified one
USE <database_name>;

-- Verify the current database in use SELECT DATABASE();

-- Table Operations

-- Create a new table with specified columns and data types
CREATE TABLE <table_name> 
(
    column_name data_type, 
    column_name data_type
);

-- Example: Creating a table named 'Prakhar' with columns 'name' and 'age'
CREATE TABLE Prakhar 
(
    name VARCHAR(100),
    age  INT 
);

-- Show all tables in the current database
SHOW TABLES;

-- Show columns and their details from a specific table
SHOW COLUMNS FROM <table_name>;
-- OR
DESC <table_name>;

-- Drop (delete) a specific table
DROP TABLE <table_name>;

-- Data Types

-- VARCHAR: Variable character string with a specified maximum length
-- Example: VARCHAR(100) allows up to 100 characters
