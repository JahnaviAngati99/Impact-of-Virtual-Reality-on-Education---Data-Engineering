--Data Analysis

SELECT SUM("VR_Hours_Science") AS Total_VR_Hours_Science,
       SUM("VR_Hours_Medicine") AS Total_VR_Hours_Medicine,
       SUM("VR_Hours_Engineering") AS Total_VR_Hours_Engineering,
       SUM("VR_Hours_Arts") AS Total_VR_Hours_Arts,
       SUM("VR_Hours_Business") AS Total_VR_Hours_Business
FROM vr_impact;

SELECT 
    SUM(CASE WHEN "Region_North America" = 1 THEN 1 ELSE 0 END) AS students_north_america,
    SUM(CASE WHEN "Region_Oceania" = 1 THEN 1 ELSE 0 END) AS students_oceania,
    SUM(CASE WHEN "Region_South America" = 1 THEN 1 ELSE 0 END) AS students_south_america,
    SUM(CASE WHEN "Region_Europe" = 1 THEN 1 ELSE 0 END) AS students_europe,
    SUM(CASE WHEN "Region_Asia" = 1 THEN 1 ELSE 0 END) AS students_asia
FROM vr_impact;

SELECT 
    AVG(CASE WHEN "Region_North America" = 1 THEN "Hours_of_VR_Usage_Per_Week" ELSE NULL END) AS avg_vr_usage_north_america,
    AVG(CASE WHEN "Region_Oceania" = 1 THEN "Hours_of_VR_Usage_Per_Week" ELSE NULL END) AS avg_vr_usage_oceania,
    AVG(CASE WHEN "Region_South America" = 1 THEN "Hours_of_VR_Usage_Per_Week" ELSE NULL END) AS avg_vr_usage_south_america,
    AVG(CASE WHEN "Region_Europe" = 1 THEN "Hours_of_VR_Usage_Per_Week" ELSE NULL END) AS avg_vr_usage_europe,
    AVG(CASE WHEN "Region_Asia" = 1 THEN "Hours_of_VR_Usage_Per_Week" ELSE NULL END) AS avg_vr_usage_asia
FROM vr_impact;


SELECT 
    SUM(CASE WHEN "Region_North America" = 1 THEN "Hours_of_VR_Usage_Per_Week" ELSE 0 END) AS total_vr_usage_north_america,
    SUM(CASE WHEN "Region_Oceania" = 1 THEN "Hours_of_VR_Usage_Per_Week" ELSE 0 END) AS total_vr_usage_oceania,
    SUM(CASE WHEN "Region_South America" = 1 THEN "Hours_of_VR_Usage_Per_Week" ELSE 0 END) AS total_vr_usage_south_america,
    SUM(CASE WHEN "Region_Europe" = 1 THEN "Hours_of_VR_Usage_Per_Week" ELSE 0 END) AS total_vr_usage_europe,
    SUM(CASE WHEN "Region_Asia" = 1 THEN "Hours_of_VR_Usage_Per_Week" ELSE 0 END) AS total_vr_usage_asia
FROM vr_impact;

--Data Validation

--Check for Null Values:
SELECT *
FROM vr_impact
WHERE "Student_ID" IS NULL
   OR "Age" IS NULL
   OR "Engagement_Level" IS NULL;

--Check for Invalid Age Values:
SELECT *
FROM vr_impact
WHERE "Age" < 10 OR "Age" > 80;

--Check for Negative VR Hours:
SELECT *
FROM vr_impact
WHERE "Hours_of_VR_Usage_Per_Week" < 0;

-- Update Negative VR Usage Hours to 0:
UPDATE vr_impact
SET "Hours_of_VR_Usage_Per_Week" = 0
WHERE "Hours_of_VR_Usage_Per_Week" < 0;



