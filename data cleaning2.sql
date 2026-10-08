-- Data Cleaning

SELECT *
FROM layoffs;


-- 1.Remove duplicate
-- 2. Standrdize the data
-- 3.Null values or blank values
-- 4 Remove any columns

CREATE TABLE layoffs_staging
LIKE layoffs;

SELECT *,
ROW_NUMBER() OVER (PARTITION BY company, industry, total_laid_off, percentage_laid_off ,'date') AS row_num
FROM layoffs_staging;

WITH duplicate_cte AS
(
SELECT *,
ROW_NUMBER() OVER
 (PARTITION BY company, location, industry, total_laid_off, 
 percentage_laid_off ,'date', stage, country, funds_raised_millions) 
 AS row_num
FROM layoffs_staging
)

DELETE
FROM duplicate_cte
WHERE row_num > 1;


SELECT *
FROM layoffs_staging
WHERE company ='Casper';


SELECT*
FROM layoffs_staging2
WHERE row_num> 1;

INSERT INTO layoffs_staging2
SELECT *,
ROW_NUMBER() OVER 
(PARTITION BY company, location, industry, total_laid_off,
 percentage_laid_off ,'date', stage, country, funds_raised_millions)
 AS row_num
FROM layoffs_staging;



DELETE
FROM layoffs_staging2
WHERE row_num> 1;

SELECT*
FROM layoffs_staging2


-- Standardizing data

SELECT company,TRIM(company)
FROM layoffs_staging2
