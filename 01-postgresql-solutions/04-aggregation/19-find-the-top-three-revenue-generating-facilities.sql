WITH fac_revenue (facid, name, revenue) AS (
    SELECT facilities.facid,
           facilities.name,
           SUM(slots * CASE
                   WHEN bookings.memid = 0
                       THEN facilities.guestcost
                   ELSE facilities.membercost
               END
           ) AS revenue
    FROM cd.facilities
    INNER JOIN cd.bookings ON bookings.facid = facilities.facid
    GROUP BY facilities.facid, facilities.name
)
SELECT * FROM (
    SELECT name,
           (RANK() OVER (ORDER BY revenue DESC)) AS rank
    FROM fac_revenue
) AS rev
WHERE rank < 4
ORDER BY rank, name;