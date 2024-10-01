SELECT memid, telephone
FROM cd.members
WHERE telephone LIKE '%(___)%'
ORDER BY memid;

SELECT memid, telephone
FROM cd.members
WHERE telephone ~ '\([0-9]{3}\)'
ORDER BY memid;