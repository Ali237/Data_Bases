-- Q8: For each member who has had some penalties, list the user email, 
-- the total number of times the user has been penalized, the number of paid penalties, 
-- and the total dollar amount of the paid penalties. 
-- A penalty is paid if the paid amount is more than or equal to the penalty amount. 
-- The result should include users who have no paid penalties with zero counts. 
-- Hint: you may find subqueries used in the from clause or common table expressions  
-- useful here and some of the subsequent queries. 
WITH PenaltyData AS (
    SELECT 
        b.member AS email,
        COUNT(*) AS total_penalties,
        COUNT(CASE WHEN p.paid_amount >= p.amount THEN 1 END) AS paid_penalties,
        COALESCE(SUM(CASE WHEN p.paid_amount >= p.amount THEN p.paid_amount END), 0) AS total_paid_amount
    FROM 
        penalties p
    INNER JOIN 
        borrowings b ON p.bid = b.bid
    GROUP BY 
        b.member
)
SELECT 
    m.email,
    COALESCE(pd.total_penalties, 0) AS total_penalties,
    COALESCE(pd.paid_penalties, 0) AS paid_penalties,
    COALESCE(pd.total_paid_amount, 0) AS total_paid_amount
FROM 
    members m
LEFT JOIN 
    PenaltyData pd ON m.email = pd.email
WHERE 
    COALESCE(pd.total_penalties, 0) > 0;
