SELECT
    row_number() over (ORDER BY joindate) AS row_number,
    firstname,
    surname
FROM cd.members;