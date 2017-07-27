import forecastio
import datetime
import pandas
from sqlalchemy import create_engine

api_key = 'ccc5e40f8165067cb1cc31e37777747c'
lat = 10.762622
long = 106.660172


#print byDaily.summary

start_date = datetime.datetime(2017, 1, 1, 0, 0, 0)
end_date   = datetime.datetime(2017, 2, 28, 0, 0, 0)


forecast = forecastio.load_forecast(api_key, lat=lat, lng=long, time=datetime.datetime(2017, 1, 1, 7, 0, 0))

dates = [ start_date + datetime.timedelta(n) for n in range(int ((end_date - start_date).days))]
data = []
for date in dates:
    forecast = forecastio.load_forecast(api_key, lat=lat, lng=long, time=date)
    data.append((str(forecast.json), 1, date.strsftime("%d/%m/%y")))
    print 'receiving data on date ' + date.strftime("%d/%m/%y") + '...'

for row in data:
    print row

df = pandas.DataFrame(data, columns=['data','city_id','date'])
engine = create_engine('postgresql://postgres:postgres@localhost:5432/darksky')

df.to_sql("weather", engine)






