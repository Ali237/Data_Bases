/*Q5: For books which have received at least two reviews, find book_id, --
the title and the average review rating. Limit the result to only top 3 books with the highest average review ratings,
and sort the results in a descending order of average review ratings. In case of ties, 
returning any of the tied items would be fine. Hint: check out the limit function in Sqlite.*/
SELECT books.book_id, title,AVG(reviews.rating) as raverage
    from books
    Join reviews using(book_id)
    GROUP by book_id
      Having COUNT(reviews.book_id) >= 2
    ORDER BY raverage Desc    -- Descending is important 
    LIMIT 3;

