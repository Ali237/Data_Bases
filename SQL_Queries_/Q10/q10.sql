SELECT DISTINCT br.member
FROM borrowings br
INNER JOIN book_info bi ON bi.book_id = br.book_id AND bi.rating > 3.5
WHERE bi.reqcnt > (SELECT AVG(reqcnt) FROM book_info);