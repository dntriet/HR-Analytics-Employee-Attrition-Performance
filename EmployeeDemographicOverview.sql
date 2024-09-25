-- EMPLOYEE DEMOGRAPHIC AND OVERVIEW
-- 1. How many employees ?
DECLARE 
	@v_totalemployees INT;
SELECT
	@v_totalemployees = COUNT([EmployeeID]) FROM [dbo].[Employee]
PRINT
	'Total employees: ' + CAST(@v_totalemployees AS VARCHAR(20))

-- 2. Gender distribution 
SELECT
	Gender,
	Total = COUNT(*)
FROM
	[dbo].[Employee]
GROUP BY
	Gender
ORDER BY
	2 DESC;

-- 3. Average ages across different departments & Number of employees each department
SELECT
	AverageAge = AVG(Age),
	TotalEmp = COUNT(*),
	Department
FROM
	Employee
GROUP BY
	Department

-- 4. The most common education level among employees 
SELECT
	Quantities = COUNT(*),
	Education
FROM
	Employee
GROUP BY
	Education
ORDER BY 2