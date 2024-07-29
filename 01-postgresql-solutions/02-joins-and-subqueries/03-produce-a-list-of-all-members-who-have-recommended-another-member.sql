WITH recommenders (memid) AS (
    SELECT DISTINCT recommendedby AS memid
    FROM cd.members
    WHERE recommendedby IS NOT NULL
)
SELECT firstname, surname FROM recommenders
JOIN cd.members AS members ON recommenders.memid = members.memid
ORDER BY surname, firstname;