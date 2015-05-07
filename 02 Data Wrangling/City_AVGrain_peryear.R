require(dplyr)
require(tidyr)
require(ggplot)
 
tbl_df(sydney_rain)

sydney_rain %>% group_by(YEAR) %>% summarise(total = sum(RAINFALL_AMOUNT_MM)) %>% tbl_df
sydney_rain %>% group_by(YEAR, MONTH) %>% summarise(total = sum(RAINFALL_AMOUNT_MM)) %>% tbl_df
sydney_rain %>% group_by(YEAR, MONTH) %>% filter(YEAR >= 1990) %>% summarise(total = sum(RAINFALL_AMOUNT_MM)) %>% tbl_df
sydney_rain %>% group_by(YEAR) %>% summarise(total = sum(RAINFALL_AMOUNT_MM), average = mean(RAINFALL_AMOUNT_MM)) %>% ggplot(x="YEAR", y = "RAINFALL_AMOUNT_MM") + geom_point()

tbl_df(Darwin_rain)
Darwin_rain %>% group_by(YEAR) %>% summarise(total = sum(RAINFALL_AMOUNT_MM)) %>% tbl_df
Darwin_rain %>% group_by(YEAR, MONTH) %>% summarise(total = sum(RAINFALL_AMOUNT_MM)) %>% tbl_df
Darwin_rain %>% group_by(YEAR, MONTH) %>% filter(YEAR >= 1990) %>% summarise(total = sum(RAINFALL_AMOUNT_MM)) %>% tbl_df
Darwin_rain%>% group_by(YEAR) %>% summarise(total = sum(RAINFALL_AMOUNT_MM), average = mean(RAINFALL_AMOUNT_MM)) %>% tbl_df

tbl_df(adelaide_rain)
adelaide_rain %>% group_by(YEAR) %>% summarise(total = sum(RAINFALL_AMOUNT_MM)) %>% tbl_df
adelaide_rain %>% group_by(YEAR, MONTH) %>% summarise(total = sum(RAINFALL_AMOUNT_MM)) %>% tbl_df
adelaide_rain %>% group_by(YEAR, MONTH) %>% filter(YEAR >= 1990) %>% summarise(total = sum(RAINFALL_AMOUNT_MM)) %>% tbl_df
adelaide_rain%>% group_by(YEAR) %>% summarise(total = sum(RAINFALL_AMOUNT_MM), average = mean(RAINFALL_AMOUNT_MM)) %>% tbl_df

tbl_df(brisbane_rain)
brisbane_rain %>% group_by(YEAR) %>% summarise(total = sum(RAINFALL_AMOUNT_MM)) %>% tbl_df
brisbane_rain %>% group_by(YEAR, MONTH) %>% summarise(total = sum(RAINFALL_AMOUNT_MM)) %>% tbl_df
brisbane_rain %>% group_by(YEAR, MONTH) %>% filter(YEAR >= 1990) %>% summarise(total = sum(RAINFALL_AMOUNT_MM)) %>% tbl_df
brisbane_rain%>% group_by(YEAR) %>% summarise(total = sum(RAINFALL_AMOUNT_MM), average = mean(RAINFALL_AMOUNT_MM)) %>% tbl_df

tbl_df(cairns_rain)
cairns_rain %>% group_by(YEAR) %>% summarise(total = sum(RAINFALL_AMOUNT_MM)) %>% tbl_df
cairns_rain %>% group_by(YEAR, MONTH) %>% summarise(total = sum(RAINFALL_AMOUNT_MM)) %>% tbl_df
cairns_rain %>% group_by(YEAR, MONTH) %>% filter(YEAR >= 1990) %>% summarise(total = sum(RAINFALL_AMOUNT_MM)) %>% tbl_df
cairns_rain%>% group_by(YEAR) %>% summarise(total = sum(RAINFALL_AMOUNT_MM), average = mean(RAINFALL_AMOUNT_MM)) %>% tbl_df

tbl_df(canberra_rain)
canberra_rain %>% group_by(YEAR) %>% summarise(total = sum(RAINFALL_AMOUNT_MM)) %>% tbl_df
canberra_rain %>% group_by(YEAR, MONTH) %>% summarise(total = sum(RAINFALL_AMOUNT_MM)) %>% tbl_df
canberra_rain %>% group_by(YEAR, MONTH) %>% filter(YEAR >= 1990) %>% summarise(total = sum(RAINFALL_AMOUNT_MM)) %>% tbl_df
canberra_rain%>% group_by(YEAR) %>% summarise(total = sum(RAINFALL_AMOUNT_MM), average = mean(RAINFALL_AMOUNT_MM)) %>% tbl_df

tbl_df(hobart_rain)
hobart_rain %>% group_by(YEAR) %>% summarise(total = sum(RAINFALL_AMOUNT_MM)) %>% tbl_df
hobart_rain %>% group_by(YEAR, MONTH) %>% summarise(total = sum(RAINFALL_AMOUNT_MM)) %>% tbl_df
hobart_rain %>% group_by(YEAR, MONTH) %>% filter(YEAR >= 1990) %>% summarise(total = sum(RAINFALL_AMOUNT_MM)) %>% tbl_df
hobart_rain%>% group_by(YEAR) %>% summarise(total = sum(RAINFALL_AMOUNT_MM), average = mean(RAINFALL_AMOUNT_MM)) %>% tbl_df

tbl_df(melbourne_rain)
melbourne_rain %>% group_by(YEAR) %>% summarise(total = sum(RAINFALL_AMOUNT_MM)) %>% tbl_df
melbourne_rain %>% group_by(YEAR, MONTH) %>% summarise(total = sum(RAINFALL_AMOUNT_MM)) %>% tbl_df
melbourne_rain %>% group_by(YEAR, MONTH) %>% filter(YEAR >= 1990) %>% summarise(total = sum(RAINFALL_AMOUNT_MM)) %>% tbl_df
melbourne_rain%>% group_by(YEAR) %>% summarise(total = sum(RAINFALL_AMOUNT_MM), average = mean(RAINFALL_AMOUNT_MM)) %>% tbl_df

tbl_df(perth_rain)
perth_rain %>% group_by(YEAR) %>% summarise(total = sum(RAINFALL_AMOUNT_MM)) %>% tbl_df
perth_rain %>% group_by(YEAR, MONTH) %>% summarise(total = sum(RAINFALL_AMOUNT_MM)) %>% tbl_df
perth_rain %>% group_by(YEAR, MONTH) %>% filter(YEAR >= 1990) %>% summarise(total = sum(RAINFALL_AMOUNT_MM)) %>% tbl_df
perth_rain%>% group_by(YEAR) %>% summarise(total = sum(RAINFALL_AMOUNT_MM), average = mean(RAINFALL_AMOUNT_MM)) %>% tbl_df

tbl_df(townsville_rain)
townsville_rain %>% group_by(YEAR) %>% summarise(total = sum(RAINFALL_AMOUNT_MM)) %>% tbl_df
townsville_rain %>% group_by(YEAR, MONTH) %>% summarise(total = sum(RAINFALL_AMOUNT_MM)) %>% tbl_df
townsville_rain %>% group_by(YEAR, MONTH) %>% filter(YEAR >= 1990) %>% summarise(total = sum(RAINFALL_AMOUNT_MM)) %>% tbl_df
townsville_rain%>% group_by(YEAR) %>% summarise(total = sum(RAINFALL_AMOUNT_MM), average = mean(RAINFALL_AMOUNT_MM)) %>% tbl_df

