-- PROMOTIONS AND CAREER PROGRESSION
-- 1. How long on average do employees stay in their most recent role before getting promoted?
SELECT 
	AverageYearsINRole = AVG(YearsInMostRecentRole)
FROM 
	EMPLOYEE 
WHERE 
	YearsSinceLastPromotion > 0;

-- 2. Average time between promotions across different job roles
SELECT 
	JobRole, 
	AverageYearsSincePromotion = AVG(YearsSinceLastPromotion) 
FROM 
	EMPLOYEE 
GROUP BY 
	JobRole;

-- 3. Is there correlation between performance ratings and promotion speed ?
SELECT PR.SelfRating, 
	AverageYearsSincePromotion = AVG(E.YearsSinceLastPromotion) 
FROM 
	PERFORMANCERATING PR
	JOIN EMPLOYEE E ON PR.EmployeeID = E.EmployeeID
GROUP BY 
	PR.SelfRating;

-- 4. Average years an employee spend with their current manager 
SELECT 
	AverageYearsWithManger = AVG(YearsWithCurrManager) 
FROM 
	EMPLOYEE;

-- 5. Which employees have been with the company the longest ?
SELECT
	EmployeeID,
	FirstName,
	LastName,
	Department,
	YearsAtCompany
FROM
	[dbo].[Employee]
WHERE
	YearsAtCompany = (SELECT MAX(YearsAtCompany) FROM [dbo].[Employee])

-- 6. Employees has the highest ratings ?
SELECT
	B.EmployeeID,
	FirstName,
	LastName,
	Department,
	A.ManagerRating
FROM
	[dbo].[PerformanceRating] a
	INNER JOIN [dbo].[Employee] B ON B.EmployeeID = A.EmployeeID
WHERE
	ManagerRating = (SELECT MAX(ManagerRating) FROM [dbo].[PerformanceRating])

-- 7. Total employees hired by years
SELECT 
    HireDate, 
    COUNT(EmployeeID) AS EmployeesHired,
    SUM(COUNT(EmployeeID)) OVER (ORDER BY HireDate) AS RunningTotal
FROM EMPLOYEE
GROUP BY HireDate;

