-- Q3: List bid and borrower's email of all borrowings that have been taken longer than 14 days and the book is not waitlisted (by anyone) 
--with a priority of 5 or more. Hint: You may find Sqlite Date And Time Functions helpful bid, member
SELECT bid, b.member
FROM borrowings b
LEFT JOIN waitlists w on  b.book_id = w.book_id AND w.priority >=5
 WHERE end_date IS NOT NULL  
      AND julianday(end_date) - julianday(start_date) > 14;  --julianday return the number of days difference 
