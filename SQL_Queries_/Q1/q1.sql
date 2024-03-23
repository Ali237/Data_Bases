--  Find name and email of all members who waitlisted a book they have barrowed.

select DISTINCT name,email
From members,waitlists, borrowings 
Where waitlists.member = members.email
AND waitlists.book_id = borrowings.book_id AND borrowings.member = members.email;