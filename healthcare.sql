CREATE DATABASE health_data;

use health_data;

CREATE TABLE ocd_patients (
    PatientID INT PRIMARY KEY,
    Age INT,
    Gender VARCHAR(10),
    Ethnicity VARCHAR(50),
    MaritalStatus VARCHAR(20),
    EducationLevel VARCHAR(50),
    OCDDiagnosisDate DATE,
    DurationOfSymptomsMonths INT,
    PreviousDiagnoses VARCHAR(100),
    FamilyHistoryOfOCD VARCHAR(5),
    ObsessionType VARCHAR(50),
    CompulsionType VARCHAR(50),
    YBOCSScoreObsessions INT,
    YBOCSScoreCompulsions INT,
    DepressionDiagnosis VARCHAR(5),
    AnxietyDiagnosis VARCHAR(5),
    Medications VARCHAR(50)
);


---------------------------------------------------------------------------------------------------------------------------------------

-- Health Data Analysis

-- Question 1 - COUNT ANA PERCENTAGE OF FEMALE AND MALE THAT HAVE OCD AND AVERAGE OBSESSION SCORE BY GENDER

SELECT 
	Gender,
    COUNT(*) AS patients,
    ROUND(100.0 * COUNT(*) / (SELECT COUNT(*) FROM ocd_patients), 2) AS Percentage,
    AVG(YBOCSScoreObsessions) AS Average_obsession
FROM ocd_patients
GROUP BY gender
order by 2;

-- QUESTION 2 - COUNT OF PATIENTS BY ETHNICITY AND THEIR RESPECTIVE AVERAGE OBSESSION SCORE

SELECT 
	Ethnicity,
	COUNT('Patient ID') AS patient_count,
    AVG(YBOCSScoreObsessions) AS Average_obsession
FROM ocd_patients
GROUP BY Ethnicity
ORDER BY patient_count;

-- QUESTION 3 - NUMBER OF PEOPLE DIAGNOSIS WITH OCD MOM

-- ALTER TABLE ocd_patients
-- modify `OCDDiagnosisDate` Date;


SELECT
    DATE_FORMAT(`OCDDiagnosisDate`, '%Y-%m-01 00-00-00') AS Month,
    -- `OCDDiagnosisDate`
    COUNT(*) AS PatientCount
FROM
    ocd_patients
GROUP BY
    1
ORDER BY
	1;

-- QUESTION 4 - WHAT IS THE MOST OBSESSION TYPE (COUNT) AND IT'S AVERAGE OBSESSION TYPE

SELECT 
	ObsessionType,
    COUNT(*) AS Patient_count,
    AVG(YBOCSScoreObsessions) AS Average_obsession
FROM ocd_patients
GROUP BY ObsessionType
ORDER BY Patient_count desc;


-- QUESTION 5 - WHAT IS THE MOST COMPULSION TYPE (COUNT) AND ITS RESPECTIVE AVERAGE OBSESSION SCORE

SELECT 
	CompulsionType,
    COUNT(*) AS Patient_count, 
    AVG(YBOCSScoreObsessions) AS Average_obsession
FROM ocd_patients
GROUP BY CompulsionType
ORDER BY Patient_count desc;




