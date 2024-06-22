## Descrição dos dados  


### tabela 'neighborhoods': dados sobre os bairros da cidade
* name: nome do bairro;  
* neighborhood_id: código do bairro;  

### tabela 'cabs': dados sobre os táxis
* cab_id: código do veículo;  
* vehicle_id: a identificação técnica do veículo;  
* company_name: a empresa proprietária do veículo;  
* tabela trips: dados sobre corridas;  

### tabela 'trip_id': código da corrida
* cab_id: código do veículo que opera a corrida;  
* start_ts: data e hora do início da corrida (tempo arredondado para a hora);  
* end_ts: data e hora do final da corrida (tempo arredondado para a hora);  
* duration_seconds: duração da corrida em segundos;  
* distance_miles: distância percorrida em milhas;  
* pickup_location_id: código do bairro de retirada;  
* dropoff_location_id: código do bairro de entrega;  
  

### tabela 'weather_records': dados sobre o clima
* record_id: código de registro meteorológico
* ts: grava data e hora (tempo arredondado para a hora)
* temperature: temperatura quando o registro foi feito
* description: breve descrição das condições meteorológicas, ex. "chuva leve" ou "nuvens esparsas"


### Esquema de tabela
<img src="imagens\Image.png" width="600">  


**Nota:** não há uma conexão direta entre as tabelas trips e weather_records no banco de dados. Mas é possível juntá-las usando a hora em que a corrida começou (trips.start_ts) e a hora em que o registro do tempo foi feito (weather_records.ts).