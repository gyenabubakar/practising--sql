SELECT bookings.starttime
FROM cd.bookings AS bookings
JOIN cd.members AS members ON members.memid = bookings.memid
WHERE (firstname || ' ' || surname) = 'David Farrell';
