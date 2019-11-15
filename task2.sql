#Вывести всех и добавить флан наличия положительных отзывов is_high_rating
SELECT
    a.name as author,
    COUNT(b.id) as count_books,
    IF (MAX(b.rating)>=4, 1, 0) as is_high_rating
FROM
    authors a
    JOIN books b on a.id = b.author_id
GROUP BY a.id
ORDER BY count_books DESC


#Вывести только тех, у кого кол-во книг с положительным отзывом более 1
SELECT
    a.name as author,
    COUNT(b.id) as count_books
FROM
    authors a
    JOIN books b on a.id = b.author_id
WHERE
    b.rating>=4
GROUP BY a.id
HAVING count_books>1
ORDER BY count_books DESC