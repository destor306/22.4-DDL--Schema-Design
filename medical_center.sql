
DROP DATABASE IF EXISTS medical_center;


CREATE DATABASE medical_center;
DROP TABLE IF EXISTS doctors, patients, visits, diagnoses, diseases;

\c medical_center;

CREATE TABLE doctors
(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    specialty TEXT NOT NULL
);

CREATE TABLE patients
(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    insurance TEXT NOT NULL,
    birthday DATE
);

CREATE TABLE visits
(
    id SERIAL PRIMARY KEY,
    doctor_id INT REFERENCES doctors(id),
    patient_id INT REFERENCES doctors(id),
    date DATE
);

CREATE TABLE Diagnoses
(
    id SERIAL PRIMARY KEY,
    visit_id INT REFERENCES visits(id),
    description TEXT NOT NULL
);

CREATE TABLE diseases
(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    description TEXT NOT NULL
);

INSERT INTO doctors (name, specialty)
VALUES
('susan', 'pediatrician'),
('michael', 'cardiologist'),
('linda', 'dermatologist');


INSERT INTO patients (name, insurance, birthday)
VALUES
('john', 'Aetna', '1985-10-15'),
('emily', 'Cigna', '1978-03-12'),
('david', 'Blue Shield', '1990-12-05');

-- Assigning patients to doctors for visits
INSERT INTO visits (doctor_id, patient_id, date)
VALUES
(1, 1, '2023-01-15'),
(2, 2, '2023-02-20'),
(3, 3, '2023-03-25'),
(1, 2, '2023-04-10'),
(2, 1, '2023-05-05');


INSERT INTO diagnoses (visit_id, description)
VALUES
(1, 'Eye infection'),
(2, 'Heart palpitations'),
(3, 'Skin rash'),
(4, 'Eye examination'),
(5, 'Chest pain');


INSERT INTO diseases (name, description)
VALUES
('Conjunctivitis', 'Inflammation of the eye membrane'),
('Arrhythmia', 'Irregular heartbeat'),
('Eczema', 'Skin inflammation'),
('Glaucoma', 'Eye condition affecting vision'),
('Hypertension', 'High blood pressure');
