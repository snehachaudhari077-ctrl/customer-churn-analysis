# Customer Churn Analysis | SQL + Power BI Project

## Project Overview

This project focuses on analyzing customer churn data using SQL and Power BI to uncover patterns in customer behavior and identify key factors driving customer attrition.
The analysis combines data querying, aggregation, and visualization to generate actionable insights that can help businesses improve customer retention and reduce churn.

## Tools & Technologies

* SQL (MySQL) – Data extraction, validation, and analysis
* Power BI – Data visualization and dashboard creation
* Power Query – Data cleaning and transformation

## Dataset Description

The dataset contains customer-level information including:

* Customer ID
* Gender
* Tenure
* Contract Type
* Payment Method
* Monthly Charges
* Internet Services
* Churn Status

## Data Preparation & Modeling

* Cleaned and transformed data using Power Query

* Handled categorical inconsistencies

* Created derived columns (service flags)

* Designed a **Star Schema Data Model**:

  - Fact Table: `churn_data`
  - Dimension Tables: `dim_customers`, `dim_services`, `dim_billing`, `dim_contract`

* Established one-to-many relationships using `customerID`

## SQL Analysis & Queries

SQL was used to perform data validation, aggregation, and exploratory analysis before building the dashboard.

### Data Validation

* Verified total number of records
* Checked for duplicate `customerID` values to ensure data integrity

### Key SQL Operations

* **Aggregation:** `COUNT()`, `AVG()`
* **Filtering & Conditions:** `CASE WHEN`
* **Grouping:** `GROUP BY`
* **Sorting:** `ORDER BY`

### Key Analysis Performed

* Total customers and churn distribution
* Churn rate calculation (%)
* Churn by contract type
* Average monthly charges by churn
* Average tenure by churn
* Churn by payment method
* Churn by internet service type
* Churn comparison between senior and non-senior customers

### Sample Query (Churn Rate Calculation)

```sql
SELECT
  COUNT(*) AS total_customers,
  SUM(Churn = 'Yes') AS churned,
  ROUND(SUM(Churn = 'Yes') / COUNT(*) * 100, 2) AS churn_rate_pct
FROM churn_data;
```


## Dashboard Preview
![Power BI Dashboard](visuals/powerbi_dashboard.png)

## Dashboard Features
### KPI Cards

* Total Customer Base
* Customers Churned
* Churn Rate (%)

### Visual Analysis

* Customer distribution by churn
* Churn by contract type
* Churn by payment method
* Monthly charges vs churn

### Interactive Features

* Slicers for filtering (Gender)
* Dynamic visual updates

## Key Insights

### From SQL Analysis

* Customers with month-to-month contracts show the highest churn, while long-term contracts improve retention.
* **Senior citizens(39.27 %)** are more likely to churn compared to non-senior customers.
* **Fiber optic users** have higher churn rates, indicating possible dissatisfaction or pricing concerns.
* Customers using electronic check payment methods exhibit the highest churn, whereas automatic payment methods reduce churn.

### From Dashboard
 
* **Month-to-month contracts** have the highest churn.
* **Electronic check users** show higher churn tendenc.ies
* Customers with **lower tenure** are more likely to leave.

## Data Model (Star Schema)

The project follows a star schema approach for better performance and clarity:

* Fact Table: Stores churn metrics
* Dimension Tables: Store descriptive attributes
* Relationships: One-to-many using `customerID`

## Project Structure

* dataset/ → churn_data.csv  
* sql_queries/ → churn_analysis.sql  
* visuals/ → powerbi_dashboard.png  
* README.md → project documentation  

## Conclusion

This project demonstrates how combining SQL analysis with Power BI visualization can effectively identify key drivers of customer churn.
By understanding patterns in customer behavior, businesses can take targeted actions to improve retention and enhance customer satisfaction.

## Possible Solutions
- Encourage long-term contracts to reduce churn rate
- Offer discounts for auto-pay as this segment shows most loyal customers.
- Improve fiber service experience to reduce churn rate.
- Target senior customers with support/benefits to reduce their likelihood of churning.


## Future Improvements

* Build a predictive churn model using Machine Learning
* Add advanced Power BI features (drill-through, tooltips)
* Deploy the dashboard online for real-time access
 

## Author

Sneha Chaudhari  
Aspiring Data Analyst | MMS (IT) Student  

- Interested in data analytics, business insights, and problem-solving  
- Actively building projects in SQL, Power BI, and Python 
