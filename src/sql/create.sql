CREATE TABLE regions (
    id SERIAL PRIMARY KEY,
    code VARCHAR(10) UNIQUE NOT NULL,
    name VARCHAR(100) NOT NULL
);

CREATE TABLE species (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    scientific_name VARCHAR(100),
    population_estimate INTEGER,
    population_max_historic INTEGER,
    region_id INTEGER REFERENCES regions(id)
);

CREATE TABLE climate (
    id SERIAL PRIMARY KEY,
    region_id INTEGER REFERENCES regions(id),
    avg_temperature DECIMAL(5,2),
    precipitation_mm DECIMAL(6,2)
);

CREATE TABLE observations (
    id SERIAL PRIMARY KEY,
    species_id INTEGER REFERENCES species(id),
    region_id INTEGER REFERENCES regions(id),
    observed_at DATE,
    quantity INTEGER,
    observer_name VARCHAR(100)
);