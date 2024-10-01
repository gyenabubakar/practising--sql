SELECT lpad(zipcode::TEXT, 5, '0') AS zip
FROM cd.members
ORDER BY zip;

SELECT lpad(zipcode::CHAR(5), 5, '0') AS zip
FROM cd.members
ORDER BY zip;