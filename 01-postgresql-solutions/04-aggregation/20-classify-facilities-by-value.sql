WITH fac_revenue (facid, name, total_revenue) AS (
    SELECT facilities.facid,
           facilities.name,
           SUM(slots * CASE
                           WHEN bookings.memid = 0
                               THEN facilities.guestcost
                           ELSE facilities.membercost
               END
           ) AS total_revenue
    FROM cd.facilities
    INNER JOIN cd.bookings ON bookings.facid = facilities.facid
    GROUP BY facilities.facid, facilities.name
),

classifications(name, class) AS (
    SELECT name,
           NTILE(3) OVER (ORDER BY total_revenue DESC) AS class
    FROM fac_revenue
)

SELECT name,
       CASE
           WHEN class = 1 THEN 'high'
           WHEN class = 2 THEN 'average'
           ELSE 'low'
           END AS revenue
FROM classifications
ORDER BY class, name;