CREATE TABLE minions_birthdays (
	id SERIAL PRIMARY KEY,
	name VARCHAR(30),
	date_of_birth DATE,
	age INT,
	present VARCHAR(100),
	party TIMESTAMPTZ
);