SELECT facid,
       EXTRACT(MONTH FROM starttime) AS month,
       SUM(slots)                    AS "Total Slots"
FROM cd.bookings
WHERE starttime BETWEEN '2012-01-01' AND '2012-12-31'
GROUP BY facid, month
ORDER BY facid, month;