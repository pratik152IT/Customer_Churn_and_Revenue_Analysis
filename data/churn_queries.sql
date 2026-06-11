-- ============================================================
-- Project: Customer Churn & Revenue Risk Analysis
-- Database: PostgreSQL (Supabase)
-- Author: [Pratik Parhad]
-- ============================================================


-- ============================================================
-- Query 1: Product Holdings vs Churn Rate
-- Purpose: Identify which product count has highest churn
-- Used in: Sheet 3 — Product Analysis (Tableau)
-- ============================================================

SELECT
  num_products,
  COUNT(*) AS customers,
  SUM(exited) AS churned,
  ROUND(AVG(exited::numeric) * 100, 2) AS churn_rate_pct,
  ROUND(AVG(balance)::numeric, 2) AS avg_balance,
  RANK() OVER (ORDER BY AVG(exited::numeric) DESC) AS churn_rank
FROM customers
GROUP BY num_products;


-- ============================================================
-- Query 2: Revenue at Risk by Geography
-- Purpose: Calculate total revenue at risk per country
-- Used in: Executive Summary KPI + Insight Deck
-- ============================================================

SELECT
  geography,
  COUNT(*) FILTER (WHERE exited = 1) AS churned_customers,
  ROUND(AVG(balance) FILTER (WHERE exited = 1), 2) AS avg_churned_balance,
  ROUND(
    COUNT(*) FILTER (WHERE exited = 1) * AVG(balance) FILTER (WHERE exited = 1)
  , 2) AS revenue_at_risk
FROM customers
GROUP BY geography
ORDER BY revenue_at_risk DESC;


-- ============================================================
-- Query 3: Churn Rate by Age Band (CTE + CASE)
-- Purpose: Segment customers into age groups and compare churn
-- Used in: Sheet 2 — Segment Deep Dive (Tableau)
-- ============================================================

WITH age_bands AS (
  SELECT *,
    CASE
      WHEN age < 30 THEN 'Under 30'
      WHEN age BETWEEN 30 AND 45 THEN '30-45'
      WHEN age BETWEEN 46 AND 60 THEN '46-60'
      ELSE 'Over 60'
    END AS age_band
  FROM customers
)
SELECT
  age_band,
  COUNT(*) AS total,
  SUM(exited) AS churned,
  ROUND(AVG(exited::numeric) * 100, 2) AS churn_rate_pct,
  ROUND(AVG(balance)::numeric, 2) AS avg_balance
FROM age_bands
GROUP BY age_band
ORDER BY churn_rate_pct DESC;


-- ============================================================
-- Query 4: Churn Rate by Geography and Gender
-- Purpose: Cross-segment analysis to find highest risk groups
-- Used in: Sheet 2 — Segment Deep Dive (Tableau)
-- ============================================================

SELECT
  geography,
  gender,
  COUNT(*) AS total_customers,
  SUM(exited) AS churned,
  ROUND(AVG(exited::numeric) * 100, 2) AS churn_rate_pct
FROM customers
GROUP BY geography, gender
ORDER BY churn_rate_pct DESC;