#1. remove duplicates
#2. standardize data
#3. Null or Blank
#4. remove any col for that staging db best practice

#Create a staging db best practice
create table layoffs_staging
like layoffs;

select *
from layoffs_staging;

insert into layoffs_staging
select *
from layoffs;