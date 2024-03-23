-- Q4: List all books that are published after 2001, 
-- and for each such book list book_id, title, author, 
--how many times the book was borrowed, and the most recent date (i.e., start date) when the book was borrowed. 
--Your listing must include books that have not been borrowed. Hint: You may find outer join useful here and some of the subsequent queries.
SELECT  b.book_id, title , author, COUNT(borrowings.book_id) as bcount,MAX(borrowings.start_date) AS rdate
From books b 
LEFT JOIN borrowings on borrowings.book_id = b.book_id
Where  b.pyear > 2001
group by b.book_id;  -- issue here when I add more thigs 

-- select count(book_id)
-- from borrowings
-- GROUP by book_id;