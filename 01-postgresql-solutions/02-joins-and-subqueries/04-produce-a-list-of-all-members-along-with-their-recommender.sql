SELECT members.firstname      AS memfname,
       members.surname        AS memsname,
       recommenders.firstname AS recfname,
       recommenders.surname   AS recsname
FROM cd.members AS members
LEFT JOIN cd.members AS recommenders ON recommenders.memid = members.recommendedby
ORDER BY members.surname, members.firstname;