""" Vamos recuperar da tabela trips todas as corridas que:
- começaram no Loop (pickup_location_id: 50) em um sábado e terminaram em O'Hare (dropoff_location_id: 63). 

Vamos obter as condições meteorológicas para cada corrida e também recuperar a duração de cada corrida. 
OBS.: Ignorar corridas para as quais os dados sobre as condições meteorológicas não estão disponíveis.

As colunas da tabela devem estar na seguinte ordem:
start_ts, weather_conditions, duration_seconds

Ordenar por trip_id."""

SELECT
    trips.start_ts,
    CASE WHEN weather_records.description LIKE '%rain%' OR weather_records.description LIKE '%storm%' THEN 'Bad'
    ELSE 'Good' END AS weather_conditions,
    trips.duration_seconds
FROM
    trips
    INNER JOIN weather_records ON weather_records.ts = trips.start_ts
WHERE
    weather_records.description IS NOT NULL
    AND EXTRACT (isodow FROM start_ts) = 6
    AND trips.pickup_location_id = 50
    AND trips.dropoff_location_id = 63    
ORDER BY
    trip_id
