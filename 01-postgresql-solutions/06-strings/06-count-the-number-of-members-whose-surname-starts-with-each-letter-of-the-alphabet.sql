WITH alphabets(letter) AS (
    SELECT * FROM UNNEST(ARRAY[
        'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I',
        'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R',
        'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'])
)
SELECT letter, COUNT(*) FROM alphabets
INNER JOIN cd.members ON members.surname LIKE letter || '%'
GROUP BY letter
ORDER BY letter;

SELECT
    SUBSTR(surname, 1, 1) AS letter,
    COUNT(*)
FROM cd.members
GROUP BY letter
ORDER BY letter;