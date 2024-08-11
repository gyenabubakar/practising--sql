-- SELECT (SELECT COUNT(*) FROM cd.members), firstname, surname
-- FROM cd.members
-- ORDER BY joindate;

SELECT COUNT(*) OVER (), firstname, surname
FROM cd.members
ORDER BY joindate;