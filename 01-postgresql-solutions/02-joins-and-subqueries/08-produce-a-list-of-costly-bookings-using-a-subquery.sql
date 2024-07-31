WITH bookings_with_costs (member, facility, cost) AS (
    SELECT (firstname || ' ' || surname) AS member,
           facilities.name               AS facility,
           CASE
               WHEN bookings.memid = 0
                   THEN guestcost * slots
               ELSE membercost * slots
               END                       AS cost
    FROM cd.bookings AS bookings
    JOIN cd.members AS members ON members.memid = bookings.memid
    JOIN cd.facilities AS facilities ON facilities.facid = bookings.facid
    WHERE bookings.starttime >= '2012-09-14'
      AND bookings.starttime < '2012-09-15'
)
SELECT * FROM bookings_with_costs
WHERE cost > 30
ORDER BY cost DESC;