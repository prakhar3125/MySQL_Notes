--UNIQUE Constraint

-- Create a new table named 'companies'
CREATE TABLE companies (
    -- Define 'supplier_id' as an integer that automatically increments with each new row
    supplier_id INT AUTO_INCREMENT,
    
    -- Define 'name' as a variable character field with a maximum length of 255 characters and it cannot be null
    name VARCHAR(255) NOT NULL,
    
    -- Define 'phone' as a variable character field with a maximum length of 15 characters, it cannot be null, and must be unique
    phone VARCHAR(15) NOT NULL UNIQUE,
    
    -- Define 'address' as a variable character field with a maximum length of 255 characters and it cannot be null
    address VARCHAR(255) NOT NULL,
    
    -- Set 'supplier_id' as the primary key for the table
    PRIMARY KEY (supplier_id)
);


--CHECK constraints

-- Create a new table named 'partiers'
CREATE TABLE partiers (
    -- Define 'name' as a variable character field with a maximum length of 50 characters
    name VARCHAR(50),

    -- Define 'age' as an integer field
    -- The CHECK constraint ensures that the age must be greater than 18
    age INT CHECK (age > 18)
);


--Palindrome using CHECK
CREATE TABLE palindromes(
  word VARCHAR(100) CHECK(REVERSE(word)==word);
)



--Named Constraints //Give custom constraint error
CREATE TABLE partiers2 (
    -- Define 'name' as a variable character field with a maximum length of 50 characters
    name VARCHAR(50),

    -- Define 'age' as an integer field
    age INT,

    -- Define a named CHECK constraint to ensure that the age must be greater than 18
    CONSTRAINT age_over_18 CHECK (age > 18)
);


 -- Attempt to insert an invalid record into the 'partiers2' table
 INSERT INTO partiers2 (name, age) VALUES ('Bob', 17);
--Check constraint 'age_over_18' is violated.