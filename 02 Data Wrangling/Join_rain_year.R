require(dplyr)
require(ggplot2)


## First Plot
join1 <- inner_join(adelaider, brisbaner, by = "YEAR")  %>% inner_join(cairnsr, by = "YEAR") %>% inner_join(canberrar, by = "YEAR")
names(join1) <- c("YEAR", "Adelaide_Total", "Adelaide_AVG", "Brisbane_Total", "Brisbane_AVG", "Cairns_Total", "Cairns_AVG", "Canberra_Total", "Canberra_AVG")
join4 <- inner_join(darwinr,hobartr, by = "YEAR") %>% inner_join(melbourner, by = "YEAR") %>% inner_join(perthr, by = "YEAR")
names(join4) <- c("YEAR","Darwin_Total", "Darwin_AVG", "Hobart_Total", "Hobart_AVG", "Melbourne_Total", "Melbourne_AVG", "Perth_Total", "Perth_AVG")
join5<-  inner_join(sydneyr, townsviller, by = "YEAR")
names(join5) <- c("YEAR", "Sydney_Total", "Sydney_AVG", "Townsville_Total", "Townsville_AVG" )

full <- inner_join(join1,join4, by ="YEAR") %>% inner_join(join5, by="YEAR")

head(full)
full %>%  melt(id.vars = "YEAR", measure.vars = c("Adelaide_AVG", "Brisbane_AVG", "Cairns_AVG", "Canberra_AVG", "Darwin_AVG", "Hobart_AVG",  "Melbourne_AVG",  "Perth_AVG",  "Sydney_AVG", "Townsville_AVG")) %>% ggplot(aes(x = YEAR, y = value)) + geom_line(aes(color = variable)) + facet_wrap(~variable) + labs(x = "Year", y ="Sum of AVG Rainfall (mm)")

