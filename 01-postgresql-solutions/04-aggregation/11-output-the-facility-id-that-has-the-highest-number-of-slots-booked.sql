WITH facility_slots AS (
    SELECT facid, SUM(slots) AS total_slots FROM cd.bookings
    GROUP BY facid
)
SELECT facid, total_slots AS "Total Slots"
FROM facility_slots
WHERE total_slots = (
    SELECT MAX(total_slots) FROM facility_slots
);