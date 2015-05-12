create table cities_temp_avgs_2014 (
  month varchar2(50),
  year varchar2(50),
  day varchar2(50),
  rainfall_amount_mm float,
  rain_date date
);
commit;

delete from townsville_temp where temp_min > 100;commit;
create table Sydney_temp;
select * from
(select temp_min, temp_max, extract(YEAR from temp_date) as year from Adelaide_temp where extract(YEAR from temp_date) = '2014' 
or extract(YEAR from temp_date) = '2013' or extract(YEAR from temp_date) = '2012');
select count(*)
from canberra_temp;


alter table cities_temp_avgs_2014
rename column LONGTITUDE to longitude; commit;

alter table townsville_temp
add city varchar2(50);commit;
update TOWNSVILLE_TEMP
set city = 'Townsville';commit;

select A.temp_max as Adelaide, B.temp_max as Brisbane,C1.temp_max as Cairns ,C2.temp_max as Canberra,
D.temp_max as Darwin ,H.temp_max as Hobart,M.temp_max as Melbourne,P.temp_max as Perth,S.temp_max as Sydney,T.temp_max as Townsville
from Adelaide_temp A
inner join Brisbane_temp B on A.temp_date = B.temp_date
inner join Cairns_temp C1 on B.temp_date = C1.temp_date
inner join Canberra_temp C2 on C1.temp_date = C2.temp_date
inner join Darwin_temp D on C2.temp_date = D.temp_date
inner join Hobart_temp H on D.temp_date = H.temp_date
inner join Melbourne_temp M on H.temp_date = M.temp_date
inner join Perth_temp P on M.temp_date = P.temp_date
inner join Sydney_temp S on P.temp_date = S.temp_date
inner join Townsville_temp T on S.temp_date = T.temp_date
where extract(YEAR from A.temp_date) = '2014';


