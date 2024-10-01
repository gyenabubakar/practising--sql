WITH RECURSIVE recommendations(memid) AS (
    SELECT memid FROM cd.members WHERE recommendedby = 1
    UNION ALL
    SELECT m.memid FROM recommendations AS r
    INNER JOIN cd.members AS m ON m.recommendedby = r.memid
)

SELECT recs.memid, firstname, surname
FROM recommendations AS recs
INNER JOIN cd.members ON members.memid = recs.memid
ORDER BY memid;