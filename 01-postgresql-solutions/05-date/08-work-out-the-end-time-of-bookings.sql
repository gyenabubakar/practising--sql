SELECT starttime,
       starttime + (slots * '30 minutes'::INTERVAL) AS endtime
FROM cd.bookings
ORDER BY endtime DESC, starttime DESC
LIMIT 10;