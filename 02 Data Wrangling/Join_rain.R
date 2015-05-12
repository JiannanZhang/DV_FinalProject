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
join1 <- inner_join(adelaider, brisbaner, by = "YEAR")  %>% inner_join(cairnsr, by = "YEAR") %>% inner_join(canberrar, by = "YEAR")
names(join1) <- c("YEAR", "Adelaide_Total", "Adelaide_AVG", "Brisbane_Total", "Brisbane_AVG", "Cairns_Total", "Cairns_AVG", "Canberra_Total", "Canberra_AVG")
join4 <- inner_join(darwinr,hobartr, by = "YEAR") %>% inner_join(melbourner, by = "YEAR") %>% inner_join(perthr, by = "YEAR")
names(join4) <- c("YEAR","Darwin_Total", "Darwin_AVG", "Hobart_Total", "Hobart_AVG", "Melbourne_Total", "Melbourne_AVG", "Perth_Total", "Perth_AVG")
join5<-  inner_join(sydneyr, townsviller, by = "YEAR")
names(join5) <- c("YEAR", "Sydney_Total", "Sydney_AVG", "Townsville_Total", "Townsville_AVG" )

full <- inner_join(join1,join4, by ="YEAR") %>% inner_join(join5, by="YEAR")

full %>%  melt(id.vars = "YEAR", measure.vars = c("Adelaide_AVG", "Brisbane_AVG", "Cairns_AVG", "Canberra_AVG", "Darwin_AVG", "Hobart_AVG",  "Melbourne_AVG",  "Perth_AVG",  "Sydney_AVG", "Townsville_AVG")) %>% ggplot(aes(x = YEAR, y = value)) + geom_line(aes(color = variable)) + facet_wrap(~variable)


inn<- inner_join(cairnsr, canberrar, by ="YEAR")

join2 <- full_join(adelaider2, brisbaner2, by = "MONTH")  %>% full_join(cairnsr2, by = "MONTH") %>% full_join(canberrar2, by = "MONTH") %>% full_join(darwinr2, by = "MONTH") %>% full_join(hobartr2, by = "MONTH") %>% full_join(melbourner2, by = "MONTH") %>% full_join(perthr2, by = "MONTH") %>% full_join(sydneyr2, by = "MONTH") %>% full_join(townsviller2, by = "MONTH")

names(join2) <- c("MONTH", "Adelaide_AVG", "Brisbane_AVG", "Cairns_AVG", "Canberra_AVG", "Darwin_AVG",  "Hobart_AVG", "Melbourne_AVG",  "Perth_AVG", "Sydney_AVG",  "Townsville_AVG")

join3 <- join2 %>%  melt(id.vars = "MONTH", measure.vars = c("Adelaide_AVG", "Brisbane_AVG", "Cairns_AVG", "Canberra_AVG", "Darwin_AVG", "Hobart_AVG",  "Melbourne_AVG",  "Perth_AVG",  "Sydney_AVG", "Townsville_AVG")) %>% group_by(MONTH) %>% summarise(sum=sum(value)) 
join3$MONTH <- c('January', 'February', 'March','April', 'May', 'June', 'July','August', 'September', 'October', 'November', 'December')

barplot(join3$sum,names.arg=join3$MONTH,legend.text = NULL, beside = FALSE,
        main = 'Sum of Average Raingall per\nMonth for all Ten Cities', sub = NULL, las=2, xlab = '', ylab = 'Sum of Average rainfall (mm)', col = 'blue') 

ggplot(join3, aes(x=MONTH, y=sum))+geom_line(y=mean(join3$sum))

#qplot(join3$value,geom="histogram", binwidth = .5)
