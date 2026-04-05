
# Loan Risk & Approval Analysis (SQL Project)

## Overview

This project analyzes customer and transaction data to identify risk patterns and support loan approval decisions. The goal is to uncover high-risk customer behavior using SQL-based data analysis.

## Problem Statement

Financial institutions must evaluate loan applications efficiently while minimizing risk. This project explores how transaction behavior can be used to identify potentially risky applicants.

## Tools Used

* SQL

## Key Analysis Performed

* Joined customer and transaction datasets
* Aggregated transaction data using SUM, COUNT, and MAX
* Identified customers with:

  * High transaction values
  * Activity across multiple locations
* Applied HAVING filters to isolate high-risk segments

## Example Query

```sql
SELECT customer_id,
       MAX(amount) AS max_amount,
       COUNT(DISTINCT location) AS location_count
FROM transections
GROUP BY customer_id
HAVING COUNT(DISTINCT location) > 1
   AND MAX(amount) > 10000
ORDER BY max_amount DESC;
```

## Key Insights

* Customers with transactions across multiple locations may indicate irregular activity
* High-value transactions can signal increased financial risk
* Combining behavioral indicators improves risk detection

## Future Improvements

* Integrate Python for deeper analysis
* Build dashboards for visualization (Power BI)
* Develop a basic risk scoring model
