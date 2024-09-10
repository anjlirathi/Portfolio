# Practicing Python
# Practicing Pandas

#downloading data file
from urllib.request import urlretrieve
italy_covid_url = 'https://gist.githubusercontent.com/aakashns/f6a004fa20c84fec53262f9a8bfee775/raw/f309558b1cf5103424cef58e2ecb8704dcd4d74c/italy-covid-daywise.csv'

urlretrieve(italy_covid_url, 'italy-covid-daywise.csv')

import pandas as pd

# Reading a CSV file
covid_df = pd.read_csv('italy-covid-daywise.csv')
covid_df
type (covid_df)
covid_df.info()
covid_df.describe()
covid_df.shape
covid_df.columns

#basic ops #Exploring data
covid_df.head(5)
covid_df.tail(5)
covid_df.sample(7)
covid_df.loc[100:108]

#Retrieving data
covid_df['new_cases'] # calling particular col by using indexing
type(covid_df['new_cases']) 
covid_df['new_cases'][240] # using indexing to call row value for paticular col 
covid_df['new_tests'][208] 
covid_df.at[208,'new_deaths'] # at method
covid_df.new_cases # property of panadas(.)
covid_df.new_deaths
covid_df[['date', 'new_cases','new_deaths']] #list of cols 
covid_df_copy = covid_df.copy
covid_df.loc[215]
covid_df.head(5)
covid_df.tail(5)
covid_df.at[180, 'new_tests']
covid_df.new_tests.first_valid_index()
covid_df.loc[108:115]
covid_df.sample(10)

#Analyzing data from dataframes
# Q: What are the total number of reported cases and deaths related to Covid-19 in Italy?
total_cases_deaths = covid_df[['new_cases','new_deaths']].sum()
#other method
total_cases = covid_df.new_cases.sum() 
total_deaths = covid_df.new_deaths.sum()
print('The number of reported cases is {} and deaths is {}.'.format(int(total_cases),int(total_deaths)))

# Q: What is the overall death rate (ratio of reported deaths to reported cases)?
death_rate = total_deaths/total_cases
print('The death rate is {:.2f}%.'.format(int(death_rate*100)))

# Q: What is the overall number of tests conducted? A total of 935310 tests were conducted before daily test numbers were reported.
initial_tests = 935310
total_tests = covid_df.new_tests.sum() + initial_tests
print('The overall number of tests conducted are {}.'.format(int(total_tests)))

# Q: What fraction of tests returned a positive result?
positive_rate = total_cases/total_tests
print(' {:.2f}% of tests returened as positive.'.format(positive_rate*100))

#Querying And Sorting Data


# Working with dates
covid_df.date  
covid_df['date'] = pd.to_datetime(covid_df.date)


covid_df['year'] = pd.DatetimeIndex(covid_df.date).year
covid_df['month']= pd.DatetimeIndex(covid_df.date).month
covid_df['day'] = pd.DatetimeIndex(covid_df.date).day
covid_df['weekday'] = pd.DatetimeIndex(covid_df.date).weekday

covid_df.head(5)

covid_df_may = covid_df[covid_df.month ==5]
covid_df_may.head(5)

covid_df_may_totals = covid_df_may[['new_cases','new_tests','new_deaths']].sum()
covid_df_may_totals

#Grouping and Aggregation

covid_df.groupby('month')[['new_cases','new_tests','new_deaths']].mean()

covid_df.new_cases.cumsum().loc[101:108]

# merging data from multiple sources

urlretrieve('https://gist.githubusercontent.com/aakashns/8684589ef4f266116cdce023377fc9c8/raw/99ce3826b2a9d1e6d0bde7e9e559fc8b6e9ac88b/locations.csv', 
            'locations.csv')
locations_df = pd.read_csv('locations.csv')
locations_df.loc[95:100]

locations_df[locations_df.location == 'Italy']

