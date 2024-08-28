-- COMMAND --

SELECT 
    work_year AS year,
    company_location,
    AVG(remote_ratio) as average_remote
FROM 
    ds_salaries
GROUP BY 
    work_year,
    company_location
ORDER BY work_year,
			company_location;

-- COMMAND --

select work_year,
		AVG(salary_in_usd) as average_salary
from ds_salaries
Group by work_year
Order By work_year;

-- COMMAND --

select company_location,
		AVG(salary_in_usd) as average_salary,
		work_year
from ds_salaries
Group by company_location,
			work_year
Order by work_year,
		company_location

-- COMMAND -- 

With Employees	AS (
	SELECT 
        work_year,
        COUNT(*) AS total_employees,
        SUM(CASE 
                WHEN employee_residence = company_location THEN 1
                ELSE 0
            END) AS same_country_employees
    FROM 
        ds_salaries
	GROUP BY work_year
)
select * , 
		ROUND(same_country_employees * 1.0/total_employees*1.0,4)*100 as percent_in_country
from Employees;

-- COMMAND --

select experience_level, work_year, employee_residence, AVG(salary_in_usd) as average_salary, company_size
from ds_salaries
GROUP BY work_year, experience_level, employee_residence, company_size

-- COMMAND --

select work_year, 
	experience_level,
	company_location,
	Count(*) as number_of_roles
from ds_salaries
group by work_year, experience_level, company_location
ORDER BY work_year,company_location,number_of_roles;

-- COMMAND --

select work_year, 
	experience_level,
	company_location,
	Count(*) as number_of_roles
from ds_salaries
group by work_year, experience_level, company_location
ORDER BY work_year,company_location,number_of_roles;

-- COMMAND --