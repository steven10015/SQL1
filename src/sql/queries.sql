-- PLEASE READ THIS BEFORE RUNNING THE EXERCISE

-- ⚠️ IMPORTANT: This SQL file may crash due to two common issues: comments and missing semicolons.

-- ✅ Suggestions:
-- 1) Always end each SQL query with a semicolon `;`
-- 2) Ensure comments are well-formed:
--    - Use `--` for single-line comments only
--    - Avoid inline comments after queries
--    - Do not use `/* */` multi-line comments, as they may break execution

-- -----------------------------------------------
-- queries.sql
-- Complete each mission by writing your SQL query
-- directly below the corresponding instruction
-- -----------------------------------------------

SELECT * FROM regions;
SELECT * FROM species;
SELECT * FROM climate;
SELECT * FROM observations;


-- MISSION 1
-- Primeras 10 observaciones
SELECT * FROM observations
LIMIT 10;

-- MISSION 2
-- Selección de los id de regiones
SELECT DISTINCT region_id FROM Observations;


-- MISSION 3
-- Conteo de las distintas especies 
SELECT COUNT(DISTINCT species_id) AS conteo_especies FROM Observations;


-- MISSION 4
-- Observaciones de la región 2
SELECT COUNT(*) AS conteo_region_2 FROM Observations
WHERE region_id LIKE 2;

-- MISSION 5
-- Observaciones del 1998-08-08
SELECT * FROM Observations
WHERE observation_date = "1998-08-08";

-- MISSION 6
-- Región con más observaciones
SELECT region_id, COUNT(*) AS conteo_total FROM Observations
GROUP BY region_id
Order by conteo_total desc;

-- MISSION 7
-- Las 5 especies más frecuentes
SELECT species_id, COUNT(*) AS especies_totales FROM Observations
GROUP BY species_id
Order by especies_totales desc
LIMIT 10;

-- MISSION 8
-- Especies con menos de 5 registros
SELECT species_id, COUNT(*) AS especies_vistas FROM Observations
GROUP BY species_id
HAVING especies_vistas < 5
ORDER BY especies_vistas desc;

-- MISSION 9
-- Observadores con más observaciones
SELECT observer, COUNT(*) AS observaciones_hechas FROM Observations
GROUP BY observer 
ORDER BY observaciones_hechas DESC
LIMIT 5;

-- MISSION 10
-- Region de cada observacion
SELECT observations.id, regions.name AS region_name, observations.observation_date
FROM observations
JOIN regions ON observations.region_id = regions.id;

-- MISSION 11
-- Nombre cientifico de cada especie
-- Colocar como extra la variable de observation.date para una tabla más completa
SELECT observations.id, species.scientific_name AS species_name, observations.observation_date
FROM observations
JOIN species ON observations.species_id = species.id;

-- MISSION 12
-- Especie más observada por región 
SELECT regions.name AS region, species.scientific_name AS species_name, COUNT(*) AS total_count
FROM observations
JOIN species ON observations.species_id = species.id
JOIN regions ON observations.region_id = regions.id
GROUP BY region, species_name
ORDER BY region, total_count DESC;

