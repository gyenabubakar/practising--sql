SELECT DISTINCT (firstname || ' ' || surname) AS member,
       (SELECT (firstname || ' ' || surname)
        FROM cd.members
        WHERE memid = members1.recommendedby LIMIT 1) AS recommender
FROM cd.members AS members1
ORDER BY member;