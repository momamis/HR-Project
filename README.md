# Project Title
HR Data Analysis, Visualization, and Turnover Prediction

![Dashboard Screenshot](https://github.com/momamis/HR-Project/blob/main/hr_dashboard.png)

## Table of Contents
- [Project Overview](#project-overview)
- [Data Type](#data-type)
- [Steps Taken](#steps-taken)
    - [Data Cleaning Using SQL](#data-cleaning-using-sql)
    - [Data Analysis Using SQL](#data-analysis-using-sql)
    - [Data Visualization](#data-visualization)
    - [Summary of Findings](#summary-of-findings)
    - [Turnover Prediction Using Python](#turnover-prediction-using-python)
      - [Final Data Cleaning](#final-data-cleaning)
      - [Preprocessing](#preprocessing)
      - [Model Building](#model-building)
      - [Feature Importance](#feature-importance)
  - [Key Insights](#key-insights)

## Project Overview
This project aims at breaking down the demographics of a company's HR by various parameters like gender, race, age, location, turnover rate, etc. Research has shown that a diverse workforce can lead to improved efficiency and productivity. Understanding the distribution of these paramters could contribute to optimizing the company's talent pool for better business outcomes. The project concludes with a prediction of turnover rates using Random Forest Classification, achieving a solid accuracy score. Tenure and age seem to be strong indicators of whether an employee might leave. Retention strategies should focus on newer and younger employees. Demographic indicators like gender and race being important could signal possible HR or cultural issues that require attention. These insights can help organizations prioritize retention efforts, especially for those at a high risk of leaving.

## Data Type
The data used is in the form of a csv file with columns indicating name of the employees, id, gender, race, date of birth, termination date, location, job title, department, etc.

## Steps Taken

### Data Cleaning Using SQL
- Altered dates of birth, hiring date, and termination dates into a common format.
- Normalized birth dates post the 1950s and prior to the 21st century by subtracting 100 years from those values, resolving the issue of negative years arising from the SQL function that treats dates like '78-10-26' as '2078-10-26' instead of '1978-10-26'.
- Calculated the age of every employee by using the values available in the birth date column.

### Data Analysis Using SQL
The following variables were analyzed using SQL:
- Number of active employees
- Gender, age, racial distribution
- Number of employees working at the headquarters vs number of remote employees
- The average length of employment
- Distribution of job titles across the company
- Department with the highest turnover rate
- Distribution of employees across states
- Tenure distribution across departments
- Department with the lowest hiring rate

### Data Visualization Using PowerBI
- Built a dashboard to highlight HR demographic metrics.
- Key insights from the visualization includes trends in the number of employees over time; age, gender, and race distribution by department; and turnover rate by department.

### Summary of Findings
- There are more male employees than female employees.
- White race is the most dominant while Native Hawaiian and American Indian are the least dominant.
- A large number of employees were between 25-34, while the smallest group was 55-64.
- The average length of employment for terminated employees is around 8 years.
- The gender distribution across departments is fairly balanced but there are generally more male than female employees.
- The Auditing department has the highest turnover rate followed by the Legal department.
- A large number of employees come from the state of Ohio.
- The net change in employees has increased over the years.

### Turnover Prediction Using Python

-**Final Data Cleaning**:
 - Imported all key libraries including `RandomForestClassifier`.
 - Read HR data from a cleaned .csv file.
 - Parsed dates (`hire_date`, `termdate`) and computed `tenure` in years.
 - Created a new column `turnover` (target variable).
 - Handled missing tenure values by calculating for still-employed staff.
 - Created a column `tenure_type` to indicate whether tenure was filled due to termination or ongoing employment.
   
- **Preprocessing**:
  - Converted `gender` and `location` to binary values.
  - One-hot-encoded `race`, `department`, `job title`, and `location_state`.
    
- **Model Building**:
  - Split data into features (`x`) and target (`y`), and into training/testing sets.
  - Trained a `RandomForestClassifier` on the dataset.
  - Evaluated model accuracy with `.score()`.
    
- **Feature Importance**:
  - Pulled out feature importances using `.feature_importances_`.
  - Plotted the top 10 most important features driving turnover.

## Key Insights
- Tenure and age are strong indicators of potential turnover, with newer and younger employees showing a higher risk of leaving. Companies should focus on targeted retention strategies for these groups to reduce 
  turnover rates.
- Demographic factors like gender and race also play an important role in predicting turnover. This could point to underlying HR or cultural issues that need to be addressed to foster a more inclusive and 
  supportive work environment.
- Understanding these demographic distributions can help organizations identify at-risk employees and take proactive measures to improve retention.

  




