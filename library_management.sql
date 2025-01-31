CREATE DATABASE LibraryDB;
USE LibraryDB;

CREATE TABLE Users (
    UserID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    RegistrationDate DATE DEFAULT CURRENT_DATE
);

CREATE TABLE Books (
    BookID INT PRIMARY KEY AUTO_INCREMENT,
    Title VARCHAR(255) NOT NULL,
    Author VARCHAR(100) NOT NULL,
    Genre VARCHAR(50),
    CopiesAvailable INT CHECK (CopiesAvailable >= 0)
);

CREATE TABLE BorrowedBooks (
    BorrowID INT PRIMARY KEY AUTO_INCREMENT,
    UserID INT,
    BookID INT,
    BorrowDate DATE DEFAULT CURRENT_DATE,
    ReturnDate DATE,
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (BookID) REFERENCES Books(BookID)
);

INSERT INTO Users (Name, Email) VALUES ('Alice Johnson', 'alice@example.com');
INSERT INTO Users (Name, Email) VALUES ('Bob Smith', 'bob@example.com');

INSERT INTO Books (Title, Author, Genre, CopiesAvailable) VALUES 
('1984', 'George Orwell', 'Dystopian', 3),
('To Kill a Mockingbird', 'Harper Lee', 'Fiction', 2);

INSERT INTO BorrowedBooks (UserID, BookID) VALUES (1, 1);

SELECT u.Name, b.Title, bb.BorrowDate 
FROM BorrowedBooks bb
JOIN Users u ON bb.UserID = u.UserID
JOIN Books b ON bb.BookID = b.BookID;

UPDATE Books SET CopiesAvailable = CopiesAvailable - 1 WHERE BookID = 1;
