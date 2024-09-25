-- ATTRITION ANALYSIS
-- 1. Attrition rate by department
SELECT 
	Department, 
	AttritionRate = (SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END) * 1.0 / COUNT(*)) * 100
FROM 
	EMPLOYEE 
GROUP BY 
	Department;

-- 2. Compare average tenure (YearsAtCompany) for employees who leave the company (Attrtion = 1) and for employees who don't leave the company
DECLARE
	@v_avgtenure1 FLOAT,
	@v_avgtenure2 FLOAT;
SELECT
	@v_avgtenure1 = AVG(YearsAtCompany) FROM [dbo].[Employee] WHERE Attrition = 1;
SELECT
	@v_avgtenure2 = AVG(YearsAtCompany) from [dbo].[Employee] WHERE Attrition = 0;
PRINT
	'Average years at company for who leave the company: ' + CAST(@v_avgtenure1 AS CHAR)
PRINT
	'Average years at company for who do not leave the company: ' + CAST(@v_avgtenure2 AS CHAR)

-- 3. Does distance from home effect attrition ?
SELECT 
	AVG([DistanceFromHome_KM]) AS AvgDistance,
	Attrition 
FROM 
	EMPLOYEE 
GROUP BY 
	Attrition;

-- 4. Which job roles experience the highest attrition rates?
SELECT 
	JobRole, 
	AttritionRate = ROUND((SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END) * 1.0 / COUNT(*)) * 100, 2)
FROM 
	EMPLOYEE
GROUP BY 
	JobRole;

-- 5. Relationships between overtime and attrition ?
SELECT 
	OverTime, 
	AttritionRate = ROUND((SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END) * 1.0 / COUNT(*)) * 100, 2)
FROM 
	EMPLOYEE 
GROUP BY 
	OverTime;

