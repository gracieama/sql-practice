-- Create Authors table
CREATE TABLE Authors (
    AuthorID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    BirthDate DATE
);

-- Create Books table
CREATE TABLE Books (
    BookID INT PRIMARY KEY,
    Title VARCHAR(100),
    PublicationYear INT,
    AuthorID INT
);

-- Insert data into Authors table
INSERT INTO Authors (AuthorID, FirstName, LastName, BirthDate) VALUES
(1, 'George', 'Orwell', '1903-06-25'),
(2, 'Harper', 'Lee', '1926-04-28'),
(3, 'J.D.', 'Salinger', '1919-01-01'),
(4, 'F. Scott', 'Fitzgerald', '1896-09-24'),
(5, 'Ernest', 'Hemingway', '1899-07-21'),
(6, 'Mark', 'Twain', '1835-11-30'),
(7, 'J.K.', 'Rowling', '1965-07-31'),
(9, 'Stephen', 'King', '1947-09-21');

-- Insert data into Books table
INSERT INTO Books (BookID, Title, PublicationYear, AuthorID) VALUES
(1, '1984', 1949, 1),
(2, 'Animal Farm', 1945, 1),
(3, 'To Kill a Mockingbird', 1960, 2),
(4, 'The Catcher in the Rye', 1951, 3),
(5, 'The Great Gatsby', 1925, 4),
(6, 'Tender is the Night', 1934, 4),
(7, 'The Old Man and The Sea', 1952, 5),
(8, 'A Farewell to Arms', 1929, 5),
(9, 'The Adventures of Huckleberry Finn', 1884, 6),
(10, 'The Adventures of Tom Sawyer', 1876, 6),
(11, 'Harry Potter and the Philosopher''s Stone', 1997, 7),
(12, 'Harry Potter and the Chamber of Secrets', 1998, 7),
(13, 'Harry Potter and the Prisoner of Azkaban', 1999, 7),
(14, 'Carrie', 1974, 8),
(15, 'The Shining', 1977, 8);