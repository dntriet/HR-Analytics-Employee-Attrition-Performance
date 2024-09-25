-- SALARY INSIGHTS
-- 1. Average salary by job role
SELECT
	JobRole,
	AverageSalary = AVG(Salary)
FROM
	[dbo].[Employee]
GROUP BY
	JobRole
ORDER BY 2 DESC;

-- 2. Is there a correlation between education level and salary
SELECT 
	EducationLevel,
	AverageSalary = AVG(Salary)
FROM
	[dbo].[Employee] A
	INNER JOIN [dbo].[EducationLevel] B ON A.Education = B.EducationLevelID
GROUP BY
	EducationLevel
ORDER BY
	2 DESC;

-- 3. Salary distribution across different marital statuses
SELECT
	MaritalStatus,
	AverageSalary = AVG(Salary)
FROM
	[dbo].[Employee]
GROUP BY
	MaritalStatus
ORDER BY 
	2 DESC;

-- 4. Percentage employees receive stock options
DECLARE 
	@v_percentage FLOAT;
SELECT 
	@v_percentage = 
	(SUM(CASE WHEN StockOptionLevel = 1 THEN 1 ELSE 0 END) * 1.0 / COUNT(*)) * 100
FROM EMPLOYEE
PRINT
	'Percentage stock options: ' + CAST(@v_percentage AS CHAR);

-- 5. Top 3 employees have highest salary each department
SELECT *
FROM (
   	SELECT 
        EmployeeID, 
        FirstName, 
        LastName, 
        Department, 
        Salary, 
        [Rank] = DENSE_RANK() OVER (PARTITION BY Department ORDER BY Salary DESC)
    FROM EMPLOYEE
) AS RankedEmployees
WHERE Rank <= 3;

-- 6. Average performance rating of employees within more 5 years

SELECT AVG(ManagerRating) AS AvgManagerRating
FROM PERFORMANCERATING 
WHERE EmployeeID IN (
    SELECT EmployeeID 
    FROM EMPLOYEE 
    WHERE YearsAtCompany > 5
);
