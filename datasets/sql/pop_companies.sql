""" De 1 a 7 de novembro de 2017, as empresas de táxi mais populares foram Flash Cab e Taxi Affiliation Services. 
Vamos encontrar o número de corridas para essas duas empresas e nomear a variável resultante como trips_amount. 
Juntaremos as corridas de todas as outras empresas no grupo "Other". 
Vamos agrupar os dados pelos nomes das empresas. 
Nomear o campo com os nomes das empresas de táxi company. 
Ordenar o resultado em ordem decrescente por trips_amount."""


SELECT
    CASE WHEN cabs.company_name NOT IN ('Flash Cab', 'Taxi Affiliation Services') THEN 'Other'
    ELSE cabs.company_name END AS company,
    COUNT(trips.start_ts) AS trips_amount
FROM
    trips
    INNER JOIN cabs ON cabs.cab_id = trips.cab_id
WHERE
    trips.start_ts BETWEEN '2017-11-01 00:00:00' AND '2017-11-07 23:59:59'
GROUP BY
    company
ORDER BY
    trips_amount DESC