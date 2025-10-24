#Exploratory Data Analysis
select *
from layoffs_staging2;

#Max total laid off and percentage laid off
select max(total_laid_off) , max(percentage_laid_off)
from layoffs_staging2;

#percentage laid off 1 means - company was boooooom done and dusted
select *
from layoffs_staging2
where percentage_laid_off = 1;
#Checked on google and these companys are no more 

#Max laid off and funds raised by a company 
select company , max(total_laid_off) as max_laid_off , max(funds_raised_millions) as max_funds
from layoffs_staging2
where percentage_laid_off = 1
group by company
order by 3 desc
;


#Sum total laid by company
select company , sum(total_laid_off) as sum_laid_off
from layoffs_staging2
group by company
order by 2 desc
;

#date range to see the time Frame/Range
select min(`date`) as start_date , max(`date`) as end_date
from layoffs_staging2;

#Total laid off by Industry
select industry , sum(total_laid_off) as sum_laid_off
from layoffs_staging2
group by industry
order by 2 desc
;

#Total laid off by Country
select country , sum(total_laid_off) as sum_laid_off
from layoffs_staging2
group by country
order by 2 desc
;

#Total laid off by Year
select year(`date`) , sum(total_laid_off) as sum_laid_off
from layoffs_staging2
group by year(`date`)
order by 2 desc
;

#Total laid off by Stage
select stage , sum(total_laid_off) as sum_laid_off
from layoffs_staging2
group by stage
order by 2 desc
;


#Rolling total by month
with rolling_total as
(
select substring(`date`,1,7) as `month` , sum(total_laid_off) as total_off
from layoffs_staging2
where substring(`date`,1,7) is not null
group by `month`
order by 1 asc
)
select `month` , total_off ,
sum(total_off) over(order by `month`) as rolling_total
from rolling_total
;


#Rank by year company total laid off

with company_year (company , years , total_laid_off) as
(
select company , year(`date`) , sum(total_laid_off)
from layoffs_staging2
group by company , year(`date`)
)
select * , 
dense_rank() over(partition by years order by total_laid_off desc) as ranking
from company_year
where years is not null
order by ranking
;


#Top 5
with company_year (company , years , total_laid_off) as
(
select company , year(`date`) , sum(total_laid_off)
from layoffs_staging2
group by company , year(`date`)
) , company_ranking_year as
(select * , 
dense_rank() over(partition by years order by total_laid_off desc) as ranking
from company_year
where years is not null
)
select *
from company_ranking_year
where ranking <= 5
;






