select*
from`country_wise_latest pivot table`;

 10 countries with maximum deaths, showing only 10 countries which have maximum daeths n also showing their death rate n recovery rate

SELECT 
    `ï»¿Country/Region` AS country,
    Confirmed,
    Deaths,
    Recovered,
    Active,
    ROUND((Deaths / Confirmed) * 100, 2) AS death_rate_percent,
    ROUND((Recovered / Confirmed) * 100, 2) AS recovery_rate_percent
FROM `country_wise_latest pivot table`
WHERE Confirmed > 0
ORDER BY deaths DESC
LIMIT 10;

DROP TABLE 2covid.top10_countries_covid_stats;

CREATE TABLE 2covid.top10_countries_covid_stats AS
SELECT 
    `ï»¿Country/Region` AS country,
    Confirmed,
    Deaths,
    Recovered,
    Active,
    ROUND((Deaths / Confirmed) * 100, 2) AS death_rate_percent,
    ROUND((Recovered / Confirmed) * 100, 2) AS recovery_rate_percent
FROM `country_wise_latest pivot table`
WHERE Confirmed > 0
ORDER BY deaths DESC
LIMIT 10;

10 countries with highest number of confirmed cases
SELECT 
`ï»¿Country/Region` AS country,
    Confirmed,
    Deaths,
    Recovered,
    Active
FROM `country_wise_latest pivot table`
WHERE Confirmed > 0
ORDER BY Confirmed DESC
LIMIT 10;

drop table`top_10_countries_covid`;
CREATE TABLE `top_10_countries_covid` AS
SELECT 
  `ï»¿Country/Region` AS country,
  Confirmed,
  Deaths,
  Recovered,
  Active
FROM `country_wise_latest pivot table`
WHERE Confirmed > 0
ORDER BY Confirmed DESC
LIMIT 10;








 10 countries with best recovery rates
`day_wise  pivot table`
SELECT 
    `ï»¿Country/Region` AS country,
    Confirmed,
    Deaths,
    Recovered,
    Active,
    ROUND((Recovered / Confirmed) * 100, 2) AS recovery_rate_percent
FROM `country_wise_latest pivot table`
WHERE 
    Confirmed > 10000 AND              -- Filters countries with significant number of cases
    (Recovered / Confirmed) > 0.80     -- Good recovery rate (>80%)
ORDER BY recovery_rate_percent DESC
LIMIT 10;


CREATE TABLE top10_high_recovery_countries (
    country VARCHAR(100),
    Confirmed INT,
    Deaths INT,
    Recovered INT,
    Active INT,
    recovery_rate_percent DECIMAL(5,2)
);
INSERT INTO top10_high_recovery_countries
SELECT 
    `ï»¿Country/Region` AS country,
    Confirmed,
    Deaths,
    Recovered,
    Active,
    ROUND((Recovered / Confirmed) * 100, 2) AS recovery_rate_percent
FROM `country_wise_latest pivot table`
WHERE 
    Confirmed > 10000 AND
    (Recovered / Confirmed) > 0.80
ORDER BY recovery_rate_percent DESC
LIMIT 10;


select*
from top10_high_recovery_countries;


select*
from`full_grouped   pivot table`;


select*
from `day_wise  pivot table`;


