---
title: "Final Project: Australia Climate and Rainfall"
author: "Jeffrey and Jackie"
date: "Wednesday, May 13th, 2015"
output: html_document
---

Our Final Project was created to demonstrate materials and tools learned over the spring semester. This html document has been broken down into different parts to better understand the overall analysis.

All project materials can be downloaded or pulled from our [GitHub](https://github.com/JiannanZhang/DV_FinalProject) repository. 

1. Data Source and Data

The Bureau of Meteorology (BOM) is Australia's national weather, climate, and water agency. They provide infofrmation to all states with in Australia.



Data

```r
source("../01 Data/AdelaideRain.R", echo = TRUE)
```

```
## 
## > adelaide_rain <- data.frame(fromJSON(getURL(URLencode("129.152.144.84:5001/rest/native/?query=\"select * from Adelaiderain\""), 
## +     httpheader =  .... [TRUNCATED]
```

```r
source("../01 Data/BrisbaneRain.R", echo = TRUE)
```

```
## 
## > brisbane_rain <- data.frame(fromJSON(getURL(URLencode("129.152.144.84:5001/rest/native/?query=\"select * from Brisbanerain\""), 
## +     httpheader =  .... [TRUNCATED]
```

```r
source("../01 Data/CairnsRain.R", echo = TRUE)
```

```
## 
## > cairns_rain <- data.frame(fromJSON(getURL(URLencode("129.152.144.84:5001/rest/native/?query=\"select * from cairnsrain\""), 
## +     httpheader = c(DB .... [TRUNCATED]
```

```r
source("../01 Data/CanberraRain.R", echo = TRUE)
```

```
## 
## > canberra_rain <- data.frame(fromJSON(getURL(URLencode("129.152.144.84:5001/rest/native/?query=\"select * from canberrarain\""), 
## +     httpheader =  .... [TRUNCATED]
```

```r
source("../01 Data/DarwinRain.R", echo = TRUE)
```

```
## 
## > Darwin_rain <- data.frame(fromJSON(getURL(URLencode("129.152.144.84:5001/rest/native/?query=\"select * from darwinrain\""), 
## +     httpheader = c(DB .... [TRUNCATED]
```

```r
source("../01 Data/HobartRain.R", echo = TRUE)
```

```
## 
## > hobart_rain <- data.frame(fromJSON(getURL(URLencode("129.152.144.84:5001/rest/native/?query=\"select * from hobartrain\""), 
## +     httpheader = c(DB .... [TRUNCATED]
```

```r
source("../01 Data/MelbourneRain.R", echo = TRUE)
```

```
## 
## > melbourne_rain <- data.frame(fromJSON(getURL(URLencode("129.152.144.84:5001/rest/native/?query=\"select * from Melbournerain\""), 
## +     httpheader  .... [TRUNCATED]
```

```r
source("../01 Data/PerthRain.R", echo = TRUE)
```

```
## 
## > perth_rain <- data.frame(fromJSON(getURL(URLencode("129.152.144.84:5001/rest/native/?query=\"select * from perthrain\""), 
## +     httpheader = c(DB = .... [TRUNCATED]
```

```r
source("../01 Data/SydneyRain.R", echo = TRUE)
```

```
## 
## > sydney_rain <- data.frame(fromJSON(getURL(URLencode("129.152.144.84:5001/rest/native/?query=\"select * from Sydneyrain\""), 
## +     httpheader = c(DB .... [TRUNCATED]
```

```r
source("../01 Data/TownsvilleRain.R", echo = TRUE)
```

```
## 
## > townsville_rain <- data.frame(fromJSON(getURL(URLencode("129.152.144.84:5001/rest/native/?query=\"select * from townsvillerain\""), 
## +     httpheade .... [TRUNCATED]
```

```r
source("../01 Data/df_Adelaide_temp.R", echo = TRUE)
```

```
## 
## > df_Adelaide_temp <- data.frame(fromJSON(getURL(URLencode("129.152.144.84:5001/rest/native/?query=\"select * from Adelaide_temp \""), 
## +     httphead .... [TRUNCATED]
```

```r
df_Adelaide_temp <- data.frame(fromJSON(getURL(URLencode('129.152.144.84:5001/rest/native/?query="select * from Adelaide_temp "'),httpheader=c(DB='jdbc:oracle:thin:@129.152.144.84:1521:ORCL', USER='C##cs329e_jz7674', PASS='orcl_jz7674', MODE='native_mode', MODEL='model', returnDimensions = 'False', returnFor = 'JSON'), verbose = TRUE)))
```

2. Cleaning and Transforming Data

For Rainfall dataset:
a. Removing NA from datasets
SQL in ORCLE: 

UPDATE Table Name
SET Column Name = '0'
WHERE Column Name = 'NA';

b. Reformat.R was used to clean data from any illegal characters in SQL and change the column names to the correct format
Before 

![](./Sydneyrainbefore.png)

After

![](./Sydneyrainafter.png)

For temprature dataset:
I wrote the python script (called txt_to_csv.py in 01 Data folder) to combine the text files, clean the missing values and finally reformat the data to be well-structured CSV files. The following images are examples for city Sydney

Before 
![](./Sydney_temp_before.png)

After 
![](./Sydney_temp_after.png)






*. Data Visualization 

I. Boxplot for a sample city (Adelaide)'s  max temp in recent three years


```r
df_Adelaide_temp_12to14 <- data.frame(fromJSON(getURL(URLencode('129.152.144.84:5001/rest/native/?query=" select * from (select temp_min, temp_max, extract(YEAR from temp_date) as year from Adelaide_temp where extract(YEAR from temp_date) = 2014 or extract(YEAR from temp_date) = 2013 or extract(YEAR from temp_date) = 2012) order by year"'),httpheader=c(DB='jdbc:oracle:thin:@129.152.144.84:1521:ORCL', USER='C##cs329e_jz7674', PASS='orcl_jz7674', MODE='native_mode', MODEL='model', returnDimensions = 'False', returnFor = 'JSON'), verbose = TRUE)))

boxplot(TEMP_MAX~YEAR, data=df_Adelaide_temp_12to14, main='Adelaide Max Temp Boxplot', xlab='Year',ylab='Max Temp',col = 'green')
```

![plot of chunk unnamed-chunk-3](figure/unnamed-chunk-3-1.png) 
From the boxplot above, we can see that the median of max temp in 2012 and 2013 is pretty stable. However, in 2014, the median max temp obviously increased a fair amount. Moreover, there are many outliers (about ten) in 2014 whereas in 2012 and 2013, there are none and one outlier respectively.These outliers should draw our attention in the future study.

II. BoxPlot for those ten cities' max temp in 2014


```r
df_tenCities_maxtemp_join <- data.frame(fromJSON(getURL(URLencode('129.152.144.84:5001/rest/native/?query=" select A.temp_max as Adelaide, B.temp_max as Brisbane,C1.temp_max as Cairns ,C2.temp_max as Canberra,D.temp_max as Darwin ,H.temp_max as Hobart,M.temp_max as Melbourne,P.temp_max as Perth,S.temp_max as Sydney,T.temp_max as Townsville from Adelaide_temp A inner join Brisbane_temp B on A.temp_date = B.temp_date inner join Cairns_temp C1 on B.temp_date = C1.temp_date inner join Canberra_temp C2 on C1.temp_date = C2.temp_date inner join Darwin_temp D on C2.temp_date = D.temp_date inner join Hobart_temp H on D.temp_date = H.temp_date inner join Melbourne_temp M on H.temp_date = M.temp_date inner join Perth_temp P on M.temp_date = P.temp_date inner join Sydney_temp S on P.temp_date = S.temp_date inner join Townsville_temp T on S.temp_date = T.temp_date where extract(YEAR from A.temp_date) = 2014 "'),httpheader=c(DB='jdbc:oracle:thin:@129.152.144.84:1521:ORCL', USER='C##cs329e_jz7674', PASS='orcl_jz7674', MODE='native_mode', MODEL='model', returnDimensions = 'False', returnFor = 'JSON'), verbose = TRUE)))
```

Gather the data and do the boxplot

```r
df_tenCities_maxtemp <- gather(df_tenCities_maxtemp_join,City,MaxTemp)
df_tenCities_maxtemp %>% ggplot(aes(factor(City),MaxTemp)) + geom_boxplot(fill='green') + theme(axis.text.x=element_text(angle=90, size=10, vjust=0.5,face='bold')) + theme(axis.title.x=element_text(color="forestgreen", vjust=0.35),axis.title.y=element_text(color="forestgreen", size=12,vjust=0.35)) + labs(title="Max_Temperature Boxplot of ten biggest cities in Australia in 2014",y="Max_Temperature",x="City",size=12)
```

![plot of chunk unnamed-chunk-5](figure/unnamed-chunk-5-1.png) 
From the boxplot above, we can see many interesting things. For example, in most cities(except Darwin, Brisbane, Canberra and Perth), all ouliers in each city are gathered on one side. Notice that there are no outliers in Brisbane, Canberra and Perth, which means their temperatures are more "concentrated" than those in other cities. Also notice that Darwin is a hot city over the year (median is about 33) and the max temp range is very small. 




