"""
Código para analisar os dados sobre o clima em Chicago em novembro de 2017 no site:
https://practicum-content.s3.us-west-1.amazonaws.com/data-analyst-eng/moved_chicago_weather_2017.html
"""

import pandas as pd
import requests
from bs4 import BeautifulSoup
from sqlalchemy import create_engine

URL = 'https://practicum-content.s3.us-west-1.amazonaws.com/data-analyst-eng/moved_chicago_weather_2017.html'

req = requests.get(URL)
soup = BeautifulSoup(req.text, 'lxml')

table = soup.find('table', attrs={"id": "weather_records"})

heading_table = []
for row in table.find_all('th'):
    heading_table.append(row.text)

content = []
for row in table.find_all('tr'):
    if not row.find_all('th'):
        content.append([element.text for element in row.find_all('td')])

weather_records = pd.DataFrame(content, columns=heading_table)

print(weather_records)

# Criar uma conexão com o banco de dados SQLite
engine = create_engine('sqlite:///weather_records.db')

# Carregar os dados do DataFrame para o banco de dados SQL
weather_records.to_sql('weather_records', con=engine,
                       if_exists='replace', index=False)
