SELECT DATE_TRUNC('month', starttime) AS month,
       COUNT(*)
FROM cd.bookings
GROUP BY month
ORDER BY month;