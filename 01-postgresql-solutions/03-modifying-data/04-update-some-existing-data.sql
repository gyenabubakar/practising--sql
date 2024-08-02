UPDATE cd.facilities
SET initialoutlay = 10_000 -- the _ doesn't work in older versions of Postgres
WHERE facid = 1;