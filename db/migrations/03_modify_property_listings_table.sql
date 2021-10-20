-- changed the number of digits the price column can go to
ALTER TABLE property_listings ALTER COLUMN price TYPE DECIMAL(5,2);