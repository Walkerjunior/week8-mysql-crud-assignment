-- Create Authors table
CREATE TABLE Authors (
    author_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE
);

-- Create Categories table
CREATE TABLE Categories (
    category_id INT PRIMARY KEY AUTO_INCREMENT,
    category_name VARCHAR(50) NOT NULL UNIQUE
);

-- Create Books table
CREATE TABLE Books (
    book_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(200) NOT NULL,
    author_id INT,
    category_id INT,
    published_year YEAR,
    FOREIGN KEY (author_id) REFERENCES Authors(author_id),
    FOREIGN KEY (category_id) REFERENCES Categories(category_id)
);

-- Create Members table
CREATE TABLE Members (
    member_id INT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    join_date DATE NOT NULL
);

-- Create Borrow_Records table
CREATE TABLE Borrow_Records (
    record_id INT PRIMARY KEY AUTO_INCREMENT,
    member_id INT,
    book_id INT,
    borrow_date DATE NOT NULL,
    return_date DATE,
    FOREIGN KEY (member_id) REFERENCES Members(member_id),
    FOREIGN KEY (book_id) REFERENCES Books(book_id)
);

-- Sample data
INSERT INTO Authors (name, email) VALUES ('George Orwell', 'george.orwell@example.com');
INSERT INTO Categories (category_name) VALUES ('Fiction');
INSERT INTO Books (title, author_id, category_id, published_year)
VALUES ('1984', 1, 1, 1949);
INSERT INTO Members (full_name, email, join_date)
VALUES ('John Doe', 'john@example.com', '2023-01-10');
INSERT INTO Borrow_Records (member_id, book_id, borrow_date)
VALUES (1, 1, '2023-02-15');
