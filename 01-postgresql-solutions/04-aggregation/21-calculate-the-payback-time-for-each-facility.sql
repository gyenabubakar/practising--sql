WITH fac_revenues (facid, total_revenue) AS (
    SELECT facilities.facid,
            SUM(slots * CASE
                            WHEN bookings.memid = 0 THEN guestcost
                            ELSE membercost END) AS total_revenue
    FROM cd.facilities
    INNER JOIN cd.bookings ON bookings.facid = facilities.facid
    GROUP BY facilities.facid, facilities.name
),

fac_monthly_revenues (facid, avg_monthly_revenue) AS (
    SELECT facid, total_revenue / 3
    FROM fac_revenues
),

fac_monthly_profits (facid, avg_monthly_profit) AS (
    SELECT
        revenues.facid,
        avg_monthly_revenue - monthlymaintenance
    FROM fac_monthly_revenues AS revenues
    INNER JOIN cd.facilities ON facilities.facid = revenues.facid
)

SELECT facilities.name,
       initialoutlay / avg_monthly_profit AS months
FROM fac_monthly_profits AS profits
JOIN cd.facilities ON facilities.facid = profits.facid
ORDER BY facilities.name;