""" Encontrar o número de corridas para empresas de táxi cujo nome contém as palavras "Yellow" ou "Blue" de 1 a 7 de novembro de 2017.  
Agrupar os resultados pelo campo company_name."""

SELECT
    COUNT(trips.start_ts) AS trips_amount,
    cabs.company_name
FROM
    trips
    INNER JOIN cabs ON cabs.cab_id = trips.cab_id
WHERE
    cabs.company_name LIKE '%Yellow%'
    AND trips.start_ts BETWEEN '2017-11-01 00:00:00'
    AND '2017-11-07 23:59:59'
    OR cabs.company_name LIKE '%Blue%'
    AND trips.start_ts BETWEEN '2017-11-01 00:00:00'
    AND '2017-11-07 23:59:59'
GROUP BY
    cabs.company_name
ORDER BY
    company_name;