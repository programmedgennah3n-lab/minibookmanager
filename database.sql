CREATE DATABASE IF NOT EXISTS mini_book_manager
    CHARACTER SET utf8mb4
    COLLATE utf8mb4_unicode_ci;

USE mini_book_manager;

CREATE TABLE IF NOT EXISTS books (
    book_id VARCHAR(30) PRIMARY KEY,
    title VARCHAR(200) NOT NULL,
    author VARCHAR(150) NOT NULL,
    category VARCHAR(80) NOT NULL,
    publication_year SMALLINT UNSIGNED NOT NULL,
    status ENUM('AVAILABLE', 'BORROWED') NOT NULL DEFAULT 'AVAILABLE',
    borrower_name VARCHAR(150) NULL,
    student_id VARCHAR(30) NULL,
    department VARCHAR(100) NULL,
    borrowed_at DATETIME NULL,
    due_date DATE NULL,
    returned_at DATETIME NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT chk_publication_year CHECK (publication_year BETWEEN 1000 AND 9999),
    INDEX idx_books_title (title),
    INDEX idx_books_category (category)
) ENGINE=InnoDB;

ALTER TABLE books
    ADD COLUMN IF NOT EXISTS student_id VARCHAR(30) NULL AFTER borrower_name,
    ADD COLUMN IF NOT EXISTS department VARCHAR(100) NULL AFTER student_id,
    ADD COLUMN IF NOT EXISTS due_date DATE NULL AFTER borrowed_at;
