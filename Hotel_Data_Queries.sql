CREATE TABLE data_2018 (
	hotel VARCHAR,
	is_canceled INT,
	lead_time INT,
	arrival_date_year INT,
	arrival_date_month VARCHAR (16),
	arrival_date_week_number INT,
	arrival_date_day_of_month INT,
	stays_in_weekend_nights INT,
	stays_in_week_nights INT,
	adults INT,
	children INT,
	babies INT,
	meal VARCHAR,
	country VARCHAR,
	market_segment VARCHAR,
	distribution_channel VARCHAR,
	is_repeated_guest INT,
	previous_cancellations INT,
	previous_bookings_not_canceled INT,
	reserved_room_type VARCHAR,
	assigned_room_type VARCHAR,
	booking_changes INT,
	deposit_type VARCHAR,
	agent INT,
	company NUMERIC,
	days_in_waiting_list INT,
	customer_type VARCHAR,
	adr FLOAT,
	required_car_parking_spaces INT,
	total_of_special_requests INT,
	reservation_status VARCHAR,
	reservation_status_date DATE
);

CREATE TABLE data_2019 (
	hotel VARCHAR,
	is_canceled INT,
	lead_time INT,
	arrival_date_year INT,
	arrival_date_month VARCHAR (16),
	arrival_date_week_number INT,
	arrival_date_day_of_month INT,
	stays_in_weekend_nights INT,
	stays_in_week_nights INT,
	adults INT,
	children INT,
	babies INT,
	meal VARCHAR,
	country VARCHAR,
	market_segment VARCHAR,
	distribution_channel VARCHAR,
	is_repeated_guest INT,
	previous_cancellations INT,
	previous_bookings_not_canceled INT,
	reserved_room_type VARCHAR,
	assigned_room_type VARCHAR,
	booking_changes INT,
	deposit_type VARCHAR,
	agent INT,
	company INT,
	days_in_waiting_list INT,
	customer_type VARCHAR,
	adr FLOAT,
	required_car_parking_spaces INT,
	total_of_special_requests INT,
	reservation_status VARCHAR,
	reservation_status_date DATE
);

CREATE TABLE data_2020 (
	hotel VARCHAR,
	is_canceled INT,
	lead_time INT,
	arrival_date_year INT,
	arrival_date_month VARCHAR (16),
	arrival_date_week_number INT,
	arrival_date_day_of_month INT,
	stays_in_weekend_nights INT,
	stays_in_week_nights INT,
	adults INT,
	children INT,
	babies INT,
	meal VARCHAR,
	country VARCHAR,
	market_segment VARCHAR,
	distribution_channel VARCHAR,
	is_repeated_guest INT,
	previous_cancellations INT,
	previous_bookings_not_canceled INT,
	reserved_room_type VARCHAR,
	assigned_room_type VARCHAR,
	booking_changes INT,
	deposit_type VARCHAR,
	agent INT,
	company INT,
	days_in_waiting_list INT,
	customer_type VARCHAR,
	adr FLOAT,
	required_car_parking_spaces INT,
	total_of_special_requests INT,
	reservation_status VARCHAR,
	reservation_status_date DATE
);

CREATE TABLE market_segment (
	discount FLOAT,
	market_segment VARCHAR
);

ALTER TABLE
	meal_cost
ADD COLUMN
	cost FLOAT,
ADD COLUMN
	meal VARCHAR;

COPY meal_cost FROM 'F:/Downloads/hotel_meal_cost.csv' WITH CSV HEADER;

COPY market_segment FROM 'F:/Downloads/market_segment.csv' WITH CSV HEADER;

COPY data_2018 FROM 'F:/Downloads/2018.csv' WITH CSV HEADER;

COPY data_2019 FROM 'F:/Downloads/2019.csv' WITH CSV HEADER;

COPY data_2020 FROM 'F:/Downloads/2020.csv' WITH CSV HEADER;

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
	arrival_date_year, hotel;

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
	meal_cost.meal = all_data.meal;
