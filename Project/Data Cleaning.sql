#1. Remove duplicates
#2. Standardize data
#3. Null or Blank
#4. Remove any col for that staging db best practice

#Create a staging db best practice
create table layoffs_staging
like layoffs2;

insert into layoffs_staging
select *
from layoffs2;

select *
from layoffs_staging;

#This is irrelevant because i removed duplicates using excel but here is how to remove in SQL
with cte_dup as
(
select * ,
row_number() over(partition by 
company , location , industry , total_laid_off , percentage_laid_off , `date` , stage,country , funds_raised_millions) as row_num
from layoffs_staging
)
select *
from cte_dup
;


CREATE TABLE `layoffs_staging2` (
`company` text,
`location`text,
`industry`text,
`total_laid_off` INT,
`percentage_laid_off` text,
`date` text,
`stage`text,
`country` text,
`funds_raised_millions` int,
row_num INT
);

INSERT INTO `layoffs_staging2`
(`company`,
`location`,
`industry`,
`total_laid_off`,
`percentage_laid_off`,
`date`,
`stage`,
`country`,
`funds_raised_millions`,
`row_num`)
SELECT `company`,
`location`,
`industry`,
`total_laid_off`,
`percentage_laid_off`,
`date`,
`stage`,
`country`,
`funds_raised_millions`,
		ROW_NUMBER() OVER (
			PARTITION BY company, location, industry, total_laid_off,percentage_laid_off,`date`, stage, country, funds_raised_millions
			) AS row_num
	FROM 
		layoffs_staging;

DELETE FROM layoffs_staging2
WHERE row_num >= 2;

select *
from layoffs_staging2
where row_num >= 2;

#Standardizing data
#1.trim company coloumn
select company , trim(company)
from layoffs_staging2;

update layoffs_staging2
set company = trim(company);

select company
from layoffs_staging2;

#2.Industry Coloumn Fix
select distinct industry
from layoffs_staging
order by 1;

select *
from layoffs_staging2
where industry like 'Crypto%';

update layoffs_staging2
set industry = "Crypto"
where industry like 'Crypto%';

select *
from layoffs_staging2
where industry like 'Crypto%';

#3.Country col fix
select distinct country
from layoffs_staging2
order by 1;

update layoffs_staging2
set country = 'United States'
where country like 'United States%';

select distinct country
from layoffs_staging2
order by 1;

#4.Date format fix
ALTER TABLE layoffs_staging2
ADD COLUMN layoff_date DATE;

UPDATE layoffs_staging2
SET layoff_date = STR_TO_DATE(`date`, '%m/%d/%Y')
WHERE `date` LIKE '%/%';

UPDATE layoffs_staging2
SET layoff_date = STR_TO_DATE(`date`, '%d-%m-%Y')
WHERE `date` LIKE '%-%' AND layoff_date IS NULL;

update layoffs_staging2
set `date` = layoff_date;

alter table layoffs_staging2
drop column layoff_date;

alter table layoffs_staging2
modify column `date` DATE;

#5.Fix Nulls 
#Industry
select *
from layoffs_staging2
where company = "Airbnb";

update layoffs_staging2
set industry = null
where industry = '';

select st1.company , st1.industry , st2.company , st2.industry
from layoffs_staging2 st1
join layoffs_staging2 st2
	on st1.company = st2.company
where (st1.industry is null or st1.industry = '')
and st2.industry is not null;

update layoffs_staging2 st1
join layoffs_staging2 st2
	on st1.company = st2.company
set st1.industry = st2.industry
where st1.industry is null
and st2.industry is not null;

select *
from layoffs_staging2;

#4.Removing data - not confident but this data is not worth saving 
select *
from layoffs_staging2
where total_laid_off is null
and percentage_laid_off is null;

delete
from layoffs_staging2
where total_laid_off is null
and percentage_laid_off is null;

select *
from layoffs_staging2;

alter table layoffs_staging2
drop column row_num;









