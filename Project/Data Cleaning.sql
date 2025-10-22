#1. remove duplicates
#2. standardize data
#3. Null or Blank
#4. remove any col for that staging db best practice

#Create a staging db best practice
create table layoffs_staging
like layoffs;

insert into layoffs_staging
select *
from layoffs;

with dup_cte as
(select * ,
row_number() over(partition by 
company , location , industry , total_laid_off , percentage_laid_off , `date` , stage,country , funds_raised_millions) as row_num
from layoffs_staging
)
select *
from dup_cte
where row_num > 1
;


CREATE TABLE `layoffs_staging2` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL,
  `row_num` INT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

insert into layoffs_staging2
select * ,
row_number() over(partition by 
company , location , industry , total_laid_off , percentage_laid_off , `date` , stage,country , funds_raised_millions) as row_num
from layoffs_staging;

SET SQL_SAFE_UPDATES = 0;

DELETE FROM layoffs_staging2
WHERE row_num > 1;

SET SQL_SAFE_UPDATES = 1;

select *
from layoffs_staging2;







