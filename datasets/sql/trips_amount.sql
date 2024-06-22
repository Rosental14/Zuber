""" Imprimir o campo company_name. 
    Encontrar o número de corridas de táxi para cada empresa de táxi de 15 a 16 de novembro de 2017, 
    salvar o resultado como trips_amount e imprimí-lo também. 
    Resultados em ordem decrescente pelo campo trips_amount ."""

SELECT
    cabs.company_name,
    COUNT(trips.start_ts) AS trips_amount
FROM 
    trips
    LEFT JOIN cabs ON cabs.cab_id = trips.cab_id
WHERE 
    start_ts BETWEEN '2017-11-15 00:00:00' 
    AND '2017-11-16 23:59:59'
GROUP BY 
    cabs.company_name
ORDER BY 
    trips_amount DESC;