WITH mem_hours(memid, hours) AS (
    SELECT members.memid,
           ((SUM(slots) + 10) / 20) * 10 AS hours
    FROM cd.members
    INNER JOIN cd.bookings ON members.memid = bookings.memid
    GROUP BY members.memid
)
SELECT firstname, surname, hours, RANK() OVER(ORDER BY hours DESC) AS rank
FROM mem_hours
INNER JOIN cd.members ON members.memid = mem_hours.memid
GROUP BY firstname, surname, hours
ORDER BY rank, surname, firstname;