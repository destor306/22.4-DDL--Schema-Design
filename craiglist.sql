
DROP DATABASE IF EXISTS craiglist;


CREATE DATABASE craiglist;
DROP TABLE IF EXISTS Regions, Categories, Users, Posts;

\c craiglist;

CREATE TABLE Regions
(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE Categories
(
    id SERIAL PRIMARY KEY,
    name TEXT
);

CREATE TABLE Users
(
    id SERIAL PRIMARY KEY,
    name TEXT,
    password TEXT,
    region_id INT REFERENCES Regions(id)
);
CREATE TABLE Posts
(
    id SERIAL PRIMARY KEY,
    title TEXT,
    description TEXT,
    user_id INT REFERENCES Users(id),
    region_id INT REFERENCES Regions(id),
    category_id INT REFERENCES Categories(id)
);

INSERT INTO Regions (name)
VALUES
('North'),
('South'),
('East'),
('West');

INSERT INTO Categories (name)
VALUES
('Electronics'),
('Furniture'),
('Vehicles'),
('Real Estate');

INSERT INTO Users (name, password, region_id)
VALUES
('John Doe', 'password123', 1),
('Jane Smith', 'letmein', 2),
('Bob Johnson', 'securepass', 3);

INSERT INTO Posts (title, description, user_id, region_id, category_id)
VALUES
('Used Laptop for Sale', 'Selling a slightly used laptop with great specs.', 1, 1, 1),
('Antique Table', 'Beautiful antique wooden table for sale.', 2, 2, 2),
('2018 Toyota Camry', 'Low-mileage, excellent condition Toyota Camry for sale.', 3, 1, 3),
('2 BHK Apartment for Rent', 'Spacious 2-bedroom apartment available for rent.', 1, 4, 4);
