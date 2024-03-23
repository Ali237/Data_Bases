--Q2 Return bid, borrower's email, and end date of all borrowings 
--of books which are borrowed by at least a member from "CS" faculty and written by authors who 
--have "John" or "Marry" in their name. All text matches should be case-insensitive.
-- Select Distinct b.bid ,b.member, end_date
-- from borrowings b, members m, books
-- Where  m.faculty = "CS"
-- AND    m.email = b.member 
-- AND (books.author LIKE '%John%' OR books.author LIKE '%Marry%' )
-- AND b.book_id IN (SELECT book_id FROM books WHERE author IN ('John', 'Marry'))
-- ORDER by bid ;

SELECT DISTINCT b1.bid, b1.member, b1.end_date
FROM borrowings b1
JOIN members m1 ON m1.email = b1.member
JOIN books ON books.book_id = b1.book_id
LEFT JOIN borrowings b2 ON b2.book_id = b1.book_id AND b2.member != b1.member
LEFT JOIN members m2 ON m2.email = b2.member
WHERE 
  (m1.faculty = 'CS' OR m2.faculty = 'CS') -- Include CS students and others
  AND (books.author LIKE '%John%' OR books.author LIKE '%Marry%')
ORDER BY b1.bid;


