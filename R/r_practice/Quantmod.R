
install.packages("quantmod")
library(quantmod)

# Define the stock symbol and date range
stock_symbol <- "WIPRO.NS"
start_date <- as.Date("2021-01-01")
end_date <- Sys.Date()

# Download the stock price data
getSymbols(stock_symbol, from = start_date, to = end_date)

# View the data
head(WIPRO.NS)


# Plot the closing price over time

#In the context of your R code, Cl() is a function from the quantmod package, 
#which is used for financial data analysis and visualization. 
#The Cl() function specifically extracts the "Close" prices from an 
#OHLC (Open, High, Low, Close) object, which typically represents financial 
#time series data.
plot(Cl(WIPRO.NS), type = "l", main = "Wipro Stock Price")

# Calculate the daily returns
returns <- dailyReturn(Cl(WIPRO.NS))
head(returns)

# Plot the daily returns over time
plot(returns, type = "l", main = "Daily Returns")


# Calculate the 50-day and 200-day moving averages
ma50 <- SMA(Cl(WIPRO.NS), n = 50)
head(ma50)
ma200 <- SMA(Cl(WIPRO.NS), n = 200)
head(ma200)

# Plot the stock price and moving averages
plot(Cl(WIPRO.NS), type = "l", main = "Wipro Stock Price with Moving Averages")

lines(ma50, col = "blue")

lines(ma200, col = "red")


# Calculate the Bollinger Bands
bbands <- BBands(Cl(WIPRO.NS), n = 20, maType = "SMA")
head(bbands)

# Plot the Bollinger Bands
plot(Cl(WIPRO.NS), type = "l", main = "Wipro Stock Price with Bollinger Bands")

lines(bbands$dn, col = "blue")

lines(bbands$ma, col = "red")

lines(bbands$up, col = "green")

# Calculate the RSI
rsi <- RSI(Cl(WIPRO.NS), n = 14)
head(rsi)

# Plot the RSI
plot(rsi, type = "l", main = "Relative Strength Index")



