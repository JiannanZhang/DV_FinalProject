---
title: "Final Project: Australian Climate and Rainfall"
author: "Jeffrey and Jackie"
date: "Wednesday, May 13th, 2015"
output: html_document
---

Our Final Project was created to demonstrate materials and tools learned over the spring semester. This html document has been broken down into different sections to better understand the overall analysis of our final project.

All project materials can be downloaded or pulled from our [GitHub](https://github.com/JiannanZhang/DV_FinalProject) repository. 

1. Data Source and Data

The Bureau of Meteorology (BOM) is Australia's national weather, climate, and water agency. They provide weather information to all states within Australia. All rain data sets were provided through BOM's [Climate Data Online](http://www.bom.gov.au/jsp/ncc/cdio/weatherData/av?p_nccObsCode=136&p_display_type=dailyDataFile&p_startYear=2013&p_c=-872859776&p_stn_num=066062). This source gave us access to select weather stations and download all available rainfall information. In regards to temperature, which was also taken from the BOM website, was directly provided from the [Australian Climate Observations Reference Network – Surface Air Temperature](http://www.bom.gov.au/climate/change/acorn-sat/#tabs=Data-&-network). The temperature dataset provides information on the maximum and minimum temperature for every day of a recorded year for a particular city. 


Because there were too many to focus on, we decided to pick the top ten most recognized cities in Australia with locations varying across the country:
 
**City Name**      **Population**
----------------   --------------------
Adelaide (SA)      1,212,982
Brisbane (QLD)  	 2,074,222
Cairns (QLD)	     153,075
Canberra (NSW)	   417,860
Darwin (NT)	       128,073
Hobart (TAS)	     216,656
Melbourne (VIC)    4137,432
Perth (WA)	       1,738,807
Sydney (NSW)	     4,627,345
Townsville (QLD)   176,327



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
source("../03 Visualizations/box_plot_for_Adelaide.R", echo = FALSE)
```

![plot of chunk unnamed-chunk-3](figure/unnamed-chunk-3-1.png) 

From the boxplot above, we can see that the median of max temp in 2012 and 2013 is pretty stable. However, in 2014, the median max temp obviously increased a fair amount. Moreover, there are many outliers (about ten) in 2014 whereas in 2012 and 2013, there are none and one outlier respectively.These outliers should draw our attention in the future study.

II. BoxPlot for those ten cities' max temp in 2014


```r
source("../03 Visualizations/ten_cities_temp_boxplot.R", echo = FALSE)
```

From the boxplot above, we can see many interesting things. For example, in most cities(except Darwin, Brisbane, Canberra and Perth), all ouliers in each city are gathered on one side. Notice that there are no outliers in Brisbane, Canberra and Perth, which means their temperatures are more "concentrated" than those in other cities. Also notice that Darwin is a hot city over the year (median is about 33) and the max temp range is very small. 

III. Line graph (trend lines) of avg. max temp for those ten cities in recent 30 years.

![](./temp_trend_line_graph.png)

IV. Geograhphical size plot of avg. max temp and avg. min temp for those ten cities in 2014.

![](./temp_geographical_size_plot.png)

V.
Line graph for rainfall average for 10 cities

```r
source("../02 Data Wrangling/City_AVGrain_peryear.R", echo = FALSE)
```

```r
source("../02 Data Wrangling/Join_rain.R", echo = TRUE)
```

```
## 
## > require(dplyr)
## 
## > require(ggplot2)
## 
## > tbl_df(sydneyr)
## Source: local data frame [130 x 3]
## 
##    YEAR  total average
## 1  1885  939.1    2.57
## 2  1886  870.1    2.38
## 3  1887 1526.8    4.18
## 4  1888  552.3    1.51
## 5  1889 1413.6    3.87
## 6  1890 2168.0    5.94
## 7  1891 1607.0    4.40
## 8  1892 1764.8    4.82
## 9  1893 1416.2    3.88
## 10 1894 1189.5    3.26
## ..  ...    ...     ...
## 
## > tbl_df(adelaider)
## Source: local data frame [131 x 3]
## 
##    YEAR total average
## 1  1884 416.8    1.14
## 2  1885 392.7    1.08
## 3  1886 369.6    1.01
## 4  1887 591.8    1.62
## 5  1888 323.7    0.88
## 6  1889 745.3    2.04
## 7  1890 636.3    1.74
## 8  1891 386.4    1.06
## 9  1892 560.9    1.53
## 10 1893 583.2    1.60
## ..  ...   ...     ...
## 
## > tbl_df(darwinr)
## Source: local data frame [131 x 3]
## 
##    YEAR  total average
## 1  1884 1633.4    4.46
## 2  1885 2143.2    5.87
## 3  1886 1317.2    3.61
## 4  1887 1662.8    4.56
## 5  1888 1646.7    4.50
## 6  1889 1227.0    3.36
## 7  1890 1568.1    4.30
## 8  1891 1982.2    5.43
## 9  1892 1009.5    2.76
## 10 1893 1175.7    3.22
## ..  ...    ...     ...
## 
## > tbl_df(perthr)
## Source: local data frame [22 x 3]
## 
##    YEAR total average
## 1  1993 615.7    1.69
## 2  1994 739.8    2.03
## 3  1995 904.8    2.48
## 4  1996 888.6    2.43
## 5  1997 699.4    1.92
## 6  1998 742.6    2.03
## 7  1999 822.0    2.25
## 8  2000 796.2    2.18
## 9  2001 688.6    1.89
## 10 2002 737.8    2.02
## ..  ...   ...     ...
## 
## > tbl_df(hobartr)
## Source: local data frame [122 x 3]
## 
##    YEAR total average
## 1  1893 392.6    1.08
## 2  1894 623.4    1.71
## 3  1895 648.6    1.78
## 4  1896 551.1    1.51
## 5  1897 521.4    1.43
## 6  1898 511.7    1.40
## 7  1899 526.9    1.44
## 8  1900 487.0    1.33
## 9  1901 602.8    1.65
## 10 1902 556.3    1.52
## ..  ...   ...     ...
## 
## > tbl_df(townsviller)
## Source: local data frame [74 x 3]
## 
##    YEAR  total average
## 1  1941 1964.1    5.38
## 2  1942 1117.4    3.06
## 3  1943  913.1    2.50
## 4  1944 1128.5    3.08
## 5  1945 1034.4    2.83
## 6  1946 1344.7    3.68
## 7  1947 1402.8    3.84
## 8  1948  633.1    1.73
## 9  1949 1312.2    3.60
## 10 1950 2195.9    6.02
## ..  ...    ...     ...
## 
## > tbl_df(brisbaner)
## Source: local data frame [16 x 3]
## 
##    YEAR  total average
## 1  1999  161.0    0.44
## 2  2000  659.8    1.80
## 3  2001 1061.2    2.91
## 4  2002  708.6    1.94
## 5  2003  826.4    2.26
## 6  2004 1056.6    2.89
## 7  2005  718.0    1.97
## 8  2006  795.6    2.18
## 9  2007  652.4    1.79
## 10 2008 1240.8    3.39
## 11 2009 1072.4    2.94
## 12 2010 1658.6    4.54
## 13 2011 1175.6    3.22
## 14 2012 1177.2    3.22
## 15 2013 1111.6    3.05
## 16 2014  790.2    2.16
## 
## > tbl_df(melbourner)
## Source: local data frame [122 x 3]
## 
##    YEAR total average
## 1  1893 681.3    1.87
## 2  1894 597.8    1.64
## 3  1895 444.2    1.22
## 4  1896 660.9    1.81
## 5  1897 684.6    1.88
## 6  1898 412.0    1.13
## 7  1899 741.7    2.03
## 8  1900 749.6    2.05
## 9  1901 746.8    2.05
## 10 1902 621.1    1.70
## ..  ...   ...     ...
## 
## > tbl_df(cairnsr)
## Source: local data frame [37 x 3]
## 
##    YEAR  total average
## 1  1978 1260.5    3.45
## 2  1979 3169.3    8.68
## 3  1980 1579.6    4.32
## 4  1981 3156.8    8.65
## 5  1982 1582.5    4.34
## 6  1983 1883.2    5.16
## 7  1984 1886.2    5.15
## 8  1985 2594.0    7.11
## 9  1986 1656.5    4.54
## 10 1987 1773.4    4.86
## ..  ...    ...     ...
## 
## > tbl_df(canberrar)
## Source: local data frame [47 x 3]
## 
##    YEAR total average
## 1  1968 608.2    1.66
## 2  1969 755.0    2.07
## 3  1970 746.4    2.04
## 4  1971 645.4    1.77
## 5  1972 442.0    1.21
## 6  1973 795.2    2.18
## 7  1974 997.4    2.73
## 8  1975 742.5    2.03
## 9  1976 499.9    1.37
## 10 1977 595.2    1.63
## ..  ...   ...     ...
## 
## > join1 <- inner_join(adelaider, brisbaner, by = "YEAR") %>% 
## +     inner_join(cairnsr, by = "YEAR") %>% inner_join(canberrar, 
## +     by = "YEAR")
## 
## > names(join1) <- c("YEAR", "Adelaide_Total", "Adelaide_AVG", 
## +     "Brisbane_Total", "Brisbane_AVG", "Cairns_Total", "Cairns_AVG", 
## +     "Canberra_ ..." ... [TRUNCATED] 
## 
## > join4 <- inner_join(darwinr, hobartr, by = "YEAR") %>% 
## +     inner_join(melbourner, by = "YEAR") %>% inner_join(perthr, 
## +     by = "YEAR")
## 
## > names(join4) <- c("YEAR", "Darwin_Total", "Darwin_AVG", 
## +     "Hobart_Total", "Hobart_AVG", "Melbourne_Total", "Melbourne_AVG", 
## +     "Perth_Total ..." ... [TRUNCATED] 
## 
## > join5 <- inner_join(sydneyr, townsviller, by = "YEAR")
## 
## > names(join5) <- c("YEAR", "Sydney_Total", "Sydney_AVG", 
## +     "Townsville_Total", "Townsville_AVG")
## 
## > full <- inner_join(join1, join4, by = "YEAR") %>% 
## +     inner_join(join5, by = "YEAR")
## 
## > full %>% melt(id.vars = "YEAR", measure.vars = c("Adelaide_AVG", 
## +     "Brisbane_AVG", "Cairns_AVG", "Canberra_AVG", "Darwin_AVG", 
## +     "Hobart_A ..." ... [TRUNCATED]
```

```
## 
## > inn <- inner_join(cairnsr, canberrar, by = "YEAR")
## 
## > join2 <- full_join(adelaider2, brisbaner2, by = "MONTH") %>% 
## +     full_join(cairnsr2, by = "MONTH") %>% full_join(canberrar2, 
## +     by = "MONTH") .... [TRUNCATED]
```

```
## Error in eval(expr, envir, enclos): cannot join on columns 'MONTH' x 'MONTH': Can't join on 'MONTH' x 'MONTH' because of incompatible types (integer / factor)
```

![plot of chunk unnamed-chunk-6](figure/unnamed-chunk-6-1.png) 


