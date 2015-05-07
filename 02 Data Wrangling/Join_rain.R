require(dplyr)

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
join1 <- inner_join(sydneyr, adelaider, by = "YEAR") 
join2 <- inner_join(perthr, darwinr, by = "YEAR")
join4 <- inner_join(townsviller, hobartr, by = "YEAR")
join6 <- inner_join(melbourner, brisbaner, by = "YEAR")
join8 <- inner_join(canberrar, cairnsr, by = "YEAR")
