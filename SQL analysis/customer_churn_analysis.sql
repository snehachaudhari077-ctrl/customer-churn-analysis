CREATE DATABASE IF NOT EXISTS churn_analysis;
USE churn_analysis;
CREATE TABLE IF NOT EXISTS churn_data (
  customerID        VARCHAR(20)    NOT NULL PRIMARY KEY,
  gender            VARCHAR(10),
  SeniorCitizen     TINYINT(1),
  Partner           VARCHAR(5),
  Dependents        VARCHAR(5),
  tenure            INT,
  PhoneService      VARCHAR(5),
  MultipleLines     VARCHAR(25),
  InternetService   VARCHAR(20),
  OnlineSecurity    VARCHAR(25),
  OnlineBackup      VARCHAR(25),
  DeviceProtection  VARCHAR(25),
  TechSupport       VARCHAR(25),
  StreamingTV       VARCHAR(25),
  StreamingMovies   VARCHAR(25),
  Contract          VARCHAR(20),
  PaperlessBilling  VARCHAR(5),
  PaymentMethod     VARCHAR(35),
  MonthlyCharges    DECIMAL(10,2),
  TotalCharges      DECIMAL(10,2),
  Churn             VARCHAR(5)
);
-- Check 1: Total row count (must be exactly 1000)
SELECT COUNT(*) AS total_rows
FROM churn_data;

-- Check 2: Check for duplicate customerIDs (must return 0 rows)
SELECT customerID, COUNT(*) AS cnt
FROM churn_data
GROUP BY customerID
HAVING cnt > 1;
SELECT Churn, COUNT(*) AS total_customers
FROM churn_data
GROUP BY Churn;
SELECT
  COUNT(*) AS total_customers,
  SUM(Churn = 'Yes') AS churned,
  ROUND(SUM(Churn = 'Yes') / COUNT(*) * 100, 2) AS churn_rate_pct
FROM churn_data;
SELECT Contract, Churn, COUNT(*) AS total_customers
FROM churn_data
GROUP BY Contract, Churn
ORDER BY Contract;
SELECT Churn, ROUND(AVG(MonthlyCharges), 2) AS avg_monthly_charge
FROM churn_data
GROUP BY Churn;
SELECT Churn, ROUND(AVG(tenure), 2) AS avg_tenure_months
FROM churn_data
GROUP BY Churn;
SELECT PaymentMethod, Churn, COUNT(*) AS total_customers
FROM churn_data
GROUP BY PaymentMethod, Churn
ORDER BY PaymentMethod;
SELECT InternetService, Churn, COUNT(*) AS total_customers
FROM churn_data
GROUP BY InternetService, Churn
ORDER BY InternetService;
SELECT
  CASE WHEN SeniorCitizen = 1 THEN 'Senior' ELSE 'Non-Senior' END AS customer_type,
  Churn,
  COUNT(*) AS total_customers
FROM churn_data
GROUP BY SeniorCitizen, Churn
ORDER BY SeniorCitizen;

