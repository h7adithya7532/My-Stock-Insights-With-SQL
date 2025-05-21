### Stock Portfolio Analysis Project
## Overview
This project analyzes stock portfolio data from April 1, 2025, to May 20, 2025. It imports trading data from a CSV file into a SQL database and performs various analyses to track investment performance.
Project Structure

project_stock.sql: Contains all SQL queries for database setup and analysis
CSV data file (imported manually): Contains raw stock trading data

## Features

Import stock data from CSV files
Track realized profit and loss
Identify top performing and underperforming stocks
Calculate return on investment (ROI)
Analyze total investment and sell value

## Database Setup
The project uses a SQL database with a main table called importstockdata with the following schema:

id: Auto-incrementing primary key

stock_name: Name of the stock

isin: International Securities Identification Number

quantity: Number of shares traded

avg_buy_price: Average buying price per share

buy_value: Total buy value

avg_sell_price: Average selling price per share

sell_value: Total sell value

realized_pnl: Realized profit and loss

realized_pnl_percentage: Profit and loss as a percentage

## Getting Started

Create a new database in SQL Server called StockAnalysisDB
Run the SQL commands in project_stock.sql to set up the table structure
Import your CSV data file:

Right-click on the StockAnalysisDB database
Select "Tasks" > "Import Flat File"
Select your CSV file containing stock data
Follow the import wizard to map columns to the table structure



## Analysis Queries
The project includes several analytical queries:

## 1.Total Investment
SELECT SUM(CAST(buy_value AS FLOAT)) AS TotalInvestment

FROM importstockdata;

## 2.Total Sell Value
SELECT SUM(CAST(sell_value AS FLOAT)) AS TotalSellValue

FROM importstockdata;

## 3.Net Realized Profit & Loss
SELECT SUM(CAST(realized_pnl AS FLOAT)) AS NetProfitLoss

FROM importstockdata;

## 4.Top 5 Profit-Making Stocks
SELECT TOP 5 stock_name,

SUM(CAST(realized_pnl AS FLOAT)) AS Profit

FROM importstockdata

GROUP BY stock_name

ORDER BY Profit DESC;

## 5.Worst 5 Performing Stocks
sqlSELECT TOP 5 stock_name,

SUM(CAST(realized_pnl AS FLOAT)) AS Loss

FROM importstockdata

GROUP BY stock_name

ORDER BY Loss ASC;

## 6.Return on Investment (ROI)
SELECT stock_name,

CAST(SUM(CAST(realized_pnl AS FLOAT)) / NULLIF(SUM(CAST(buy_value AS FLOAT)), 0) * 100 AS DECIMAL(10, 2)) AS ROI_Percentage
	   
FROM importstockdata

GROUP BY stock_name

ORDER BY ROI_Percentage DESC;



## Future Improvements

Add visualization components using Power BI

Include unrealized profit/loss calculations

Add historical trend analysis

Implement sector-based analysis

Create automated reporting functionality

# Notes
The last row of imported data is automatically deleted as it contains totals

All monetary values are handled as FLOAT data types for accurate calculations

# Requirements
SQL Server (any recent version)

CSV file with stock trading data

## Author
Adithya Donthula

Last Updated
May 21, 2025
