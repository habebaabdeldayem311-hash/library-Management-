CREATE TABLE Authors (
    author_id INT PRIMARY KEY,
    author_name VARCHAR(100)
);

CREATE TABLE Books (
    book_id INT PRIMARY KEY,
    title VARCHAR(150),
    author_id INT,
    category VARCHAR(100),
    price DECIMAL(10,2),
    FOREIGN KEY (author_id) REFERENCES Authors(author_id)
);

CREATE TABLE Members (
    member_id INT PRIMARY KEY,
    member_name VARCHAR(100),
    phone VARCHAR(20)
);

CREATE TABLE Borrowings (
    borrow_id INT PRIMARY KEY,
    member_id INT,
    book_id INT,
    borrow_date DATE,
    return_date DATE,
    FOREIGN KEY (member_id) REFERENCES Members(member_id),
    FOREIGN KEY (book_id) REFERENCES Books(book_id)
);
INSERT INTO Authors VALUES (1, 'Ahmed Khaled');
INSERT INTO Authors VALUES (2, 'Naguib Mahfouz');

INSERT INTO Books VALUES (1, 'SQL Basics', 1, 'Technology', 200);
INSERT INTO Books VALUES (2, 'Cairo Nights', 2, 'Literature', 150);

INSERT INTO Members VALUES (1, 'Habeba', '01000000000');
INSERT INTO Members VALUES (2, 'Mona', '01111111111');

INSERT INTO Borrowings VALUES (1, 1, 1, '2026-02-01', '2026-02-10');
INSERT INTO Borrowings VALUES (2, 2, 2, '2026-02-05', NULL);

SELECT category, COUNT(*) AS total_books
FROM Books
GROUP BY category;
