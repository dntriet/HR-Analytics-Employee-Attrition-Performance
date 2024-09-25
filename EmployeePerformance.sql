-- EMPLOYEE PERFORMANCE
-- 1. Average job satisfaction score each department
SELECT
	Department,
	AvgJobSatisfy = AVG(JobSatisfaction)
FROM
	Employee A
	INNER JOIN PerformanceRating B ON A.EmployeeID = B.EmployeeID
GROUP BY
	Department

-- 2. Correlation between work-life balance and job satisfaction
SELECT
	RatingLevel,
	AverageJobSatisfaction = AVG(JobSatisfaction)
FROM
	PerformanceRating A
	INNER JOIN RatingLevel B ON A.WorkLifeBalance = B.RatingID
GROUP BY
	RatingLevel;

-- 3. How does manager rating effect employee attrition ?

SELECT
	Attrition,
	AverageManagerRating = AVG(ManagerRating),
	CountManagerRating = COUNT(*)
FROM
	EMPLOYEE A
	INNER JOIN PERFORMANCERATING B ON A.EmployeeID = B.EmployeeID
GROUP BY
	Attrition;

-- 4. Which satisfaction area (environment, job, relationship) is rated the highest on average?
SELECT 
	AVG(EnvironmentSatisfaction) AS AvgEnvSatisfaction,
	AVG(JobSatisfaction) AS AvgJobSatisfaction,
	AVG(RelationshipSatisfaction) AS AvgRelSatisfaction
FROM 
	PERFORMANCERATING;

-- 5. What percentage of employees take advantage of training opportunities?
DECLARE
	@v_trainingutilization FLOAT;
SELECT
	@v_trainingutilization = SUM(TrainingOpportunitiesTaken) * 1.0 / SUM(TrainingOpportunitiesWithinYear) * 100 
FROM PERFORMANCERATING;

PRINT
	'Training Utilizaton: ' + CAST(@v_trainingutilization AS CHAR)
