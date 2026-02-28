## Credit Risk & Portfolio Performance Analysis

 End-to-End SQL → Python → Power BI

 # Project Objective

To analyze loan portfolio risk, exposure concentration and profitability drivers using LendingClub loan data and identify segments that optimize risk-adjusted returns.

This project demonstrates end-to-end data workflow — from raw database ingestion to executive-level business insights.

# Tools & Technologies

MySQL – Data cleaning, transformation, aggregation

Python (Pandas, NumPy, Seaborn, Matplotlib) – Feature engineering & EDA

Power BI – Interactive dashboard & executive reporting

SQL–Python–BI workflow

# Workflow Overview
1.Data Engineering (MySQL)

Loaded and processed 500K+ loan records

Cleaned inconsistent numeric fields

Created structured analytical dataset

Derived default_flag and principal_loss

2.Feature Engineering (Python)

Created:

fico_band

income_band

dti_band

Performed correlation analysis

Evaluated risk-return tradeoff


3.Business Intelligence (Power BI)

Built a 3-page executive dashboard:

Portfolio Overview

Risk Segmentation

Profitability Analysis

# Dashboard Preview
🔹 Portfolio Overview
<img width="1302" height="733" alt="Portfolio Performance Overview" src="https://github.com/user-attachments/assets/9dd49ac9-163d-45b4-90a2-24e2cfa86b70" />


🔹 Risk Segmentation
<img width="1293" height="736" alt="Risk Segmentation" src="https://github.com/user-attachments/assets/9a56c1a3-8753-456d-9b03-f2da731ca686" />


🔹 Profitability Analysis

<img width="1297" height="732" alt="Profitability Analysis" src="https://github.com/user-attachments/assets/b5166223-ce7c-4016-b1c6-7b47c4785a52" />


# Key Insights

60-month loans exhibit significantly higher default risk (~36%) compared to 36-month loans (~15%).

Fair FICO segment shows elevated default (~23%) with high exposure concentration, creating portfolio vulnerability.

Good FICO segment generates strongest net profitability with moderate risk — optimal risk-return zone.

Grades E–G demonstrate extreme default rates (>40%) with weak profitability contribution.

Portfolio return ≈ 1.28%, indicating moderate profitability with structural risk concentration.

# Strategic Recommendations

Reduce exposure to high-risk low-return segments (Grade E–G, Fair FICO).

Increase allocation toward Grade B/C and Good FICO borrowers.

Gradually shift portfolio mix toward shorter-duration (36-month) loans.

Monitor concentration risk within mid-tier credit segments.

# Business Impact

This analysis demonstrates how portfolio allocation decisions can:

Improve risk-adjusted returns

Reduce concentration risk

Enhance portfolio stability during economic downturns
