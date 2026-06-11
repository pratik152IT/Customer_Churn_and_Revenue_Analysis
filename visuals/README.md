# 🏦 Customer Churn & Revenue Risk Analysis

![Python](https://img.shields.io/badge/Python-3.10-blue?logo=python)
![PostgreSQL](https://img.shields.io/badge/PostgreSQL-Supabase-green?logo=postgresql)
![Tableau](https://img.shields.io/badge/Tableau-Public-orange?logo=tableau)
![Status](https://img.shields.io/badge/Status-Completed-brightgreen)

## 📌 Project Overview

A end-to-end data analytics project analysing customer churn patterns 
in a banking dataset of 10,000+ customers. The goal was to identify 
high-risk customer segments, quantify revenue at risk, and deliver 
actionable business recommendations through SQL analysis, Python EDA, 
and an interactive Tableau dashboard.

**Business Question:**
> Which customer segments are churning and what is the estimated 
> revenue impact on the business?

---

## 📊 Live Dashboard

🔗 **[View Interactive Tableau Dashboard](https://public.tableau.com/app/profile/pratik.parhad/viz/ChurnAnalysis_17812076426310/ChurnAnalysis?publish=yes)



---

## 🗂️ Project Structure


```text
churn-analysis/
├── data/
│   ├── churn_queries.sql        # All SQL queries used in analysis
│   └── sample_data.csv          # Sample of 100 rows (full data on Kaggle)
│
├── notebooks/
│   └── churn_analysis.ipynb     # Full Python EDA in Google Colab
│
├── visuals/
│   ├── churn_by_age.png
│   ├── balance_distribution.png
│   └── correlation_heatmap.png
│
└── README.md
```
## 🛠️ Tools & Technologies

| Tool | Purpose |
|------|---------|
| PostgreSQL (Supabase) | Cloud database, SQL analysis |
| Python (Google Colab) | Data cleaning, EDA, visualisation |
| pandas | Data manipulation |
| seaborn / matplotlib | Charts and graphs |
| Tableau Public | Interactive dashboard |
| GitHub | Version control and portfolio |

---

## 📁 Dataset

- **Source:** [Kaggle — Bank Customer Churn Dataset](https://www.kaggle.com/datasets/shantanudhakadd/bank-customer-churn-prediction)
- **Size:** 10,000 rows × 13 columns
- **Key columns:** `customer_id`, `age`, `balance`, `geography`, 
  `num_products`, `is_active_member`, `exited`

> Note: Full dataset not included in this repo. Download from Kaggle 
> link above and load into Supabase using the instructions below.

---

## 🔍 Key Findings

### Finding 1 — Age is the strongest churn predictor
Customers aged **46–60 have 2× the churn rate** compared to the 
under-30 segment. This age band also holds the highest average 
balance, making them the most valuable at-risk group.

### Finding 2 — Germany is a high-risk market
German customers churn at nearly **double the rate** of French and 
Spanish customers despite similar product holdings. This suggests 
a market-specific issue worth investigating.

### Finding 3 — Customers with 3–4 products churn the most
Counterintuitively, customers holding more products are more likely 
to churn. Customers with 3 products show a **churn rate above 80%**, 
suggesting product overload or mismatched offerings.

### Finding 4 — Inactive members are at high risk
Inactive members (`is_active_member = 0`) churn at significantly 
higher rates, presenting a clear opportunity for re-engagement campaigns.

---

## 💰 Business Impact

| Segment | Churn Rate | Customers at Risk | Revenue at Risk |
|---------|-----------|------------------|----------------|
| Age 46–60 | [X]% | [X] customers | $[X] |
| Germany | [X]% | [X] customers | $[X] |
| 3–4 Products | [X]% | [X] customers | $[X] |
| **Total** | **[X]%** | **[X] customers** | **$[X]** |

> Fill in these numbers from your actual query results

---

## 📈 Visualisations

### Churn Rate by Age Band
![Churn by Age](visuals/churn_by_age.png)

### Balance Distribution: Churned vs Retained
![Balance Distribution](visuals/balance_distribution.png)

### Feature Correlation Heatmap
![Correlation Heatmap](visuals/correlation_heatmap.png)

---

## 🗄️ SQL Highlights

Key SQL techniques used in this project:

- **Window functions** — `RANK()` to rank segments by churn rate
- **CTEs** — Age band segmentation using `WITH` clause
- **Conditional aggregation** — Revenue at risk calculation
- **Cohort logic** — Customer grouping by product holdings

See all queries in [`data/churn_queries.sql`](data/churn_queries.sql)

---

## ▶️ How to Reproduce This Project

### 1. Clone this repo
```bash
git clone https://github.com/[YOUR-USERNAME]/churn-analysis.git
cd churn-analysis
```

### 2. Download the dataset
Download from [Kaggle](https://www.kaggle.com/datasets/shantanudhakadd/bank-customer-churn-prediction) 
and save as `Churn_Modelling.csv`

### 3. Set up Supabase
- Create a free account at [supabase.com](https://supabase.com)
- Create a new project
- Run the table creation SQL from `data/churn_queries.sql`
- Get your Project URL and anon key from Settings → API

### 4. Run the notebook
- Open `notebooks/churn_analysis.ipynb` in Google Colab
- Replace the Supabase credentials:
```python
SUPABASE_URL = "your-project-url"
SUPABASE_KEY = "your-anon-key"
```
- Run all cells in order

### 5. View the dashboard
Open the live Tableau dashboard: https://public.tableau.com/app/profile/pratik.parhad/viz/ChurnAnalysis_17812076426310/ChurnAnalysis?publish=yes

---

## 💡 Recommendations

Based on the analysis, three actions are recommended:

1. **Launch a targeted retention campaign** for the 46–60 age segment 
   in Germany — highest churn rate combined with highest average balance 
   makes this the highest priority segment.

2. **Review the 3–4 product bundle** — the spike in churn among 
   multi-product customers suggests these products may not be meeting 
   customer needs. A product satisfaction survey for this segment 
   is recommended.

3. **Re-engagement programme for inactive members** — customers marked 
   as inactive (`is_active_member = 0`) are significantly more likely 
   to churn. A proactive outreach campaign with personalised offers 
   could reduce this risk.

---

## 👤 Author

**[Pratik Keshavrao Parhad]**  

---

## 📄 License

This project is open source and available under the 
[MIT License](LICENSE).

