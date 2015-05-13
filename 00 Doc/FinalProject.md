---
title: "Final Project: Australian Climate and Rainfall"
author: "Jeffrey and Jackie"
date: "Wednesday, May 13th, 2015"
output: html_document
---

Our Final Project was created to demonstrate materials and tools learned over the spring semester. This html document has been broken down into different sections to better understand the overall analysis of our final project.

All project materials can be downloaded or pulled from our [GitHub](https://github.com/JiannanZhang/DV_FinalProject) repository. 

##__1. Datasource__

The Bureau of Meteorology (BOM) is Australia's national weather, climate, and water agency. They provide weather information to all states within Australia. All rain data sets were provided through BOM's [Climate Data Online](http://www.bom.gov.au/jsp/ncc/cdio/weatherData/av?p_nccObsCode=136&p_display_type=dailyDataFile&p_startYear=2013&p_c=-872859776&p_stn_num=066062). This source gave us access to select weather stations and download all available rainfall information. In regards to temperature, which was also taken from the BOM website, was directly provided from the [Australian Climate Observations Reference Network – Surface Air Temperature](http://www.bom.gov.au/climate/change/acorn-sat/#tabs=Data-&-network). The temperature dataset provides information on the maximum and minimum temperature for every day of a recorded year for a particular city. 


Because there were too many cities to focus on, we decided to pick the top ten most recognized cities in Australia with locations varying across the country:
 
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


##__2. Cleaning and Transforming Datasets__

Appropriate datasets were downloaded from the BOM website for temperature and rainfall. We noticed that in order to proceed with our analysis, reformatting the data was a must. With the rainfall data, the removal of illegal characters and changing of the column names for appropriate submission into Orcle was needed. Reformat.R (which was provided in CS 329e) was used to clean this dataset. In addition, the removal of NA was needed. Below represents the SQL query used to replace the NA values with 0.

a. Removing NA from datasets (SQL query)

UPDATE Table Name
SET Column Name = 0
WHERE Column Name = 'NA';

b. Reformat.R was used to clean data from any illegal characters in SQL and change the column names to the correct format. Below provides a before and after visual of the reformatted dataset for Sydney.

Before 

![](./Sydneyrainbefore.png)

After

![](./Sydneyrainafter.png)



We saw that the temperature datasets needed a little more cleaning and joining of data. Jeffrey wrote a python script (called 'txt_to_csv.py' in 01 Data folder) to combine the csv files of minimum and maximum temperature, clean missing values and reformat the date. The following images are examples for city Sydney. In Tableau, we wanted to ensure that the data type date was accessible when using our dataset for analysis, therefore the python script assisted in transforming the strings into data type date. By setting the data type to date for both the rainfall and temperature, it made it easier to blend in Tableau. 

Before 

![](./Sydney_temp_before.png)

After 

![](./Sydney_temp_after.png)

__Connecting to our datasource__

After cleaning and reformatting the data, tables were created in Orcle and datasets were imported. All datasets for this project can be accessed through Orcle Database:

             Orcle Information
----------  -------------------------------------------
Server       129.152.144.84
Port         1521
Service      ORCL.usuniversi01134.oraclecloud.internal
Username     C##cs329e_jz7674
Password     orcl_jz7674











##__3. Data Visualization__

I. Boxplot for a sample city (Adelaide)'s  max temp in recent three years


```r
source("../03 Visualizations/box_plot_for_Adelaide.R", echo = TRUE)
```

```
## 
## > df_Adelaide_temp_12to14 <- data.frame(fromJSON(getURL(URLencode("129.152.144.84:5001/rest/native/?query=\" select * from (select temp_min, temp_max, .... [TRUNCATED] 
## 
## > boxplot(TEMP_MAX ~ YEAR, data = df_Adelaide_temp_12to14, 
## +     main = "Adelaide Max Temp Boxplot", xlab = "Year", ylab = "Max Temp", 
## +     col = " ..." ... [TRUNCATED]
```

![plot of chunk unnamed-chunk-3](figure/unnamed-chunk-3-1.png) 

From the boxplot above, we can see that the median of max temp in 2012 and 2013 is pretty stable. However, in 2014, the median max temp obviously increased a fair amount. Moreover, there are many outliers (about ten) in 2014 whereas in 2012 and 2013, there are none and one outlier respectively.These outliers should draw our attention in the future study.

II. BoxPlot for those ten cities' max temp in 2014


```r
source("../03 Visualizations/ten_cities_temp_boxplot.R", echo = TRUE)
```

```
## 
## > df_tenCities_maxtemp_join <- data.frame(fromJSON(getURL(URLencode("129.152.144.84:5001/rest/native/?query=\" select A.temp_max as Adelaide, B.temp_m .... [TRUNCATED] 
## 
## > df_tenCities_maxtemp <- gather(df_tenCities_maxtemp_join, 
## +     City, MaxTemp)
## 
## > df_tenCities_maxtemp %>% ggplot(aes(factor(City), 
## +     MaxTemp)) + geom_boxplot(fill = "green") + theme(axis.text.x = element_text(angle = 90, 
## +  .... [TRUNCATED]
```

![plot of chunk unnamed-chunk-4](figure/unnamed-chunk-4-1.png) 

From the boxplot above, we can see many interesting things. For example, in most cities(except Darwin, Brisbane, Canberra and Perth), all ouliers in each city are gathered on one side. Notice that there are no outliers in Brisbane, Canberra and Perth, which means their temperatures are more "concentrated" than those in other cities. Also notice that Darwin is a hot city over the year (median is about 33) and the max temp range is very small. 

III. Line graph (trend lines) of avg. max temp for those ten cities in recent 30 years.

![](./temp_trend_line_graph.png)

From the graph above, we can see that over the recent 30 years, Darwin has the highest avg. max temp and Hobart has the lowest avg. max temp. Notice that some trend lines tell us some noticeable facts. For example in Hobart in 1988 and 1993, there are two high peaks. After 1993, the avg. max temperatures are pretty stable. Although in the graph the difference is not big respect to the unit, it is still significant because they are all averages. These noticeable peaks can be studied for the future research.


IV. Geograhphical size plot of avg. max temp and avg. min temp for those ten cities in 2014.

![](./temp_geograhpical_size_plot.png)

From the graph above, we can see some interesting facts. For example, although Canberra has much higher latitude than Hobart (remember that Australia is in the southern hemisphere), it was actually much colder than Hobart on avg. in 2014. Such noticeable observation can be studied for the future research.

V. Line graph showcasing average rainfall over years for each of the ten cities

Data wrangling in R was used to produce this visual. For each city, we determined the average rainfall per year by grouping by year and then using the mean function. Because there were ten datasets, inner_join from the dplyr package in R was used to combine datasets based on common "YEARS". 

```r
source("../02 Data Wrangling/City_AVGrain_peryear.R", echo = FALSE)
```

```r
source("../02 Data Wrangling/Join_rain_year.R", echo = TRUE)
```

```
## 
## > require(dplyr)
## 
## > require(ggplot2)
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
## > head(full)
## Source: local data frame [6 x 21]
## 
##   YEAR Adelaide_Total Adelaide_AVG Brisbane_Total Brisbane_AVG
## 1 1999          533.2         1.46          161.0         0.44
## 2 2000          548.4         1.50          659.8         1.80
## 3 2001          598.1         1.64         1061.2         2.91
## 4 2002          348.6         0.96          708.6         1.94
## 5 2003          523.2         1.43          826.4         2.26
## 6 2004          496.2         1.36         1056.6         2.89
## Variables not shown: Cairns_Total (dbl), Cairns_AVG (dbl), Canberra_Total
##   (dbl), Canberra_AVG (dbl), Darwin_Total (dbl), Darwin_AVG (dbl),
##   Hobart_Total (dbl), Hobart_AVG (dbl), Melbourne_Total (dbl),
##   Melbourne_AVG (dbl), Perth_Total (dbl), Perth_AVG (dbl), Sydney_Total
##   (dbl), Sydney_AVG (dbl), Townsville_Total (dbl), Townsville_AVG (dbl)
## 
## > full %>% melt(id.vars = "YEAR", measure.vars = c("Adelaide_AVG", 
## +     "Brisbane_AVG", "Cairns_AVG", "Canberra_AVG", "Darwin_AVG", 
## +     "Hobart_A ..." ... [TRUNCATED]
```

![plot of chunk unnamed-chunk-6](figure/unnamed-chunk-6-1.png) 

You can see from the analysis, that there are cities with consistent average rainfall over a period of time, whereas cities such as Cairns, Darwin, and Townsville have fluctuating average rainfall. Two interesting things to point out is that for Cairns and Townsville, there is a significantly large drop in average rainfall. Cairns average rainfall drop occurs in 2004 and Townsville sees a drop in 2001. It would be interesting to research more about what climatic change or event may have caused a decrease in rainfall.


VI. Histogram visualizing the overall sum of the average rainfall for all ten cities

```r
source("../02 Data Wrangling/Join_rain_month.R", echo = TRUE)
```

```
## 
## > require(dplyr)
## 
## > require(ggplot2)
## 
## > join2 <- inner_join(adelaider2, brisbaner2, by = "MONTH") %>% 
## +     inner_join(cairnsr2, by = "MONTH") %>% inner_join(canberrar2, 
## +     by = "MONT ..." ... [TRUNCATED] 
## 
## > names(join2) <- c("MONTH", "Adelaide_AVG", "Brisbane_AVG", 
## +     "Cairns_AVG", "Canberra_AVG")
## 
## > join6 <- inner_join(darwinr2, hobartr2, by = "MONTH") %>% 
## +     inner_join(melbourner2, by = "MONTH") %>% inner_join(perthr2, 
## +     by = "MONTH")
## 
## > names(join6) <- c("MONTH", "Darwin_AVG", "Hobart_AVG", 
## +     "Melbourne_AVG", "Perth_AVG")
## 
## > join8 <- inner_join(sydneyr2, townsviller2, by = "MONTH")
## 
## > names(join8) <- c("MONTH", "Sydney_AVG", "Townsville_AVG")
## 
## > full3 <- full_join(join2, join6, by = "MONTH") %>% 
## +     full_join(join8, by = "MONTH")
## 
## > join3 <- full3 %>% melt(id.vars = "MONTH", measure.vars = c("Adelaide_AVG", 
## +     "Brisbane_AVG", "Cairns_AVG", "Canberra_AVG", "Darwin_AVG", 
## +    .... [TRUNCATED] 
## 
## > join3$MONTH <- c("January", "February", "March", "April", 
## +     "May", "June", "July", "August", "September", "October", 
## +     "November", "Decemb ..." ... [TRUNCATED] 
## 
## > barplot(join3$sum, names.arg = join3$MONTH, legend.text = NULL, 
## +     beside = FALSE, main = "Sum of Average Rainfall per\nMonth for all Ten Cities ..." ... [TRUNCATED]
```

![plot of chunk unnamed-chunk-7](figure/unnamed-chunk-7-1.png) 

We can see here that January, February, March and December are the months that consist of the most rainfall. In Australia, these dates fall in the summer season. 

VII. Blended Dataset: Rainfall and Temperature Percent Difference Partitioned by Year and Month
![](./BlendedADVcalc.png)
