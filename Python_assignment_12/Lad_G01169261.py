# -*- coding: utf-8 -*-
"""
Spyder Editor

This is a temporary script file.
"""

from bs4 import BeautifulSoup
import urllib2
import csv
import pandas as pd

webpage ="https://repo.vse.gmu.edu/ait/AIT580/580books.html"
page = urllib2.urlopen(webpage)
soup =BeautifulSoup(page,"html.parser")

table_samp=soup.find('tbody')
rows =table_samp.find_all('tr')
list=[]
for row in rows:
    cols=row.find_all('td')
    cols=[x.text.strip() for x in cols]
    list.append(cols)
df= pd.DataFrame (list)
df.columns = ['Title', 'Author', 'Publisher','Release_Date']
print df

#writing

df.to_csv('csv_output_python')

#reading

data_exp=pd.read_csv('csv_output_python', delimiter=',')
print(data_exp)

dataframe=pd.DataFrame(data_exp)
print(dataframe)
dataframe.drop(dataframe.index[0],inplace=True)

#Print the frequency count for publishers 
dataframe.groupby('Publisher').agg({'Title':'count'})


#Visualize the output of (a) using a chart of your own choice.
dataframe['Publisher'].value_counts().plot(kind='bar')

#Print the frequency count for year of publication. 

ser=pd.Series(dataframe['Release_Date'])
xs1=ser.str.split(" ",n=2,expand=True)
print(xs1)

dataframe['year']=xs1[1]
print dataframe.columns
print dataframe

dataframe.groupby(dataframe['year']).agg({'Release_Date':'count'})

#Visualize the output of (b) using a chart of your own choice.
dataframe['year'].value_counts().plot(kind='bar')