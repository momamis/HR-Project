SELECT COUNT(*) FROM projects.hr;
SELECT * FROM projects.hr;
-- Finding the number of active employees by department.
SELECT department, COUNT(*) AS active_employees
FROM projects.hr
WHERE termdate IS NULL OR termdate >= CURDATE()
GROUP BY department
ORDER BY active_employees DESC;
-- 1. What is the gender breakdown of employees in the company?
SELECT gender, count(*) as count FROM projects.hr
WHERE termdate IS NULL OR termdate >= CURDATE()
GROUP BY gender;
-- 2. What is the race/ethnicity breakdown of employees in the company?
SELECT race, count(*) as count FROM projects.hr
WHERE termdate IS NULL OR termdate >= CURDATE()
group by race 
order by count 	DESC;
-- 3. What is the age distribution of the company?
SELECT MIN(age) as youngest, MAX(age) as oldest
FROM projects.hr
WHERE termdate IS NULL OR termdate >= CURDATE();
SELECT ROUND(AVG(age), 0) AS avg_age FROM projects.hr;

SELECT CASE
WHEN age >= 18 AND age <= 24 THEN '18-24'
WHEN age >= 25 AND age <=34 THEN '25-34'
WHEN age >= 35 AND age <=44 THEN '35-44'
WHEN age >= 45 and age <= 54 THEN '45-54'
WHEN age >= 55 and age <= 60 THEN '55-60'
ELSE '60+'
END AS age_group,
COUNT(*) AS count
FROM projects.hr
WHERE termdate IS NULL OR termdate >= CURDATE()
GROUP BY age_group
order by age_group;
SELECT CASE
WHEN age >= 18 AND age <= 24 THEN '18-24'
WHEN age >= 25 AND age <=34 THEN '25-34'
WHEN age >= 35 AND age <=44 THEN '35-44'
WHEN age >= 45 and age <= 54 THEN '45-54'
WHEN age >= 55 and age <= 60 THEN '55-60'
ELSE '60+'
END AS age_group, gender,
COUNT(*) AS count
FROM projects.hr
WHERE termdate IS NULL OR termdate >= CURDATE()
GROUP BY age_group, gender
order by age_group, gender;
-- 4. How many employees work at headquarters versus remote locations?
SELECT location, count(*) as count
FROM projects.hr
WHERE termdate IS NULL OR termdate >= CURDATE()
GROUP BY location;
-- 5. What is the average length of employment for those employees who have been terminated?
SELECT 
ROUND(AVG(DATEDIFF(termdate, hire_date))/365, 0) as avg_length_employment
FROM projects.hr
WHERE termdate <= CURDATE() AND termdate IS NOT NULL;
-- 6. How does the gender variation vary across departments and job titles?
SELECT department, gender, COUNT(*) AS count
FROM projects.hr
WHERE termdate is NULL OR termdate >= CURDATE()
GROUP BY department, gender
ORDER BY department;
-- 7. What is the distribution of job titles across the company?
SELECT jobtitle, COUNT(*) AS count
FROM projects.hr
WHERE termdate is NULL OR termdate >= CURDATE()
GROUP BY jobtitle
ORDER BY jobtitle DESC;
-- 8. Which department has the highest turnover rate?
SELECT department, terminated_count, total_count, terminated_count/total_count AS termination_rate
FROM (
SELECT department, COUNT(*) AS total_count,
SUM(CASE WHEN termdate IS NOT NULL AND termdate <= CURDATE() THEN TRUE ELSE FALSE END) AS terminated_count
FROM projects.hr
GROUP BY department
) AS subquery
ORDER BY termination_rate DESC;
--- Finding the department with the highest turnover rate:
SELECT department, terminated_count, total_count, terminated_count/total_count AS termination_rate
FROM (
SELECT department, COUNT(*) AS total_count,
SUM(CASE WHEN termdate IS NOT NULL AND termdate <= CURDATE() THEN TRUE ELSE FALSE END) AS terminated_count
FROM projects.hr
GROUP BY department
) AS subquery
ORDER BY termination_rate DESC
LIMIT 1;
-- 9. What is the distribution of employees across locations by city and state?
SELECT COUNT(emp_id) as count, location_state 
FROM projects.hr
WHERE termdate is NULL OR termdate >= CURDATE()
GROUP BY location_state
ORDER BY count DESC; 
-- 10. How has the company's employee count changed over time based on hire and term dates?
SELECT
year,
hires,
terminations,
hires - terminations AS net_change,
ROUND((hires - terminations)/hires * 100, 2) AS net_change_percent
FROM (
	SELECT
	YEAR(hire_date) AS year,
    COUNT(*) AS hires,
    SUM(CASE WHEN termdate IS NOT NULL AND termdate <= CURDATE() THEN 1 ELSE 0 END) AS terminations
    FROM projects.hr
    GROUP BY year) as subquery
    ORDER BY year;
    -- 11. What is the tenure distribution for each department?
SELECT 
department, ROUND(AVG(DATEDIFF(termdate, hire_date)/365), 0) AS avg_tenure 
FROM projects.hr
WHERE termdate <= curdate() AND termdate IS NOT NULL 
GROUP BY department
ORDER BY avg_tenure;
-- 12. Finding the department with the lowest hiring rate.

SELECT department, COUNT(*) as hires
FROM projects.hr
GROUP BY department
ORDER by hires asc;







