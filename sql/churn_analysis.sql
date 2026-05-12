USE churn_analysis;
GO

/* Total Customers */
SELECT COUNT(*) AS total_customers FROM customers;
GO

/* Total Churned Customers */
SELECT COUNT(*) AS churned_customers from customers WHERE Churn = 'Yes';
GO

/* Overall Churn Rate */
SELECT
    ROUND(
        SUM(
            CASE
                WHEN Churn = 'Yes' THEN 1
                ELSE 0
            END
        ) * 100.0 / COUNT(*),
        2
    ) AS churn_rate_percentage
FROM customers;
GO

/* Churn by Contract Type */
SELECT
    Contract,
    COUNT(*) AS total_customers,

    SUM(
        CASE
            WHEN Churn = 'Yes' THEN 1
            ELSE 0
        END
    ) AS churned_customers,

    ROUND(
        SUM(
            CASE
                WHEN Churn = 'Yes' THEN 1
                ELSE 0
            END
        ) * 100.0 / COUNT(*),
        2
    ) AS churn_rate_percentage

FROM customers

GROUP BY Contract

ORDER BY churn_rate_percentage DESC;
GO

/* Churn By Internet Service */
SELECT
    InternetService,

    COUNT(*) AS total_customers,

    SUM(
        CASE
            WHEN Churn = 'Yes' THEN 1
            ELSE 0
        END
    ) AS churned_customers,

    ROUND(
        SUM(
            CASE
                WHEN Churn = 'Yes' THEN 1
                ELSE 0
            END
        ) * 100.0 / COUNT(*),
        2
    ) AS churn_rate_percentage

FROM customers

GROUP BY InternetService

ORDER BY churn_rate_percentage DESC;
GO


/* Churn By Payment Method */
SELECT
    PaymentMethod,

    COUNT(*) AS total_customers,

    ROUND(
        AVG(MonthlyCharges),
        2
    ) AS avg_monthly_charges,

    ROUND(
        SUM(
            CASE
                WHEN Churn = 'Yes' THEN 1
                ELSE 0
            END
        ) * 100.0 / COUNT(*),
        2
    ) AS churn_rate_percentage

FROM customers

GROUP BY PaymentMethod

ORDER BY churn_rate_percentage DESC;
GO


/* Revenue Lost due to churn */
SELECT
    ROUND(
        SUM(MonthlyCharges),
        2
    ) AS monthly_revenue_lost,

    ROUND(
        SUM(TotalCharges),
        2
    ) AS lifetime_revenue_lost

FROM customers

WHERE Churn = 'Yes';
GO

/* High Value Customer Churn */

WITH avg_revenue AS (

    SELECT
        AVG(MonthlyCharges) AS avg_monthly_charge
    FROM customers
)

SELECT
    COUNT(*) AS high_value_customers,

    SUM(
        CASE
            WHEN Churn = 'Yes' THEN 1
            ELSE 0
        END
    ) AS churned_high_value_customers,

    ROUND(
        SUM(
            CASE
                WHEN Churn = 'Yes' THEN 1
                ELSE 0
            END
        ) * 100.0 / COUNT(*),
        2
    ) AS high_value_churn_rate

FROM customers
CROSS JOIN avg_revenue

WHERE MonthlyCharges >
      avg_monthly_charge;
GO


/* Customer Tenure Segmentation */
SELECT

    CASE

        WHEN tenure <= 12 THEN 'New Customers'

        WHEN tenure <= 24 THEN 'Growing Customers'

        WHEN tenure <= 48 THEN 'Loyal Customers'

        ELSE 'Long-Term Customers'

    END AS tenure_segment,

    COUNT(*) AS total_customers,

    ROUND(
        AVG(MonthlyCharges),
        2
    ) AS avg_monthly_charges,

    ROUND(
        SUM(
            CASE
                WHEN Churn = 'Yes' THEN 1
                ELSE 0
            END
        ) * 100.0 / COUNT(*),
        2
    ) AS churn_rate_percentage

FROM customers

GROUP BY

    CASE

        WHEN tenure <= 12 THEN 'New Customers'

        WHEN tenure <= 24 THEN 'Growing Customers'

        WHEN tenure <= 48 THEN 'Loyal Customers'

        ELSE 'Long-Term Customers'

    END

ORDER BY churn_rate_percentage DESC;
GO

/* Tech Support impact on Churn */

SELECT
    TechSupport,

    COUNT(*) AS total_customers,

    ROUND(
        SUM(
            CASE
                WHEN Churn = 'Yes' THEN 1
                ELSE 0
            END
        ) * 100.0 / COUNT(*),
        2
    ) AS churn_rate_percentage

FROM customers

GROUP BY TechSupport

ORDER BY churn_rate_percentage DESC;
GO


/* Month to Month Contract Risk */
SELECT
    Contract,

    COUNT(*) AS total_customers,

    ROUND(
        AVG(MonthlyCharges),
        2
    ) AS avg_monthly_charges,

    ROUND(
        AVG(TotalCharges),
        2
    ) AS avg_total_charges,

    ROUND(
        SUM(
            CASE
                WHEN Churn = 'Yes' THEN 1
                ELSE 0
            END
        ) * 100.0 / COUNT(*),
        2
    ) AS churn_rate_percentage

FROM customers

WHERE Contract = 'Month-to-month'

GROUP BY Contract;
GO

/* Executive Summary KPI Query */
SELECT

    COUNT(*) AS total_customers,

    SUM(
        CASE
            WHEN Churn = 'Yes' THEN 1
            ELSE 0
        END
    ) AS churned_customers,

    ROUND(
        SUM(
            CASE
                WHEN Churn = 'Yes' THEN 1
                ELSE 0
            END
        ) * 100.0 / COUNT(*),
        2
    ) AS churn_rate_percentage,

    ROUND(
        AVG(MonthlyCharges),
        2
    ) AS avg_monthly_charges,

    ROUND(
        SUM(MonthlyCharges),
        2
    ) AS total_monthly_revenue,

    ROUND(
        SUM(
            CASE
                WHEN Churn = 'Yes'
                THEN MonthlyCharges
                ELSE 0
            END
        ),
        2
    ) AS monthly_revenue_at_risk

FROM customers;
GO