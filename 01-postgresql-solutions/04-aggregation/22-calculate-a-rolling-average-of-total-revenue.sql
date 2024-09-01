-- SOLUTION 1: SLOW
WITH RECURSIVE august_days (day) AS (
    SELECT '2012-08-01'::DATE
    UNION ALL
    SELECT day + 1 FROM august_days
    WHERE day + 1 <= '2012-08-31'::DATE
),

prev_15_days(august_day, prev_15) AS (
    SELECT day, ARRAY(
            WITH RECURSIVE prev_15(prev_day, n) AS (
                SELECT august_days.day, 1 AS n
                UNION ALL
                SELECT prev_day - 1, n + 1
                FROM prev_15
                WHERE n < 15
            )
            SELECT prev_day FROM prev_15
        ) AS prev_15
    FROM august_days
),

prev_15_days_revenue AS (
    SELECT august_day,
           bookings.slots * CASE
                                WHEN bookings.memid = 0
                                    THEN facilities.guestcost
                                ELSE facilities.membercost
                            END AS amount_made_on_day
    FROM prev_15_days
    JOIN cd.bookings ON bookings.starttime::DATE = ANY(prev_15_days.prev_15)
    JOIN cd.facilities ON facilities.facid = bookings.facid
)

SELECT
    august_day                      AS date,
    SUM(amount_made_on_day / 15)    AS revenue
FROM prev_15_days_revenue
GROUP BY august_day
ORDER BY date;


-- SOLUTION 2: FAST
WITH august_days (date) AS (
    SELECT date::DATE
    FROM generate_series('2012-08-01'::DATE, '2012-08-31'::DATE, '1 day') AS date
)
SELECT
    date,
    SUM(bookings.slots * CASE
                            WHEN bookings.memid = 0
                                THEN facilities.guestcost
                            ELSE facilities.membercost
                        END) / 15 AS revenue
FROM august_days
INNER JOIN cd.bookings ON august_days.date >= bookings.starttime::DATE AND
                          bookings.starttime::DATE >= august_days.date - '14 days'::INTERVAL
INNER JOIN cd.facilities on facilities.facid = bookings.facid
GROUP BY date
ORDER BY date;






