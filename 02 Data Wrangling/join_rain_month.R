require(dplyr)
require(ggplot2)

## Second Plot
join2 <- inner_join(adelaider2, brisbaner2, by = "MONTH") %>% inner_join(cairnsr2, by = "MONTH")%>% inner_join(canberrar2, by = "MONTH")
names(join2) <- c("MONTH", "Adelaide_AVG", "Brisbane_AVG", "Cairns_AVG", "Canberra_AVG")
join6 <- inner_join(darwinr2, hobartr2, by = "MONTH") %>% inner_join(melbourner2, by = "MONTH") %>% inner_join(perthr2, by = "MONTH")
names(join6) <- c("MONTH","Darwin_AVG",  "Hobart_AVG", "Melbourne_AVG",  "Perth_AVG")
join8 <- inner_join(sydneyr2, townsviller2, by = "MONTH")
names(join8) <- c("MONTH","Sydney_AVG",  "Townsville_AVG")

full3 <- full_join(join2, join6, by = "MONTH") %>% full_join(join8, by="MONTH")

join3 <- full3%>%  melt(id.vars = "MONTH", measure.vars = c("Adelaide_AVG", "Brisbane_AVG", "Cairns_AVG", "Canberra_AVG", "Darwin_AVG", "Hobart_AVG",  "Melbourne_AVG",  "Perth_AVG",  "Sydney_AVG", "Townsville_AVG")) %>% group_by(MONTH) %>% summarise(sum=sum(value)) 
join3$MONTH <- c('January', 'February', 'March','April', 'May', 'June', 'July','August', 'September', 'October', 'November', 'December')

barplot(join3$sum,names.arg=join3$MONTH,legend.text = NULL, beside = FALSE,
        main = 'Sum of Average Rainfall per\nMonth for all Ten Cities', sub = NULL, las=2, xlab = '', ylab = 'Sum of Average rainfall (mm)', col = 'blue') 
