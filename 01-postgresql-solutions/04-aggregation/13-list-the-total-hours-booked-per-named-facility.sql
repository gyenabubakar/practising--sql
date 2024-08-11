SELECT facilities.facid,
       facilities.name,
       TO_CHAR(SUM(bookings.slots * 0.50), 'FM9999999999990.00') AS "Total Hours"
FROM cd.facilities AS facilities
INNER JOIN cd.bookings AS bookings ON bookings.facid = facilities.facid
GROUP BY facilities.facid, facilities.name
ORDER BY facilities.facid;