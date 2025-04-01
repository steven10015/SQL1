-- Inserts sample data for the "Data Detectives" project

INSERT INTO regions (code, name) VALUES
('ANDES-N', 'Northern Andes'),
('SELVA-C', 'Central Jungle'),
('COSTA-W', 'Western Coast'),
('PAMPA-S', 'Southern Pampa'),
('AMAZ-N', 'Northern Amazon');

INSERT INTO species (name, scientific_name, population_estimate, population_max_historic, region_id) VALUES
('Andean bear', 'Tremarctos ornatus', -50, 400, 1),
('Jaguar', 'Panthera onca', 120, 200, 2),
('Sea lion', 'Otaria flavescens', 800, 1200, 3),
('Andean condor', 'Vultur gryphus', 150, 350, 1),
('Green anaconda', 'Eunectes murinus', 300, 500, 5),
('Puma', 'Puma concolor', 240, 400, 2);

INSERT INTO climate (region_id, avg_temperature, precipitation_mm) VALUES
(1, 8.5, 300.25),
(2, 27.8, 95.00),
(3, 22.1, 180.60),
(4, 19.6, 145.80),
(5, 30.2, 350.00);

INSERT INTO observations (species_id, region_id, observed_at, quantity, observer_name) VALUES
(1, 1, '2025-01-10', 2, 'cchavez'),
(2, 2, '2025-02-14', 0, 'jvaldez'),
(3, 3, '2025-02-20', 5, 'rrojas'),
(4, 1, '2025-03-05', 3, 'mlinares'),
(5, 5, '2025-03-07', 1, 'agalvez'),
(6, 2, '2025-03-01', 2, 'mlinares'),
(2, 2, '2025-03-10', 1, 'rrojas'),
(5, 5, '2025-03-15', 0, 'testuser');