
USE GENZ;
GO

-- Basic Data Inspection

SELECT COUNT(*) AS Total_Records
FROM dbo.Responses;

SELECT TOP 10 *
FROM dbo.Responses;


-- Q1: Most Preferred Career Tracks in India

SELECT
    career_track_primary,
    COUNT(DISTINCT respondent_id) AS Total_Respondents
FROM dbo.CS2
WHERE country = 'India'
AND career_track_primary IS NOT NULL
GROUP BY career_track_primary
ORDER BY Total_Respondents DESC;


-- Q2: Factors Influencing Career Choices

SELECT
    Career_Factor,
    COUNT(DISTINCT respondent_id) AS Total_Respondents
FROM
(
    SELECT respondent_id, evp_rank_1 AS Career_Factor
    FROM dbo.CS2
    WHERE country = 'India'

    UNION ALL

    SELECT respondent_id, evp_rank_2
    FROM dbo.CS2
    WHERE country = 'India'

    UNION ALL

    SELECT respondent_id, evp_rank_3
    FROM dbo.CS2
    WHERE country = 'India'
) AS CareerFactors
WHERE Career_Factor IS NOT NULL
GROUP BY Career_Factor
ORDER BY Total_Respondents DESC;


-- Q3: Preferred Workplace Environment

SELECT
    office_days_pref,
    COUNT(*) AS Total_Respondents
FROM dbo.CS2
WHERE country = 'India'
AND office_days_pref IS NOT NULL
GROUP BY office_days_pref
ORDER BY Total_Respondents DESC;


-- Q4: Salary Expectations

SELECT
    ROUND(AVG(CAST(start_salary_monthly_local AS FLOAT)), 2)
        AS Average_Starting_Salary,
    ROUND(AVG(CAST(salary_5yr_monthly_local AS FLOAT)), 2)
        AS Average_Expected_Salary
FROM dbo.CS2
WHERE country = 'India'
AND start_salary_monthly_local IS NOT NULL
AND salary_5yr_monthly_local IS NOT NULL;


-- Q5: Preferred Employee Benefits

SELECT
    top_benefit,
    COUNT(*) AS Total_Respondents
FROM dbo.CS2
WHERE country = 'India'
AND top_benefit IS NOT NULL
GROUP BY top_benefit
ORDER BY Total_Respondents DESC;


-- Q6: Importance of Values Alignment

SELECT
    values_alignment_importance,
    COUNT(*) AS Total_Respondents
FROM dbo.CS2
WHERE country = 'India'
AND values_alignment_importance IS NOT NULL
GROUP BY values_alignment_importance
ORDER BY Total_Respondents DESC;


-- Q7: Rejecting Jobs Due to Misaligned Values

SELECT
    decline_if_values_misaligned,
    COUNT(*) AS Total_Respondents
FROM dbo.CS2
WHERE country = 'India'
AND decline_if_values_misaligned IS NOT NULL
GROUP BY decline_if_values_misaligned
ORDER BY Total_Respondents DESC;


-- Q8: Purpose Versus Pay

SELECT
    tradeoff_purpose_pay,
    COUNT(*) AS Total_Respondents
FROM dbo.CS2
WHERE country = 'India'
AND tradeoff_purpose_pay IS NOT NULL
GROUP BY tradeoff_purpose_pay
ORDER BY Total_Respondents DESC;
