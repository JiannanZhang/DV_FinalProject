require(dplyr)
require(ggplot2)

tbl_df(sydneyr)
tbl_df(adelaider)
tbl_df(darwinr)
tbl_df(perthr)
tbl_df(hobartr)
tbl_df(townsviller)
tbl_df(brisbaner)
tbl_df(melbourner)
tbl_df(cairnsr)
tbl_df(canberrar)

#table_name <- c(sydneyr, adelaider, darwinr, perthr,hobartr, townsviller, brisbaner, melbourner, cairnsr,canberrar)

#for (i in table_name) {
 # join <- inner_join(table_name[1], table_name[2], by="YEAR")
  #join_table 
#}
join1 <- inner_join(adelaider, brisbaner, by = "YEAR")  %>% inner_join(cairnsr, by = "YEAR") %>% inner_join(canberrar, by = "YEAR") %>% inner_join(darwinr, by = "YEAR") %>% inner_join(hobartr, by = "YEAR") %>% inner_join(melbourner, by = "YEAR") %>% inner_join(perthr, by = "YEAR") %>% inner_join(sydneyr, by = "YEAR") %>% inner_join(townsviller, by = "YEAR")
names(join1) <- c("YEAR", "Adelaide_Total", "Adelaide_AVG", "Brisbane_Total", "Brisbane_AVG", "Cairns_Total", "Cairns_AVG", "Canberra_Total", "Canberra_AVG", "Darwin_Total", "Darwin_AVG", "Hobart_Total", "Hobart_AVG", "Melbourne_Total", "Melbourne_AVG", "Perth_Total", "Perth_AVG", "Sydney_Total", "Sydney_AVG", "Townsville_Total", "Townsville_AVG" )
join1 %>%  melt(id.vars = "YEAR", measure.vars = c("Adelaide_AVG", "Brisbane_AVG", "Cairns_AVG", "Canberra_AVG", "Darwin_AVG", "Hobart_AVG",  "Melbourne_AVG",  "Perth_AVG",  "Sydney_AVG", "Townsville_AVG")) %>% ggplot(aes(x = YEAR, y = value)) + geom_line(aes(color = variable)) + facet_wrap(~variable)
