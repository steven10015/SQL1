-- This SQL script contains the solution to the missions for the Wildlife Conservation Database.
-- Please use this solution just in case you need to verify your own queries or if you get stuck.

SELECT * FROM regions;
SELECT * FROM species;
SELECT * FROM climate;
SELECT * FROM observations;

-- Misión 1: Regiones con mayor biodiversidad
SELECT 
    regions.name,
    regions.country,
    COUNT(DISTINCT species.id) AS total_species
FROM observations
JOIN species ON observations.species_id = species.id
JOIN regions ON observations.region_id = regions.id
GROUP BY regions.name, regions.country
ORDER BY total_species DESC;

-- Misión 2: Meses con mayor actividad de observación
SELECT 
    strftime('%m', observations.observation_date) AS month,
    COUNT(*) AS total
FROM observations
GROUP BY month
ORDER BY total DESC;

-- Misión 3: Especies poco registradas (< 5 individuos)
SELECT 
    species.scientific_name,
    species.common_name,
    SUM(observations.count) AS total_count
FROM observations
JOIN species ON observations.species_id = species.id
GROUP BY species.id
HAVING total_count < 5
ORDER BY total_count ASC;

-- Misión 4: Región con más especies distintas observadas
SELECT 
    regions.name,
    regions.country,
    COUNT(DISTINCT observations.species_id) AS species_count
FROM observations
JOIN regions ON observations.region_id = regions.id
GROUP BY regions.name, regions.country
ORDER BY species_count DESC
LIMIT 1;

-- Misión 5: Especies más observadas (por cantidad de registros)
SELECT 
    species.scientific_name,
    species.common_name,
    COUNT(*) AS total_observations
FROM observations
JOIN species ON observations.species_id = species.id
GROUP BY species.id
ORDER BY total_observations DESC
LIMIT 10;

-- Misión 6: Observadores más activos
SELECT 
    observations.observer,
    COUNT(*) AS total
FROM observations
GROUP BY observations.observer
ORDER BY total DESC
LIMIT 10;

-- Misión 7: Especies nunca observadas
SELECT 
    species.scientific_name,
    species.common_name
FROM species
LEFT JOIN observations ON species.id = observations.species_id
WHERE observations.species_id IS NULL;

-- Misión 8: Fechas con más especies distintas observadas
SELECT 
    observations.observation_date,
    COUNT(DISTINCT observations.species_id) AS distinct_species
FROM observations
GROUP BY observations.observation_date
ORDER BY distinct_species DESC
LIMIT 10;

-- End of queries.sql
