CREATE TABLE `authors` (
    `id` int NOT NULL  AUTO_INCREMENT,
    `name` VARCHAR(255),
    PRIMARY KEY (`id`)
);

CREATE TABLE `books`(
    `id` int NOT NULL  AUTO_INCREMENT,
    `title` VARCHAR(255),
    `year` int,
    `author_id` int,
    `rating` decimal(3,1),
    PRIMARY KEY (`id`),
    FOREIGN KEY(author_id) REFERENCES authors(id) ON DELETE CASCADE
);

INSERT INTO authors (name) VALUES('Первый');
INSERT INTO authors (name) VALUES('Второй');
INSERT INTO authors (name) VALUES('Третий');


#### DEBUG ###

TRUNCATE TABLE `books`;
SET @id=(SELECT id FROM authors WHERE name="Первый");
INSERT INTO books (title, year, author_id, rating) VALUES ("Первый_1", 2018, @id, 2);
INSERT INTO books (title, year, author_id, rating) VALUES ("Первый_2", 2018, @id, 3);
INSERT INTO books (title, year, author_id, rating) VALUES ("Первый_3", 2018, @id, 4);
INSERT INTO books (title, year, author_id, rating) VALUES ("Первый_4", 2018, @id, 1);

SET @id=(SELECT id FROM authors WHERE name="Второй");
INSERT INTO books (title, year, author_id, rating) VALUES ("Второй_1", 2018, @id, 0);
INSERT INTO books (title, year, author_id, rating) VALUES ("Второй_2", 2018, @id, 4);
INSERT INTO books (title, year, author_id, rating) VALUES ("Второй_3", 2018, @id, 4);
INSERT INTO books (title, year, author_id, rating) VALUES ("Второй_4", 2018, @id, 0);
INSERT INTO books (title, year, author_id, rating) VALUES ("Второй_5", 2018, @id, 4);
INSERT INTO books (title, year, author_id, rating) VALUES ("Второй_6", 2018, @id, 0);

SET @id=(SELECT id FROM authors WHERE name="Третий");
INSERT INTO books (title, year, author_id, rating) VALUES ("Третий_1", 2018, @id, 2);
INSERT INTO books (title, year, author_id, rating) VALUES ("Третий_2", 2018, @id, 3);
INSERT INTO books (title, year, author_id, rating) VALUES ("Третий_3", 2018, @id, 3);
INSERT INTO books (title, year, author_id, rating) VALUES ("Третий_4", 2018, @id, 1);
INSERT INTO books (title, year, author_id, rating) VALUES ("Третий_5", 2018, @id, 1);
INSERT INTO books (title, year, author_id, rating) VALUES ("Третий_6", 2018, @id, 4);
INSERT INTO books (title, year, author_id, rating) VALUES ("Третий_7", 2018, @id, 4);
