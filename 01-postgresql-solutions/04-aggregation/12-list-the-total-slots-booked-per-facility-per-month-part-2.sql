WITH facility_bookings_monthly_1 (facid, month, slots) AS (
    SELECT facid,
           EXTRACT(MONTH FROM starttime) AS month,
           SUM(slots)                    AS slots
    FROM cd.bookings
    WHERE starttime BETWEEN '2012-01-01' AND '2012-12-31'
    GROUP BY facid, month
),
facility_slot_totals (facid, month, slots) AS (
    SELECT * FROM facility_bookings_monthly_1
    UNION
    SELECT facid, NULL, SUM(slots)
    FROM facility_bookings_monthly_1
    GROUP BY facid
),
facilities_grand_total (facid, month, slots) AS (
    SELECT * FROM facility_slot_totals
    UNION
    SELECT NULL, NULL, SUM(slots)
    FROM facility_slot_totals
    WHERE facility_slot_totals.month IS NULL
)
SELECT * FROM facilities_grand_total
ORDER BY facid, month;