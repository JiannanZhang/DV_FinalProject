create table cities_temp_avgs_2014 (
  temp_date date,
  temp_min float ,
  temp_max float
);
commit;

delete from townsville_temp where temp_min > 100;commit;
create table Sydney_temp
select temp_max, temp_min, extract(YEAR from to_date(temp_date,'yyyymmdd')) year from sydney_temp;
select count(*)
from canberra_temp;