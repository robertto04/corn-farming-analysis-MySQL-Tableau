CREATE DATABASE IF NOT EXISTS CornData;
CREATE TABLE farmers(
     county VARCHAR(20) ,
     farmer VARCHAR(20) ,
     education VARCHAR(20) ,
     gender VARCHAR(15) ,
     age_bracket VARCHAR(15),
     household_size INT,
     crop VARCHAR(15) ,
     acreage DECIMAL(15,2),
     fertilizer DECIMAL(15,2),
     laborers INT,
     yield DECIMAL(20,2),
     power_source VARCHAR(20),
     water_source VARCHAR(10),
     main_credit_source VARCHAR(20),
     crop_insurance VARCHAR(10),
     farm_records VARCHAR(10),
     main_advosory_source VARCHAR(20),
     extension_provider VARCHAR(30),
     advisory_format VARCHAR(30),
     advisory_language VARCHAR(30),
	 latitude DECIMAL(15,2),
     longitude DECIMAL(15,2)
     );

-- Insert Rows
INSERT INTO farmers
VALUES (
        'TAITA TAVETA',	'fmr_65',	'Certificate',	'Male',	'36-45',	7,	'corn',	2,	50,	2,	300,	'Manual',	'Rain',	'Credit groups',	'No',	'Yes',	'Radio',	
        'Private Provider',	'Phone Calls',	'Vernacular', -3.46,	38.35),
        ('TAITA TAVETA', 'fmr_77', 'Certificate',	'Male',	'36-45',	7,	'corn',	0.25, 50,	2,	270, 'Manual',	'Rain',	'Credit groups',	'No',	'Yes',	'Radio',
        'County Government',	'SMS text',	'Kiswahili',	-3.31,	38.4);

-- 1.Yield Analysis:
-- What is the average yield per acre?
SELECT AVG(yield/acreage) AS avg_yield_per_acre
FROM farmers;

-- 2.Fertilizer Usage:
-- What is the average amount of fertilizer used per acre?
SELECT AVG(fertilizer/acreage) AS fertilizer_per_acre
FROM farmers;

-- 3.Farm Size:
-- Are larger farms more productive?
SELECT
    CASE
        WHEN acreage < 1 THEN 'Small'
        WHEN acreage >= 1 AND acreage < 4 THEN 'Medium'
        ELSE 'Large'
    END AS farm_size,
    AVG(yield) AS average_yield
FROM
    farmers
GROUP BY
    CASE
        WHEN acreage < 1 THEN 'Small'
        WHEN acreage >= 1 AND acreage < 4 THEN 'Medium'
        ELSE 'Large'
    END;

-- 4.Labor Analysis:
-- How does the number of laborers affect yield?
SELECT laborers, AVG(yield)
FROM farmers
GROUP BY laborers
ORDER BY AVG(yield) DESC;
