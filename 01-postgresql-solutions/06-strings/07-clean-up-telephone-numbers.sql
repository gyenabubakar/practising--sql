SELECT memid,
       REGEXP_REPLACE(telephone, '[()\s-]', '', 'g') AS telephone
FROM cd.members
ORDER BY memid;