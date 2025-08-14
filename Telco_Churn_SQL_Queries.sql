/*
====================================================================================================
Exploratory Data Analysis (EDA) for Telco Customer Churn
====================================================================================================

This file contains the SQL queries used to explore the Telco Customer Churn dataset.
The analysis is broken down into several sections:
1.  Churned Customer Demographics
2.  Service Usage of Churned Customers
3.  Contract and Payment Analysis
4.  Tenure Analysis

Platform: Google BigQuery
Table: `rare-phoenix-446410-e1.Customer_Churn_Analysis.Churn_Data`

*/


-- ================================================================================================
-- 1. Churned Customer Demographics
-- ================================================================================================

-- Count of all churned customers by gender
-- Note: The original logic `gender = "Male" or "Female"` is incorrect; this is the correct way.
SELECT
    gender,
    COUNT(*) AS total_churned_customers
FROM
    `rare-phoenix-446410-e1.Customer_Churn_Analysis.Churn_Data`
WHERE
    churn = TRUE
GROUP BY
    gender;


-- Count of churned customers who were senior citizens
SELECT
    COUNT(*) AS churned_senior_citizens
FROM
    `rare-phoenix-446410-e1.Customer_Churn_Analysis.Churn_Data`
WHERE
    churn = TRUE
    AND SeniorCitizen = TRUE;


-- Count of churned customers who had a partner
SELECT
    COUNT(*) AS churned_customers_with_partner
FROM
    `rare-phoenix-446410-e1.Customer_Churn_Analysis.Churn_Data`
WHERE
    churn = TRUE
    AND Partner = TRUE;


-- Count of churned customers who had dependents
SELECT
    COUNT(*) AS churned_customers_with_dependents
FROM
    `rare-phoenix-446410-e1.Customer_Churn_Analysis.Churn_Data`
WHERE
    churn = TRUE
    AND Dependents = TRUE;


-- ================================================================================================
-- 2. Service Usage of Churned Customers
-- ================================================================================================

-- Internet service breakdown for all churned customers
SELECT
    InternetService,
    COUNT(*) AS number_of_customers
FROM
    `rare-phoenix-446410-e1.Customer_Churn_Analysis.Churn_Data`
WHERE
    Churn = TRUE
GROUP BY
    InternetService;


-- Internet service breakdown specifically for churned senior citizens
SELECT
    InternetService,
    COUNT(*) AS number_of_customers
FROM
    `rare-phoenix-446410-e1.Customer_Churn_Analysis.Churn_Data`
WHERE
    Churn = TRUE
    AND SeniorCitizen = TRUE
GROUP BY
    InternetService;


-- Count of churned customers who had phone service
SELECT
    COUNT(*) AS churns_with_phone_service
FROM
    `rare-phoenix-446410-e1.Customer_Churn_Analysis.Churn_Data`
WHERE
    churn = TRUE
    AND PhoneService = TRUE;


-- Breakdown of streaming service usage among churned customers who had a partner
-- Note: Corrected the CASE statement logic to correctly identify "Both" services.
SELECT
    CASE
        WHEN StreamingMovies = 'Yes' AND StreamingTV = 'Yes' THEN 'Both Streaming Services'
        WHEN StreamingMovies = 'Yes' OR StreamingTV = 'Yes' THEN 'At Least One Streaming Service'
        ELSE 'No Streaming Service'
    END AS streaming_package_type,
    COUNT(*) AS number_of_customers
FROM
    `rare-phoenix-446410-e1.Customer_Churn_Analysis.Churn_Data`
WHERE
    churn = TRUE
    AND Partner = TRUE
GROUP BY
    streaming_package_type;


-- ================================================================================================
-- 3. Contract and Payment Analysis
-- ================================================================================================

-- Payment methods preferred by customers who churned
-- Note: Corrected query to properly group by PaymentMethod
SELECT
    PaymentMethod,
    COUNT(*) AS number_of_customers
FROM
    `rare-phoenix-446410-e1.Customer_Churn_Analysis.Churn_Data`
WHERE
    churn = TRUE
GROUP BY
    PaymentMethod
ORDER BY
    number_of_customers DESC;


-- Check the top monthly charges for customers who did NOT churn (to see if high cost is a driver)
SELECT
    customerID,
    MonthlyCharges
FROM
    `rare-phoenix-446410-e1.Customer_Churn_Analysis.Churn_Data`
WHERE
    churn = FALSE
ORDER BY
    MonthlyCharges DESC;


-- Analysis of Paperless Billing's effect on churn and loyalty

-- Count of churned customers who used Paperless Billing
SELECT
    COUNT(*) AS churned_with_paperless_billing
FROM
    `rare-phoenix-446410-e1.Customer_Churn_Analysis.Churn_Data`
WHERE
    churn = TRUE
    AND PaperlessBilling = TRUE;


-- Count of long-term, loyal customers who did NOT use Paperless Billing
SELECT
    COUNT(*) AS loyal_customers_without_paperless
FROM
    `rare-phoenix-446410-e1.Customer_Churn_Analysis.Churn_Data`
WHERE
    churn = FALSE
    AND PaperlessBilling = FALSE
    AND tenure > 24;


-- ================================================================================================
-- 4. Tenure Analysis (Time with Company)
-- ================================================================================================

-- Find the minimum and maximum tenure for customers who churned
SELECT
    MIN(tenure) AS min_tenure_of_churners,
    MAX(tenure) AS max_tenure_of_churners
FROM
    `rare-phoenix-446410-e1.Customer_Churn_Analysis.Churn_Data`
WHERE
    churn = TRUE;


-- Categorize churned customers into tenure-based groups
SELECT
    CASE
        WHEN tenure BETWEEN 0 AND 6 THEN 'Short-Term (0-6 Months)'
        WHEN tenure BETWEEN 7 AND 24 THEN 'Mid-Term (7-24 Months)'
        ELSE 'Long-Term (>24 Months)'
    END AS tenure_group,
    COUNT(*) AS number_of_customers
FROM
    `rare-phoenix-446410-e1.Customer_Churn_Analysis.Churn_Data`
WHERE
    churn = TRUE
GROUP BY
    tenure_group
ORDER BY
    number_of_customers DESC;