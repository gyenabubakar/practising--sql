-- NAIVE SOLUTION
SELECT (total_days - EXTRACT(DAY FROM TIMESTAMP '2012-02-11 01:00:00') || ' days')::INTERVAL AS remaining
FROM (
    SELECT COUNT(*) AS total_days FROM GENERATE_SERIES(
        DATE_TRUNC('MONTH', TIMESTAMP '2012-02-11 01:00:00'),
        DATE_TRUNC('MONTH', TIMESTAMP '2012-02-11 01:00:00') + INTERVAL '1 MONTH', INTERVAL '1 DAY') AS dates
) AS dates_outer;

--
-- BETTER SOLUTION
SELECT (DATE_TRUNC('month', example_timestamp) + INTERVAL '1 month') - DATE_TRUNC('day', example_timestamp) AS remaining
FROM (SELECT TIMESTAMP '2012-02-11 01:00:00' AS example_timestamp) AS example;