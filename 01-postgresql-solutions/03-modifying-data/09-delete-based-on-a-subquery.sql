DELETE FROM cd.members
WHERE memid NOT IN (SELECT DISTINCT memid FROM cd.bookings);