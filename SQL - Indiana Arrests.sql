/*SOURCE: https://hub.mph.in.gov/ro/dataset/equity-portal-public-safety-data-arrests
Race - Self-identified race
Year - Year the data was collected
County - County of location of the booking agency making the arrest
Arrests - # of arrests made in that county in that year
Population - Population based on 2010 census in that county
Arrest per 1000 people - # of arrests made per 1000 individuals*/

/* CREATE TABLE */
CREATE TABLE arrests (
	County VARCHAR (50),
	Race VARCHAR (50),
	Year INT,
	Arrests INT,
	Population_2010 INT,
	Arrests_per_1000 FLOAT
);

COPY arrests(County, race, Year, Arrests, Population_2010, Arrests_per_1000)
FROM 'Drive:\Folder\arrests.csv'
DELIMITER ','
CSV HEADER;


/* TOTAL ARRESTS PER YEAR*/
CREATE TABLE arrests_per_year AS (
	SELECT
		Year, SUM(Arrests)
	FROM
		arrests
	WHERE
		Race = 'All'
	GROUP BY
		Year
	ORDER BY
		Year
);

SELECT
	*
FROM
	arrests_per_year;

/* Average arrests_per_1000 by race and year (weighted average) */
CREATE TABLE apo AS(
	SELECT
		race,
		year,
		SUM(arrests) AS total_arrests,
		SUM(population_2010) AS total_population,
		ROUND(AVG(arrests_per_1000)::numeric, 2)::float AS apo_weighted
	FROM
		arrests
	GROUP BY
		race,
		year
	ORDER BY
		year
);

/* Sorted by arrests per 1000 individuals */
/* The arrests_per_1000 value for race of Unknown is a null value */
SELECT
	*
FROM
	arrests
ORDER BY
	arrests_per_1000 DESC NULLS LAST;

/* Total population by race */
SELECT
	DISTINCT race,
	SUM(population_2010)
FROM
	arrests
WHERE
	race NOT IN ('All')
	AND year = 2020
GROUP BY
	race;

/* Select data from arrests table based on county */
SELECT
	*
FROM
	arrests
WHERE
	county = 'Warren'
ORDER BY
	year, race;

/* Top 10 counties with largest population */
SELECT
	DISTINCT county,
	population_2010
FROM
	arrests
WHERE
	race = 'All'
ORDER BY
	population_2010 DESC NULLS LAST LIMIT 10;