WITH RECURSIVE recommendations AS (
    SELECT recommendedby
    FROM cd.members WHERE memid = 27

    UNION ALL

    SELECT m.recommendedby
    FROM cd.members AS m
    INNER JOIN recommendations AS r ON m.memid = r.recommendedby
)

SELECT recs.recommendedby AS recommender, firstname, surname
FROM recommendations AS recs
INNER JOIN cd.members ON members.memid = recs.recommendedby
ORDER BY recommender DESC;