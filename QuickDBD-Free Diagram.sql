-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/016wpZ
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


SET XACT_ABORT ON

BEGIN TRANSACTION QUICKDBD

CREATE TABLE [EDUCATION_LEVEL] (
    [EducationLevelID] int  NOT NULL ,
    [EducationLevel] nvarchar(50)  NOT NULL ,
    CONSTRAINT [PK_EDUCATION_LEVEL] PRIMARY KEY CLUSTERED (
        [EducationLevelID] ASC
    )
)

CREATE TABLE [EMPLOYEE] (
    [EmployeeID] char(10)  NOT NULL ,
    [FirstName] nvarchar(50)  NOT NULL ,
    [LastName] nvarchar(50)  NOT NULL ,
    [Gender] varchar(6)  NOT NULL ,
    [Age] int  NOT NULL ,
    [BusinessTravel] nvarchar(50)  NOT NULL ,
    [Department] nvarchar(50)  NOT NULL ,
    [DistanceFromHome(KM)] int  NOT NULL ,
    [State] char(4)  NOT NULL ,
    [Ethnicity] nvarchar(50)  NOT NULL ,
    [Education] int  NOT NULL ,
    [EducationField] nvarchar(50)  NOT NULL ,
    [JobRole] nvarchar(50)  NOT NULL ,
    [MaritalStatus] char(10)  NOT NULL ,
    [Salary] int  NOT NULL ,
    [StockOptionLevel] bool  NOT NULL ,
    [OverTime] bool  NOT NULL ,
    [HireDate] date  NOT NULL ,
    [Attrition] bool  NOT NULL ,
    [YearsAtCompany] int  NOT NULL ,
    [YearsInMostRecentRole] int  NOT NULL ,
    [YearsSinceLastPromotion] int  NOT NULL ,
    [YearsWithCurrManager] int  NOT NULL ,
    CONSTRAINT [PK_EMPLOYEE] PRIMARY KEY CLUSTERED (
        [EmployeeID] ASC
    )
)

CREATE TABLE [PERFORMANCE_RATING] (
    [PerformanceID] char(10)  NOT NULL ,
    [EmployeeID] char(10)  NOT NULL ,
    [ReviewDate] date  NOT NULL ,
    [EnvironmentSatisfaction] int  NOT NULL ,
    [JobSatisfaction] int  NOT NULL ,
    [RelationshipSatisfaction] int  NOT NULL ,
    [TrainingOpportunitiesWithinYear] int  NOT NULL ,
    [TrainingOpportunitiesTaken] int  NOT NULL ,
    [WorkLifeBalance] int  NOT NULL ,
    [SelfRating] int  NOT NULL ,
    [ManagerRating] int  NOT NULL ,
    CONSTRAINT [PK_PERFORMANCE_RATING] PRIMARY KEY CLUSTERED (
        [PerformanceID] ASC
    )
)

CREATE TABLE [RATING_LEVEL] (
    [RatingID] int  NOT NULL ,
    [RatingLevel] nvarchar(50)  NOT NULL ,
    CONSTRAINT [PK_RATING_LEVEL] PRIMARY KEY CLUSTERED (
        [RatingID] ASC
    )
)

CREATE TABLE [SATISFIED_LEVEL] (
    [SatisfactionID] int  NOT NULL ,
    [SatisfactionLevel] nvarchar(50)  NOT NULL ,
    CONSTRAINT [PK_SATISFIED_LEVEL] PRIMARY KEY CLUSTERED (
        [SatisfactionID] ASC
    )
)

ALTER TABLE [EMPLOYEE] WITH CHECK ADD CONSTRAINT [FK_EMPLOYEE_EmployeeID] FOREIGN KEY([EmployeeID])
REFERENCES [PERFORMANCE_RATING] ([EmployeeID])

ALTER TABLE [EMPLOYEE] CHECK CONSTRAINT [FK_EMPLOYEE_EmployeeID]

ALTER TABLE [EMPLOYEE] WITH CHECK ADD CONSTRAINT [FK_EMPLOYEE_Education] FOREIGN KEY([Education])
REFERENCES [EDUCATION_LEVEL] ([EducationLevelID])

ALTER TABLE [EMPLOYEE] CHECK CONSTRAINT [FK_EMPLOYEE_Education]

ALTER TABLE [PERFORMANCE_RATING] WITH CHECK ADD CONSTRAINT [FK_PERFORMANCE_RATING_RelationshipSatisfaction] FOREIGN KEY([RelationshipSatisfaction])
REFERENCES [SATISFIED_LEVEL] ([SatisfactionID])

ALTER TABLE [PERFORMANCE_RATING] CHECK CONSTRAINT [FK_PERFORMANCE_RATING_RelationshipSatisfaction]

ALTER TABLE [PERFORMANCE_RATING] WITH CHECK ADD CONSTRAINT [FK_PERFORMANCE_RATING_ManagerRating] FOREIGN KEY([ManagerRating])
REFERENCES [RATING_LEVEL] ([RatingID])

ALTER TABLE [PERFORMANCE_RATING] CHECK CONSTRAINT [FK_PERFORMANCE_RATING_ManagerRating]

COMMIT TRANSACTION QUICKDBD