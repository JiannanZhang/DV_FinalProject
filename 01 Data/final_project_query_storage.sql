create table Sydney_temp (
  temp_date date,
  temp_min number (38,1),
  temp_max number (38,1)
);
commit;

create table Sydney_temp
select temp_max, temp_min, extract(YEAR from to_date(temp_date,'yyyymmdd')) year from sydney_temp;