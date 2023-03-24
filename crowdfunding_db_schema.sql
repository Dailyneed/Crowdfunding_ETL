-- Drop tables if existing

DROP TABLE IF EXISTS contacts CASCADE;
DROP TABLE IF EXISTS category CASCADE;
DROP TABLE IF EXISTS subcategory CASCADE;
DROP TABLE IF EXISTS campaign CASCADE;

-- Create tables and import CSV files into correct SQL table

CREATE TABLE contacts (
	contact_id int PRIMARY KEY NOT NULL,
	first_name varchar(50) NOT NULL,
	last_name varchar(50) NOT NULL,
	email varchar(100) NOT NULL
);

CREATE TABLE category (
	category_id varchar(4) PRIMARY KEY NOT NULL,
	category varchar(255) NOT NULL
);

CREATE TABLE subcategory (
	subcategory_id varchar(6) PRIMARY KEY NOT NULL,
	subcategory varchar(255) NOT NULL
);

CREATE TABLE campaign (
	cf_id int PRIMARY KEY NOT NULL,
	contact_id int NOT NULL,
	company_name varchar(255) NOT NULL,
	description varchar(255) NOT NULL,
	goal float NOT NULL,
	pledged float NOT NULL,
	outcome varchar(15) NOT NULL,
	backers_count int NOT NULL,
	country varchar(2) NOT NULL,
	launch_date date NOT NULL,
	end_date date NOT NULL,
	category_id varchar(4) NOT NULL,
	subcategory_id varchar(6) NOT NULL,
	FOREIGN KEY (contact_id) REFERENCES contacts (contact_id),
	FOREIGN KEY (category_id) REFERENCES category (category_id),
	FOREIGN KEY (subcategory_id) REFERENCES subcategory (subcategory_id)
);

-- Query each table to verify data

SELECT * FROM contacts;

SELECT * FROM category;

SELECT * FROM subcategory;

SELECT * FROM campaign;
