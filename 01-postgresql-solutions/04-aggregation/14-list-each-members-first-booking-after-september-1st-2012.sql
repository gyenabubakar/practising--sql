SELECT members.surname,
       members.firstname,
       members.memid,
       (SELECT MIN(bookings2.starttime)
        FROM cd.bookings AS bookings2
        WHERE bookings2.starttime > '2012-09-01'
          AND bookings2.memid = members.memid) AS starttime
FROM cd.members
INNER JOIN cd.bookings on members.memid = bookings.memid
GROUP BY surname, firstname, members.memid
ORDER BY members.memid;