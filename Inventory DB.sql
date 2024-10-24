SELECT *
FROM parts
LIMIT 10;

ALTER TABLE parts
ALTER COLUMN code SET NOT NULL;

ALTER TABLE parts
ADD UNIQUE (code);

--Query to update all description records where there is no description
UPDATE parts
SET description = 'None Available'
WHERE description IS NULL;


--As an extra exercise, think about how you might alter the table if you wanted to fill in missing description fields with different values for each part.
--To update each row with a different value, you can follow the same pattern, but you’ll need to fill the descriptions. See the following example. First, we create an intermediate table that will store descriptions.

CREATE TABLE part_descriptions (
    id int PRIMARY KEY, 
    description text
);

--Then we fill the intermediate table with the descriptions for the empty rows in 'parts'. In this example we assume we’re filling id=1 and id=2.

INSERT INTO part_descriptions VALUES (1, '5V resistor'), (2, '3V resistor');

--Finally, we update the values in the original table using an UPDATE statement while joining the original table with the table with descriptions.

UPDATE parts
SET description = part_descriptions.description
from part_descriptions
where part_descriptions.id = parts.id
and parts.description IS NULL

--if we have a small number of updates or if the descriptions are not predefined, updating the parts table directly might be more straightforward. The intermediate table is helpful for organizing and managing updates when dealing with larger datasets or when updates are complex.

ALTER TABLE parts
ALTER COLUMN description SET NOT NULL;

INSERT INTO parts (id, description, code, manufacturer_id)
VALUES (54, 'Something mechanical', 'V1-009', 9);

ALTER TABLE reorder_options
ALTER COLUMN price_usd SET NOT NULL,
ALTER COLUMN quantity SET NOT NULL;

ALTER TABLE reorder_options
ADD CHECK (price_usd > 0 AND quantity > 0);

ALTER TABLE reorder_options
ADD CHECK (price_usd/quantity > 0.02 AND price_usd/quantity < 25.00);

ALTER TABLE parts
ADD PRIMARY KEY (id);

ALTER TABLE reorder_options
ADD FOREIGN KEY  (part_id)
REFERENCES parts(id);

ALTER TABLE locations
ADD CHECK (qty > 0);

ALTER TABLE locations
ADD UNIQUE (part_id, location);

ALTER TABLE locations
ADD FOREIGN KEY (part_id)
REFERENCES parts(id);

ALTER TABLE parts
ADD FOREIGN KEY (manufacturer_id)
REFERENCES manufacturers (id);

INSERT INTO manufacturers (id, name)
VALUES (11, 'Pip-NNC Industrial');

SELECT * 
FROM manufacturers;

SELECT *
FROM parts
WHERE manufacturer_id IN (1, 2);

UPDATE parts
SET manufacturer_id = 11
WHERE manufacturer_id IN (1,2);

SELECT *
FROM parts
WHERE manufacturer_id = 11;