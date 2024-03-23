--Q6: List book_id, title, and the number of times the book was borrowed,
-- for all books that are published on or before 2015, have been borrowed at least once, 
--and have been borrowed at least twice of how many times they have been waitlisted.

SELECT b.book_id, b.title,count(borrowings.book_id) as wcount
from books b
join borrowings using(book_id)
left join waitlists using(book_id)
Where b.pyear <= 2015
GROUP by b.book_id
Having count(waitlists.book_id)*2 <= wcount; -- add comment 