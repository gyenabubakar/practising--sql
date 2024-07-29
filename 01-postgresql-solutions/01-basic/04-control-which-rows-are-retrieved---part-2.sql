SELECT
    facid,
    name,
    membercost,
    monthlymaintenance
FROM cd.facilities
WHERE membercost > 0 AND
    membercost < ((1.0 / 50.0) * monthlymaintenance);