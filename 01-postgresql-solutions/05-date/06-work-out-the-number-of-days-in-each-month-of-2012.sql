WITH months(time_stamp) AS (
    SELECT GENERATE_SERIES(TIMESTAMP '2012-01-01', TIMESTAMP '2012-12-31', '1 month')
)
SELECT EXTRACT(MONTH FROM time_stamp)                 AS month,
       (time_stamp + INTERVAL '1 month') - time_stamp AS length
FROM months;