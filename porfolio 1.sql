cleaning the data for portfolio

steps involved
1.remove duplicate
2.stadardize the data
3.null values or blank values
4.remove any columns

imp.note 
(we r creating a staging table similar to our original table coz we want to keep our raw data also n deleting cloums permanantely is noit not good for darta)

create table country_wise_latest_staging
like country_wise_latest;


 select*
 from country_wise_latest_staging;
 
 insert country_wise_latest_staging
 select*
 from country_wise_latestcountry_wise_latest
 


  SELECT *,
    ROW_NUMBER() OVER (
      PARTITION BY `Country/Region`, Confirmed, Deaths, Recovered) AS row_num
  FROM country_wise_latest_staging;
  
  
  with duplicate_cte as
  (
   SELECT *,
    ROW_NUMBER() OVER (
      PARTITION BY `Country/Region`, Confirmed, Deaths, Recovered,'WHO Region') AS row_num
  FROM country_wise_latest_staging
)
select*
from duplicate_cte 
where row_num > 1;

 select*
 from country_wise_latest_staging
 where Country/Region='Albania';

 with duplicate_cte as
  (
   SELECT *,
    ROW_NUMBER() OVER (
      PARTITION BY `Country/Region`, Confirmed, Deaths, Recovered,'WHO Region') AS row_num
  FROM country_wise_latest_staging
)
delete
from duplicate_cte 
where row_num > 1;



CREATE TABLE `country_wise_latest_staging_3` (
  `Country/Region` TEXT,
  `Confirmed` INT DEFAULT NULL,
  `Deaths` INT DEFAULT NULL,
  `Recovered` INT DEFAULT NULL,
  `Active` INT DEFAULT NULL,
  `New cases` INT DEFAULT NULL,
  `New deaths` INT DEFAULT NULL,
  `New recovered` INT DEFAULT NULL,
  `Deaths / 100 Cases` DOUBLE DEFAULT NULL,
  `Recovered / 100 Cases` DOUBLE DEFAULT NULL,
  `Deaths / 100 Recovered` DOUBLE DEFAULT NULL,
  `Confirmed last week` INT DEFAULT NULL,
  `1 week change` INT DEFAULT NULL,
  `1 week % increase` DOUBLE DEFAULT NULL,
  `WHO Region` TEXT,
  `row_num` INT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


select*
from country_wise_latest_staging_3;
















 
