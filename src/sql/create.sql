-- create.sql
-- Creates the necessary tables for the "Data Detectives" project (SQLite version)

DROP TABLE IF EXISTS observations;
DROP TABLE IF EXISTS climate;
DROP TABLE IF EXISTS species;
DROP TABLE IF EXISTS regions;

CREATE TABLE regions (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    code TEXT UNIQUE NOT NULL,
    name TEXT NOT NULL
);

CREATE TABLE species (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    scientific_name TEXT,
    population_estimate INTEGER,
    population_max_historic INTEGER,
    region_id INTEGER,
    FOREIGN KEY (region_id) REFERENCES regions(id)
);

CREATE TABLE climate (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    region_id INTEGER,
    avg_temperature REAL,
    precipitation_mm REAL,
    FOREIGN KEY (region_id) REFERENCES regions(id)
);

CREATE TABLE observations (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    species_id INTEGER,
    region_id INTEGER,
    observed_at TEXT,
    quantity INTEGER,
    observer_name TEXT,
    FOREIGN KEY (species_id) REFERENCES species(id),
    FOREIGN KEY (region_id) REFERENCES regions(id)
);



