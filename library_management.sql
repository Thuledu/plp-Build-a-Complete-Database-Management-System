CREATE DATABASE LibraryManagement;
   USE LibraryManagement;

-- Create the Library Management Database
CREATE DATABASE IF NOT EXISTS LibraryManagement;
USE LibraryManagement;

-- Create a table for Publishers
CREATE TABLE Publisher (
    PublisherID INT AUTO_INCREMENT PRIMARY KEY,
    PublisherName VARCHAR(100) NOT NULL UNIQUE,
    PublisherAddress VARCHAR(255) NOT NULL,
    PublisherPhone VARCHAR(20) NOT NULL
);

-- Create a table for Books
CREATE TABLE Book (
    BookID INT AUTO_INCREMENT PRIMARY KEY,
    Title VARCHAR(100) NOT NULL,
    Author VARCHAR(100) NOT NULL,
    PublisherID INT,
    FOREIGN KEY (PublisherID) REFERENCES Publisher(PublisherID) ON DELETE SET NULL,
    UNIQUE (Title, Author)
);

-- Create a table for Library Branches
CREATE TABLE LibraryBranch (
    BranchID INT AUTO_INCREMENT PRIMARY KEY,
    BranchName VARCHAR(100) NOT NULL,
    BranchAddress VARCHAR(255) NOT NULL
);

-- Create a table for Borrowers
CREATE TABLE Borrower (
    CardNo INT AUTO_INCREMENT PRIMARY KEY,
    BorrowerName VARCHAR(100) NOT NULL,
    BorrowerAddress VARCHAR(255) NOT NULL,
    BorrowerPhone VARCHAR(20) NOT NULL
);

-- Create a table for Book Copies
CREATE TABLE BookCopies (
    CopyID INT AUTO_INCREMENT PRIMARY KEY,
    BookID INT NOT NULL,
    BranchID INT NOT NULL,
    NoOfCopies INT NOT NULL,
    FOREIGN KEY (BookID) REFERENCES Book(BookID) ON DELETE CASCADE,
    FOREIGN KEY (BranchID) REFERENCES LibraryBranch(BranchID) ON DELETE CASCADE
);

-- Create a table for Borrowing Transactions
CREATE TABLE Borrowing (
    TransactionID INT AUTO_INCREMENT PRIMARY KEY,
    CardNo INT NOT NULL,
    BookID INT NOT NULL,
    BorrowDate DATE NOT NULL,
    DueDate DATE NOT NULL,
    ReturnDate DATE,
    FOREIGN KEY (CardNo) REFERENCES Borrower(CardNo) ON DELETE CASCADE,
    FOREIGN KEY (BookID) REFERENCES Book(BookID) ON DELETE CASCADE
);
