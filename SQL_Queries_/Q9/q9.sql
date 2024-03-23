-- Q9: Create a view called book_info with columns book_id, title, revcnt, rating, rating23, 
--and reqcnt. The view includes for each book, the book_id, the title, the number of reviews, 
--the average rating, the average rating based on the reviews written in 2023, 
--and the number of times that book is either borrowed or waitlisted (we call it request count). 
--Include books with no reviews or borrowing/waitlist in the output with zero counts (if applicable). 
--Hint: You may find sqlite strftime function helpful.
DROP VIEW book_info;


CREATE VIEW book_info AS
WITH allReviews AS (
SELECT b.book_id, b.title, COUNT(rid) as revrcnt, IFNULL(AVG(rating),0.0) AS rating
FROM books b
LEFT JOIN reviews r ON b.book_id = r.book_id
GROUP BY b.book_id),

-- second cte for review in 2023
rev23 AS (
SELECT b.book_id, IFNULL(AVG(rating),0.0) AS rating23
FROM books b
INNER JOIN reviews r ON b.book_id = r.book_id AND strftime('%Y',r.rdate) = '2023'
GROUP BY b.book_id),

-- cte for the number of how many times book has been w or br
reqCount AS (
Select br.book_id, count(DISTINCT bid) + count(DISTINCT wid) as reqcnt
FROM borrowings br
LEFT JOIN waitlists w ON br.book_id = w.book_id
GROUP BY br.book_id)

SELECT a.book_id,a.title, a.revrcnt, a.rating, IFNULL(r.rating23,0.0) as rating23, IFNULL(rc.reqcnt,0) as reqcnt 
FROM allReviews a
LEFT JOIN rev23 r ON r.book_id = a.book_id
LEFT JOIN reqCount rc ON rc.book_id = a.book_id;

SELECT * FROM book_info;