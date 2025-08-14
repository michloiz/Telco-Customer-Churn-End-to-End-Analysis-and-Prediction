# Telco-Customer-Churn-End-to-End-Analysis-and-Prediction
This work explores trends  and predicts customer churn using logistic regression. SQL was used for data exploration along with  PowerBI and DAX for dashboard generation. Finally, churn prediction was implemented in Python using the Pandas, Scikit-learn, Matplotlib libraries.

# Project Overview
This project provides a comprehensive analysis of telco customer churn. The goal is to identify the key factors that lead to customers leaving and to build a predictive model that can identify at-risk customers. The workflow begins with data exploration and pipeline creation using SQL, followed by the development of an interactive Power BI dashboard for visualizing key metrics. Finally, a machine learning model is built in Python to predict churn with high accuracy.

# Tech Stack
- Data Analysis & Pipelining: SQL
- Data Visualization & Reporting: Power BI, DAX
- Machine Learning & Modeling: Python
- Core Python Libraries: Pandas, Scikit-learn, Matplotlib

# Project Structure
data/: Contains the raw .csv dataset.
sql_eda/: Includes the SQL queries used for initial data exploration and to define data pipelines for the dashboard.
powerbi_dashboard/: Holds the Power BI file, a document outlining the DAX measures, and a preview image of the dashboard.
python_model/: Contains the Python script for training and evaluating the churn prediction model.

# Exploratory Data Analysis (EDA) with SQL
The initial investigation of the dataset was conducted using SQL. This allowed for efficient querying and aggregation to uncover relationships between customer attributes and churn. The analysis focused on:

- Customer demographics (gender, age, dependents).
- Account information (contract type, tenure, payment method).
- Service usage (phone, internet, tech support, etc.)

The SQL scripts in the sql_eda/ directory were used to create the data views that feed directly into the Power BI dashboard.

# Power BI Dashboard
An interactive dashboard was developed in Power BI to provide a high-level overview of the churn analysis. The dashboard allows business stakeholders to easily explore key performance indicators (KPIs) and visualize churn patterns across different segments.
Key features of the dashboard include:
- Overall churn rate and customer counts.
- Breakdowns of churn by contract type, internet service, and other critical factors.
- DAX measures were created to calculate metrics such as Total Churn Rate and Revenue by Customer Segment. 
