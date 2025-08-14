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
The Dataset can be accessed here: https://www.kaggle.com/datasets/blastchar/telco-customer-churn
- Telco_Churn_Dashboard.pbix: Contains the PowerBI file with the produced Dashboard.
- Telco_Churn_Dashboard.pdf: Contains in pdf form a screenshot of the dashboard
- Telco_Churn_SQL_Queries.sql: Includes all SQL queries used for EDA.
- Telco_Churn_Prediction.py: Contains the python script used to predict churn
- Classification_Report.txt: Includes all logistic regression classification metrics (accuracy, precision, F1 score, recall)
- Confusion_Matrix.png: Screenshot of the confusion matrix

# Exploratory Data Analysis (EDA) with SQL
The initial investigation of the dataset was conducted using SQL. This allowed for efficient querying and aggregation to uncover relationships between customer attributes and churn. The analysis focused on:

- Customer demographics (gender, age, dependents).
- Account information (contract type, tenure, payment method).
- Service usage (phone, internet, tech support, etc.)

The SQL scripts in the Telco_Churn_SQL_Queries.sql file were used to create the data views that feed directly into the Power BI dashboard.

# Power BI Dashboard
An interactive dashboard was developed in Power BI to provide a high-level overview of the churn analysis. The dashboard allows business stakeholders to easily explore key performance indicators (KPIs) and visualize churn patterns across different segments.
Key features of the dashboard include:
- Overall churn rate and customer counts.
- Breakdowns of churn by contract type, internet service, and other critical factors.
- DAX measures were created to calculate metrics such as Total Churn Rate and Revenue by Customer Segment. 

# Churn Prediction Model
A logistic regression model was built using Python and the Scikit-learn library to predict whether a customer will churn. The model provides a quantitative way to identify at-risk customers, enabling the company to take proactive retention measures.

# Model Performance
The model's performance was evaluated on a held-out portion of the data.
- Overall Accuracy: The model achieved an accuracy of 80.7%, meaning it correctly predicted the outcome for the vast majority of customers.
- Performance Breakdown: The model is highly effective at correctly identifying customers who will not churn. Its ability to predict customers who will churn is moderate, indicating that while it successfully flags many at-risk customers, there is an opportunity for future improvement to catch even more.
- Confusion Matrix: A visual representation of the model's performance, including its specific predictions versus the actual outcomes, is available. This plot is saved in the python_model directory


# How to Reproduce This Project

To explore the components of this project, follow these steps:
- Clone the Repository: Download the project files to your local machine.
- git clone https://github.com/michloiz/Telco-Customer-Churn-End-to-End-Analysis-and-Prediction
- Run the Prediction Model: To execute the Python script, first install the necessary libraries listed in the beggining of the Telco_Churn_Prediction.py script . Then, run the script from your terminal.
- View the SQL Queries: The complete set of SQL scripts used for the analysis can be viewed in the Telco_Churn_SQL_Queries.sql file
- Explore the Dashboard: To view the interactive dashboard,  download the .pbix file, and open it using Power BI Desktop. The DAX logic is within the same file.

