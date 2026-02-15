# Workforce Analytics & Attrition Risk Modeling | PostgreSQL

## Executive Overview

This project simulates a real-world HR analytics environment using PostgreSQL. A fully normalized workforce database (300 employees) was designed to analyze attrition patterns, salary distribution, department performance, and employee risk factors.

Advanced SQL techniques including CTE pipelines, window functions (NTILE, RANK), conditional aggregation, and statistical analysis were used to generate executive-ready reporting layers.

A rule-based attrition risk model was engineered directly in SQL using salary quartiles, performance scores, and tenure as predictive features. Model performance was evaluated using a confusion matrix (Precision, Recall, F1-score), demonstrating structured analytics and business intelligence thinking.

---

## Project Structure
01_schema.sql
02_data_population.sql
03_kpi_analysis.sql
04_salary_analysis.sql
05_attrition_analysis.sql
06_risk_model.sql
07_executive_reporting.sql

---

## Technologies Used

- PostgreSQL
- Advanced SQL (CTEs, Window Functions, Aggregations)
- Statistical Functions (STDDEV, CORR)
- Feature Engineering in SQL

---

## Business Impact

- Identifies high-risk employees
- Highlights departments with elevated attrition
- Provides executive-level workforce intelligence
- Demonstrates production-style SQL analytics
