CREATE TABLE [IF NOT EXISTS] annual_stats (
    stat_year INTEGER NOT NULL,
    num_employees NUMERIC,
    num_div_vehicles INTEGER,
    annual_budget NUMERIC,
    owner_surrenders INTEGER,
    strays INTEGER,
    aco_impounds INTEGER,
    total_animal_intake INTEGER,
    adoptions INTEGER,
    rto INTEGER,
    euthanized INTEGER,
    transported INTEGER,
    fosters INTEGER,
    service_calls INTEGER,
    emergency_callouts INTEGER,
    grants_received NUMERIC,
    adoption_rev NUMERIC
);

SELECT
    *
FROM
    annual_stats
ORDER BY
    stat_year;

UPDATE
    annual_stats
SET
    aco_impounds = 0 WHERE aco_impounds IS NULL,
SET
    fosters = 0 WHERE fosters IS NULL,
SET
    service_calls = 0 WHERE service_calls IS NULL;

ALTER TABLE
    annual_stats
ADD COLUMN
    live_outcomes INTEGER,
ADD COLUMN
    all_outcomes INTEGER,
ADD COLUMN
    live_release_rate DECIMAL(3,2);

UPDATE
    annual_stats
SET
    live_outcomes = adoptions + rto + transported,
    all_outcomes = euthanized + adoptions + rto + transported;
    
UPDATE
    annual_stats
SET
    live_release_rate = CAST (live_outcomes AS DECIMAL)/all_outcomes;
