SELECT facilities.name,
       SUM(CASE
               WHEN bookings.memid = 0 THEN facilities.guestcost
               ELSE facilities.membercost
               END * bookings.slots) AS revenue
FROM cd.bookings AS bookings
INNER JOIN cd.facilities AS facilities on facilities.facid = bookings.facid
GROUP BY facilities.name
ORDER BY revenue;