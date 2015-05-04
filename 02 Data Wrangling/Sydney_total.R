require(dplyr)
require(tidyr)
 
tbl_df(sydney_rain)
sydney_rain %>% group_by(YEAR) %>% summarise(total = sum(RAINFALL_AMOUNT_MM)) %>% tbl_df
sydney_rain %>% group_by(YEAR, Month) %>% summarise(total = sum(RAINFALL_AMOUNT_MM)) %>% tbl_df
sydney_rain %>% group_by(YEAR, MONTH) %>% filter(YEAR >= 1990) %>% summarise(total = sum(RAINFALL_AMOUNT_MM)) %>% tbl_df
sydney_rain %>% group_by(YEAR) %>% summarise(total = sum(RAINFALL_AMOUNT_MM), average = mean(RAINFALL_AMOUNT_MM)) %>% tbl_df
