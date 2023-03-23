CREATE TABLE all_data AS (
	SELECT * FROM data_2018
	UNION ALL
	SELECT * FROM data_2019
	UNION ALL
	SELECT * FROM data_2020
);

SELECT
	arrival_date_year, hotel, ROUND(SUM((stays_in_week_nights + stays_in_weekend_nights)*adr))
AS
	revenue
FROM
	all_data
GROUP BY
	arrival_date_year, hotel

SELECT
	*
FROM
	all_data
LEFT JOIN
	market_segment
ON
	all_data.market_segment = market_segment.market_segment
LEFT JOIN
	meal_cost
ON
	meal_cost.meal = all_data.meal