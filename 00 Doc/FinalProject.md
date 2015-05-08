---
title: "Final Project: Australia Climate and Rainfall"
author: "Jeffrey and Jackie"
date: "Monday, May 04, 2015"
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
## Warning in file(filename, "r", encoding = encoding): cannot open file
## '../01 Data/AdelaideRain.R': No such file or directory
```

```
## Error in file(filename, "r", encoding = encoding): cannot open the connection
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
source("../01 Data/DawrinRain.R", echo = TRUE)
```

```
## Warning in file(filename, "r", encoding = encoding): cannot open file
## '../01 Data/DawrinRain.R': No such file or directory
```

```
## Error in file(filename, "r", encoding = encoding): cannot open the connection
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

2. Cleaning and Transforming Data
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



