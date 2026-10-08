SELECT*
FROM employee_demographics;


SELECT gender,AVG(age), Max(age), MIN(age),COUNT(age)
FROM employee_demographics
GROUP BY gender
;


SELECT Occupation, salary
FROM employee_salary
GROUP BY Occupation, salary
;

-- ORDER BY
SELECT*
FROM employee_demographics 
ORDER BY age, gender
;






