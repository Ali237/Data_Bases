-- Q7: Find the top three books that have been borrowed the most 
--(i.e., hQ7: Find the top three books that have been borrowed the most 
--(i.e., have the maximum number of being borrowed) . In case of ties, return all ties. 
--For each book, return the book_id, title, and publish year. 
--Hint: You may find sql rank() function helpfule the maximum number of being borrowed) . 
--In case of ties, return all ties. For each book, return the book_id, title, and publish year. 
--Hint: You may find sql rank() function helpful.

SELECT book_id, title, pyear
FROM (
    SELECT book_id, title, pyear, RANK() OVER (ORDER BY COUNT(borrowings.book_id) DESC) AS rnk
    FROM books
    JOIN borrowings USING(book_id)
    GROUP BY book_id, title, pyear
) AS ranked_books
WHERE rnk <= 3;
