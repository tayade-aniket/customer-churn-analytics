# 📊 Customer Churn Analytics & Retention Engine
![Python](https://img.shields.io/badge/Python-3.8+-blue.svg)
![ML](https://img.shields.io/badge/Machine%20Learning-XGBoost-orange.svg)
![PowerBI](https://img.shields.io/badge/Data%20Viz-PowerBI-yellow.svg)
![Status](https://img.shields.io/badge/Project-Completed-success.svg)

## 🎯 Project Overview
This end-to-end Data Science project focuses on predicting customer churn for a telecommunications company and, more importantly, building an **Automated Retention Engine**. By leveraging **XGBoost** and **SHAP** explainability, the system identifies high-risk customers and assigns specific business actions (like discount offers or relationship manager assignments) to mitigate a potential **$220k+ monthly revenue loss**.

### 🚀 Business Impact (Key Metrics)
*   **Model Accuracy:** 78.25% (Optimized for Recall to catch potential leavers).
*   **Revenue at Risk Identified:** ~$167,789.95 in the "Critical Risk" segment.
*   **Key Churn Driver:** New customers (low tenure) and Fiber Optic users are 3x more likely to churn.
*   **Actionable Output:** Automated segmentation of 7,000+ customers into 4 risk tiers with tailored retention strategies.

---

## 🖥️ Interactive Dashboard
The project includes a comprehensive PowerBI dashboard providing a 360-degree view of customer health and churn metrics.

![Dashboard Preview](./dashboard/dashboard.png)

---

## 🛠️ Tech Stack & ATS Keywords
*   **Languages:** Python (Pandas, NumPy), SQL.
*   **Machine Learning:** XGBoost, Scikit-Learn (Logistic Regression, Random Forest).
*   **Model Explainability:** SHAP (Shapley Additive Explanations).
*   **Data Visualization:** PowerBI, Seaborn, Plotly, Matplotlib.
*   **Database/Storage:** SQL Server, CSV/Excel ETL.
*   **Deployment Tools:** Joblib for model serialization.

---

## 📑 Project Workflow
1.  **Data Ingestion & ETL:** Automated loading of Telco customer records.
2.  **Exploratory Data Analysis (EDA):** Uncovering churn patterns (e.g., electronic check users show higher churn rates).
3.  **Feature Engineering:** Created `tenure_groups`, `high_value_customer` flags, and normalized `TotalCharges`.
4.  **Machine Learning:** Comparison between Logistic Regression and XGBoost.
5.  **SHAP Interpretability:** Moving beyond "Black Box" models to understand *why* each customer is at risk.
6.  **Retention Engine:** Built a logic-based engine that calculates a **Customer Health Score** (0-100).

---

## 🧠 Model Explainability (SHAP)
Instead of just predicting *if* a customer will leave, we use SHAP values to identify the *reasons*:
*   **Top Positive Force:** Month-to-month contracts and Fiber Optic service increase churn probability.
*   **Top Negative Force:** Two-year contracts and long tenure significantly improve loyalty.

---

## 📉 Retention Strategy (The "Engine")
The project transforms raw data into business decisions:

| Risk Segment | Criteria (Health Score) | Recommended Action |
| :--- | :--- | :--- |
| **Critical Risk** | < 40 | Assign Relationship Manager |
| **High Risk** | 40 - 60 | Provide 20% Discount Offer |
| **Medium Risk** | 60 - 80 | Send Engagement Campaign |
| **Low Risk** | > 80 | No Action Required |

---

## 📂 Repository Structure
```bash
├── data/               # Raw and Processed datasets
├── notebooks/          # Step-by-step Jupyter Notebooks (01-07)
├── models/             # Saved pickle files (XGBoost + Scaler)
├── scripts/            # Production-ready Python scripts
├── images/             # Dashboard screenshots and plots
└── reports/            # Exported High-Risk customer lists
```

---

## ⚙️ Setup & Installation
1.  **Clone the repo:**
    ```bash
    git clone https://github.com/tayade-aniket/customer-churn-analytics.git
    ```
2.  **Install dependencies:**
    ```bash
    pip install -r requirements.txt
    ```
3.  **Run the Retention Engine:**
    ```bash
    python scripts/retention_engine.py
    ```

---

## 👤 Author
**Aniket Tayade**
*   **Portfolio:** [https://aniket-tayade-nine.vercel.app/]
*   **LinkedIn:** [https://www.linkedin.com/in/aniket-g-tayade/]
*   **GitHub:** [https://github.com/tayade-aniket/]

---
*If you found this project useful, please consider giving it a ⭐!*
