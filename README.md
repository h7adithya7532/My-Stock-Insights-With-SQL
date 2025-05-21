# My-Stock-Insights-With-SQL

# 📈 Stock Portfolio Analyzer


A SQL Server-based data analytics project that provides insights into stock investments using ROI (Return on Investment), total profits/losses, and investment patterns. This project is built using real transaction-level portfolio data and is designed to showcase analytical skills using SQL.\

🧠 Project Objectives

- Analyze stock-wise performance based on ROI
- Identify which stocks generated the most profit or loss
- Determine where the highest investments were made
- Present insights that can help in smarter investment decisions

📂 Dataset Description

**File Used:** `Stocks_PnL_Report_2024-04-01_to_2025-05-20.xlsx`

**Imported Table:** `importstockdata`

| Column Name       | Description                          |
|-------------------|--------------------------------------|
| stock_name        | Name of the stock                    |
| buy_value         | Total amount spent on purchases      |
| realized_pnl      | Realized Profit or Loss              |
| qty               | Quantity traded                      |
| buy_avg_price     | Average buy price per share          |
| sell_avg_price    | Average sell price per share         |
| trade_date        | Date of transaction                  |


🏗️ Project Setup (SQL Server 2022 Express)

1. Create Database

CREATE DATABASE StockAnalyticsDB;
USE StockAnalyticsDB;

2. Import Excel/CSV to SQL Server

* Open SQL Server Management Studio (SSMS)
* Right-click `StockAnalyticsDB` → Tasks → Import Flat File
* Select your `.csv` file and complete the wizard

3. Verify Table

SELECT* 
FROM importstockdata;


📊 Key SQL Queries

1. 🔁 Total Investment and PnL Per Stock


SELECT stock_name,
       SUM(CAST(buy_value AS FLOAT)) AS Total_Invested,
       SUM(CAST(realized_pnl AS FLOAT)) AS Total_Realized_PnL
FROM importstockdata
GROUP BY stock_name
ORDER BY Total_Invested DESC;


### 2. 📈 ROI (Return on Investment) Per Stock

```sql
SELECT stock_name,
       CAST(SUM(CAST(realized_pnl AS FLOAT)) / NULLIF(SUM(CAST(buy_value AS FLOAT)), 0) * 100 AS DECIMAL(10, 2)) AS ROI_Percentage
FROM importstockdata
GROUP BY stock_name
ORDER BY ROI_Percentage DESC;
```

---

### 3. 📉 Loss-Making Stocks

```sql
SELECT stock_name,
       SUM(CAST(realized_pnl AS FLOAT)) AS Total_Loss
FROM importstockdata
GROUP BY stock_name
HAVING SUM(CAST(realized_pnl AS FLOAT)) < 0
ORDER BY Total_Loss ASC;
```

---

### 4. 📅 Monthly Performance Overview

```sql
SELECT FORMAT(CAST(trade_date AS DATE), 'yyyy-MM') AS Month,
       SUM(CAST(realized_pnl AS FLOAT)) AS Monthly_Profit
FROM importstockdata
GROUP BY FORMAT(CAST(trade_date AS DATE), 'yyyy-MM')
ORDER BY Month;
```

---

## 🔍 Insights Extracted

* **Top Performing Stocks**: Based on highest ROI
* **Most Invested Stocks**: Where the largest capital was allocated
* **Profit vs. Loss Distribution**: Easy to see loss-making vs. profitable stocks
* **Monthly Trends**: Investment performance over time

---

## 💡 Future Enhancements

* Add Power BI Dashboard to visualize KPIs
* Use Python (Pandas + Matplotlib/Seaborn) for more advanced analysis
* Add live stock price integration via API
* Automate daily PnL updates using SQL Jobs or ETL

---

## 🧑‍💻 Author

**Donthula Adithya**
B.Tech Data Science, Vignana Bharathi Institute of Technology
[GitHub Profile](https://github.com/) *(insert your GitHub profile URL)*

---

## 📜 License

This project is for academic and portfolio use. Feel free to fork and enhance!
