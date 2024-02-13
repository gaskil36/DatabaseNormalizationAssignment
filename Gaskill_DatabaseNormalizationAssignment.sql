-- This script is in the format of the pSQL shell, which was used for the assignment as opossed to pgadmin

-- Part 1: Creating a Non-Normalized Table and Normalizing to 1NF
-- Create a table named 'Parks_Info' with three columns: ID, ParkName, and Facilities
CREATE TABLE Parks_Info(
ID SERIAL PRIMARY KEY,
ParkName VARCHAR(255),
Facilities VARCHAR(255)
);

-- Insert data into the Parks_Info table
INSERT INTO Parks_Info (ParkName, Facilities) VALUES
('Central Park', 'Playground, Restroom, Picnic area'),
('Liberty Park', 'Restroom, Picnic area'),
('Riverside Park', 'Playground, Bike Path');

-- Create a new table 'Parks' to store information about parks with a more normalized structure
CREATE TABLE PARKS (
ParkID SERIAL PRIMARY KEY,
ParkName VARCHAR(255)
);

-- Create a facilities table to separately store facilities available in each park
CREATE TABLE Facilities (
FacilityID SERIAL PRIMARY KEY,
ParkID INT,
FacilityName VARCHAR(255),
FOREIGN KEY (ParkID) REFERENCES Parks(ParkID)
);

-- Populate Parks with data split from Parks_Info
INSERT INTO Parks (ParkName)
SELECT DISTINCT ParkName FROM Parks_Info;

-- Populate Facilities with data split from Parks_Info
INSERT INTO Facilities (ParkID, FacilityName) VALUES
(3, 'Playground'),
(3, 'Restroom'),
(3, 'Picnic area'),
(2, 'Restroom'),
(2, 'Picnic area'),
(1, 'Playground'),
(1, 'Bike Path');

-- Part 2: Advancing to 2NF
-- Create table 'ParkFacilities' to further normalize the data
CREATE TABLE ParkFacilities (
FacilityID SERIAL PRIMARY KEY,
FacilityName VARCHAR(255)
);

-- Insert values of each facilityName stored
INSERT INTO ParkFacilities (FacilityName)
VALUES ('Playground'), ('Restroom'), ('Picnic area'), ('Bike Path');

-- Modify the 'Facilities' table to include a reference to 'ParkFacilities'
ALTER TABLE Facilities ADD COLUMN ParkFacilityID INT;

-- Add a foreign key constraint to 'Facilities' to enforce the relationship between 'Facilities' and 'ParkFacilities'
ALTER TABLE Facilities
ADD CONSTRAINT fk_parkfacilityid FOREIGN KEY (ParkFacilityID) REFERENCES ParkFacilities(FacilityID);

-- Ensure that every 'FacilityID' in 'Facilities' corresponds to a valid 'FacilityID' in 'ParkFacilities'
UPDATE Facilities
SET ParkFacilityID = (SELECT FacilityID FROM ParkFacilities WHERE FacilityName = Facilities.FacilityName); 

-- Cleanup redundant columns
ALTER TABLE Facilities DROP COLUMN FacilityName;
