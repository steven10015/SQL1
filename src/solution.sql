-- This SQL script contains the solution to the missions for the Wildlife Conservation Database.
-- Please use this solution just in case you need to verify your own queries or if you get stuck.

SELECT * FROM regions;
SELECT * FROM species;
SELECT * FROM climate;
SELECT * FROM observations;

-- Mission 1: Which regions have the most registered species?
SELECT r.name AS region, r.country, COUNT(DISTINCT s.id) AS unique_species
FROM observations o
JOIN species s ON o.species_id = s.id
JOIN regions r ON o.region_id = r.id
GROUP BY r.name, r.country
ORDER BY unique_species DESC;

-- Mission 2: Which months have the highest observation activity?
SELECT strftime('%m', observation_date) AS month, COUNT(*) AS total_observations
FROM observations
GROUP BY month
ORDER BY total_observations DESC;

-- Mission 3: Which species have few individuals recorded?
SELECT s.scientific_name, s.common_name, SUM(o.count) AS total_count
FROM observations o
JOIN species s ON o.species_id = s.id
GROUP BY s.id
HAVING total_count < 5
ORDER BY total_count ASC;

-- Mission 4: Which region has the highest number of distinct species observed?
SELECT r.name, r.country, COUNT(DISTINCT o.species_id) AS species_count
FROM observations o
JOIN regions r ON o.region_id = r.id
GROUP BY r.id
ORDER BY species_count DESC
LIMIT 1;

-- Mission 5: Which species have been observed most frequently?
SELECT s.scientific_name, s.common_name, COUNT(*) AS total_observations
FROM observations o
JOIN species s ON o.species_id = s.id
GROUP BY s.id
ORDER BY total_observations DESC
LIMIT 10;

-- Mission 6: Who are the most active observers?
SELECT observer, COUNT(*) AS total
FROM observations
GROUP BY observer
ORDER BY total DESC
LIMIT 10;

-- Mission 7: Which species have never been observed?
SELECT scientific_name, common_name
FROM species
WHERE id NOT IN (SELECT DISTINCT species_id FROM observations);

-- Mission 8: On which dates were the most distinct species observed?
SELECT observation_date, COUNT(DISTINCT species_id) AS distinct_species
FROM observations
GROUP BY observation_date
ORDER BY distinct_species DESC
LIMIT 10;
-- -- MISSION 1
-- -- This query retrieves the total number of distinct species in each region,
-- SELECT regions.name, COUNT(DISTINCT species.id) AS total_species
-- FROM species
-- JOIN regions ON species.region_id = regions.id
-- GROUP BY regions.name
-- ORDER BY total_species DESC;


-- -- MISSION 2
-- -- This query retrieves the regions with extreme climate conditions
-- SELECT regions.name, climate.avg_temperature, climate.precipitation_mm
-- FROM climate
-- JOIN regions ON climate.region_id = regions.id
-- WHERE avg_temperature > 40 OR avg_temperature < -10 OR precipitation_mm < 100;


-- -- MISSION 3
-- -- This query retrieves species with a population estimate less than 20% of their maximum historic population
-- SELECT name, scientific_name, population_estimate, population_max_historic
-- FROM species
-- WHERE population_estimate < 0.2 * population_max_historic;


-- -- MISSION 4
-- -- This query retrieves the regions with the highest number of distinct species observed
-- SELECT regions.name, COUNT(DISTINCT observations.species_id) AS observed_species
-- FROM observations
-- JOIN regions ON observations.region_id = regions.id
-- GROUP BY regions.name
-- ORDER BY observed_species DESC;


-- -- MISSION 5
-- -- This query retrieves the species with the most observations, showing their name and total count
-- SELECT species.name, COUNT(*) AS total_observations
-- FROM observations
-- JOIN species ON observations.species_id = species.id
-- GROUP BY species.name
-- ORDER BY total_observations DESC;


-- -- MISSION 6
-- -- This query retrieves the observers with the most observations, showing their name and total count
-- SELECT observer_name, COUNT(*) AS total_observations
-- FROM observations
-- GROUP BY observer_name
-- ORDER BY total_observations DESC;


-- -- MISSION 7
-- -- This query retrieves species that have never been observed, showing their name and scientific name
-- SELECT name, scientific_name
-- FROM species
-- LEFT JOIN observations ON species.id = observations.species_id
-- WHERE observations.species_id IS NULL;


-- -- MISSION 8
-- -- This query retrieves the average temperature for each region based on observations
-- SELECT regions.name, AVG(climate.avg_temperature) AS avg_temp
-- FROM observations
-- JOIN regions ON observations.region_id = regions.id
-- JOIN climate ON regions.id = climate.region_id
-- GROUP BY regions.name
-- ORDER BY avg_temp DESC;

-- End of queries.sql