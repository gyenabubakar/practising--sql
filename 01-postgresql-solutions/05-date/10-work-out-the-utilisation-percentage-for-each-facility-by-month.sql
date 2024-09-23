SELECT name,
       month,
       ROUND((100 * slots) /
             CAST(
                     25 * (CAST((month + INTERVAL '1 month') AS DATE)
                         - CAST(month AS DATE)) AS NUMERIC), 1) AS utilisation
FROM (SELECT facs.name AS name, DATE_TRUNC('month', starttime) AS month, SUM(slots) AS slots
      FROM cd.bookings bks
               INNER JOIN cd.facilities facs
                          ON bks.facid = facs.facid
      GROUP BY facs.facid, month) AS inn
ORDER BY name, month;