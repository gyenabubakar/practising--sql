SELECT DISTINCT (members.firstname || ' ' || members.surname) AS member,
                facilities.name                               AS facility
FROM cd.bookings AS bookings
         JOIN cd.members AS members ON members.memid = bookings.memid
         JOIN cd.facilities AS facilities ON facilities.facid = bookings.facid
WHERE facilities.name ILIKE 'tennis court%'
ORDER BY (members.firstname || ' ' || members.surname), facilities.name;