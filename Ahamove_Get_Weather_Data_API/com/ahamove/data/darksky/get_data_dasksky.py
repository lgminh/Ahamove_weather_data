import forecastio
import datetime
import pandas
import json
from sqlalchemy import create_engine

api_key = 'ccc5e40f8165067cb1cc31e37777747c'
lat = 10.762622
long = 106.660172


#print byDaily.summary

def get_data_darksky_to_postgres():
    start_date = datetime.datetime(2017, 1, 1, 0, 0, 0)
    end_date   = datetime.datetime(2017, 3, 1, 0, 0, 0)
    dates = [ start_date + datetime.timedelta(n) for n in range(int ((end_date - start_date).days))]
    data = []

    for date in dates:
        forecast = forecastio.load_forecast(api_key, lat=lat, lng=long, time=date)
        data.append((json.dumps(forecast.json), 'SGN', forecast.json['daily']['data'][0]['time']))
        print 'receiving data on date ' + date.strftime("%d/%m/%y") + '...'

    df = pandas.DataFrame(data, columns=['data', 'city_id', 'date']).to_csv('weather_data.csv')
    df = df.drop(list(df)[0], 1)
    engine = create_engine("postgresql://guest:guest@dev.ahamove.com:5432/test")
    df.to_sql('weather', con=engine, if_exists='append', index=False)
    print 'Done'


if __name__ == '__main__':
    get_data_darksky_to_postgres()