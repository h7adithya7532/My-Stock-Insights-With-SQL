Create Table importstockdata(
	stock_name VARCHAR(100),
	isin Varchar(20),
	quantity INT,
	avg_buy_price FLOAT,
	buy_value FLOAT,
	avg_sell_price FLOAT,
	sell_value FLOAT,
	realized_pnl FLOAT,
	realized_pnl_percentage FLOAT
);

--Imported the data from CSV file of the stock portfolio of the Stock p&l from April-1-2025 to May-20-2025
--Right click on the StockAnalysisDB
--Select >Task>Import Flat file
--The importing File should be in the CSV format

--Adding a column name Id with Alter
ALTER TABLE importstockdata
ADD Id INT IDENTITY(1,1) PRIMARY KEY;

--Checking the Table By Selecting it
Select*
From dbo.importstockdata;

--Deleteing the last row as it is used to calculate total's
Delete From importstockdata
where id=31;

--Total Investment
SELECT SUM(CAST(buy_value AS FLOAT)) AS TotalInvestment
FROM importstockdata;


--Total Sell Value
SELECT SUM(CAST(sell_value AS FLOAT)) AS TotalSellValue
FROM importstockdata;


--Net Realized Profit&Loss
SELECT SUM(CAST(realized_pnl AS FLOAT)) AS NetProfitLoss
FROM importstockdata;


--Top5 profit making stocks
SELECT TOP 5 stock_name,
SUM(CAST(realized_pnl AS FLOAT)) AS Profit
FROM importstockdata
GROUP BY stock_name
ORDER BY Profit DESC;


--Worst 5 Performing Stocks
SELECT TOP 5 stock_name,
SUM(CAST(realized_pnl AS FLOAT)) AS Loss
FROM importstockdata
GROUP BY stock_name
ORDER BY Loss ASC;


--Calculating ROI(Return On Investment)
SELECT stock_name,
       CAST(SUM(CAST(realized_pnl AS FLOAT)) / NULLIF(SUM(CAST(buy_value AS FLOAT)), 0) * 100 AS DECIMAL(10, 2)) AS ROI_Percentage
FROM importstockdata
GROUP BY stock_name
ORDER BY ROI_Percentage DESC;
