SELECT facid, total AS slots FROM (
    SELECT
        facilities.facid,
        SUM(bookings.slots) AS total,
        RANK() OVER (ORDER BY SUM(bookings.slots) DESC) AS rank
    FROM cd.facilities AS facilities
             INNER JOIN cd.bookings AS bookings ON bookings.facid = facilities.facid
    GROUP BY facilities.facid
) AS ranked_facilities
WHERE rank = 1;