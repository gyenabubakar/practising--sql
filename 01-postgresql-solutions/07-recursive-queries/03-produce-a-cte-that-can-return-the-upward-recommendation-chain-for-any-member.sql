WITH RECURSIVE recommendations(recommender, member) AS (
    SELECT recommendedby, memid FROM cd.members

    UNION ALL

    SELECT m.recommendedby, r.member
    FROM cd.members AS m
    INNER JOIN recommendations AS r ON r.recommender = m.memid
)

SELECT recs.member, recommender, firstname, surname
FROM recommendations AS recs
INNER JOIN cd.members ON members.memid = recs.recommender
WHERE recs.member = 22 OR recs.member = 12
ORDER BY recs.member, recs.recommender DESC;