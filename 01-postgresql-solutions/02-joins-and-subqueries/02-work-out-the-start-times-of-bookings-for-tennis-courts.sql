SELECT bookings.starttime AS start, facilities.name
FROM cd.bookings AS bookings
         JOIN cd.facilities AS facilities ON facilities.facid = bookings.facid
WHERE facilities.name ILIKE '%tennis court%'
  AND DATE_TRUNC('day', bookings.starttime)::DATE = '2012-09-21'
ORDER BY bookings.starttime;
