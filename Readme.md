## Database Normalization Assignment

### **Objectives:**
#### The objective of this lab is to work with First and Second Order Normalization in PostGreSQL. I created a database with a table that violates 1NF and 2NF then worked to fix the issues and demonstrate compliance.

### **Files:**
#### 1. Gaskill_DatabaseNormalizationAssignment.sql
#####  - The main SQL script
#### 2. Readme.md
#####  - The Readme file containing metadata and reports
#### 3. Images
#####  - Images folder containing the final table structures in the database

### **Normalization Report:**
####  A non-normalized table was created named 'Parks_Info' consisting of a primary key ID, ParkName, and Facilities columns. Dummy data of 3 parks was inserted into this table.

#### Next, the data was normalized to the First Normal form by creating a 'Parks' table with a Park ID primary key and ParkName. A 'Facilities' table was created with a Facility ID primary key, a Foreign Key of ParkID from the 'Parks' table, and a FacilityName.

#### The data was populated into the 'Parks' and 'Facilities'. For the Second Normal Form, foreign keys were used to link related data across the tables. The next table, 'ParkFacilities' was created with a FacilityID primary key and FacilityName.

#### Finally, the original 'Facilities' table was updated, removing the redundant 'FacilityName' column and adding a foreign key constraint between 'Facilities' and 'ParkFacilities'.


### **Final table structure:**
![This file contains 4 tables, including parks_info, Facilities, ParkFacilities, and parks, all of which have been normalized to both the First and Second Normal Form](/Images/finalTableStructures.png)

