/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id INT PRIMARY KEY NOT NULL,
    name          varchar(100) NOT NULL,
    date_of_birth DATE NOT NULL,
    escape_attempts INT NOT NULL,
    neutered BOOLEAN NOT NULL,
    weight_kg DECIMAL NOT NULL,
);

ALTER TABLE animals
ADD COLUMN species VARCHAR(150);

-- Create multiple tables

CREATE TABLE owners (
    id       SERIAL PRIMARY KEY,
    fullname VARCHAR(200) NOT NULL,
    age      INT NOT NULL
);

CREATE TABLE species (
    id  SERIAL PRIMARY KEY,
    name  VARCHAR(200) NOT NULL
);

ALTER TABLE animals
DROP COLUMN id;

ALTER TABLE animals
ADD COLUMN id SERIAL PRIMARY KEY;

ALTER TABLE animals
DROP COLUMN species;

ALTER TABLE animals
ADD COLUMN species_id INT,
ADD FOREIGN KEY (species_id) REFERENCES species(id);

ALTER TABLE animals
ADD COLUMN owner_id INT,
ADD FOREIGN KEY (owner_id) REFERENCES owners(id);