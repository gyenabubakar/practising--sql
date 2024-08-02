WITH first_prices_10_percent (member, guest) AS (
    SELECT
        (membercost * 0.1) as member,
        (guestcost * 0.1) as guest
    FROM cd.facilities
    WHERE facid = 0
)
UPDATE cd.facilities
SET membercost = membercost + (SELECT member FROM first_prices_10_percent),
    guestcost = guestcost + (SELECT guest FROM first_prices_10_percent)
WHERE facid = 1;