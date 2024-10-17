CREATE TABLE films (
  name TEXT,
  release_year INTEGER
);

INSERT INTO films (name, release_year)
VALUES ('Deadpool & Wolverine', 2024);

INSERT INTO films (name, release_year)
VALUES ('Speak No Evil', 2024);

INSERT INTO films (name, release_year)
VALUES ('The Lord of the Rings: The Rings of Power', 2022);

SELECT * FROM films
WHERE release_year = 2024;

ALTER TABLE films
ADD COLUMN runtime INTEGER,
ADD COLUMN category TEXT,
ADD COLUMN rating REAL;

UPDATE films
SET runtime = 60,
	category = 'TV series',
    rating = 6.9
WHERE name = 'The Lord of the Rings: The Rings of Power';
    
UPDATE films
SET runtime = 128,
	category = 'Movie',
    rating = 7.8
WHERE name = 'Deadpool & Wolverine';
    
UPDATE films
SET runtime = 110,
	category = 'Movie',
    rating = 6.9
WHERE name = 'Speak No Evil';

ALTER TABLE films
ADD CONSTRAINT unique_name UNIQUE (name);