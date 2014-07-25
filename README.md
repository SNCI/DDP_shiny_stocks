DDP_shiny_stocks
================

Shiny project for Develop Data Products Coursera

User Guide
1. Select one or more stocks by checking the box next to the name(s)
	Default stock is Microsoft
	Each chart will have price, trade volume, and a default technical analysis indicator called Bollinger Band which quantifies the aspect of volatility of price movement.
2. Select the Technical Analysis Indicator from drop-down list
	Default indicator is MACD (Moving Average Convergence and Divergence) which quantifies the aspect of trend of stock prices
	Additionally, you can choose RSI - Relative Strength Indicator which quantifies the momentum aspect of stock price movement; and SMI - Stochastic Momentum Indicator, which quantifies the momentum aspect in a different perspective.
3. Select Chart type from the drop-down list
	Default is Candlestick which plots the High, Low, Open, Close of a stock at each time series points 
4. Select the number of time periods (number of data points) to plot by sliding on the slider.
	Default is 50 periods.  Maximum is 100 periods.
5. Select Time unit for each period
	Defaulf is Days (each data point represents the price information on a daily basis)
6. Select if you want the data series displayed on a log scale (which helps to see trends better).
	Default scale is linear.
7. Once you are happy with previous selections, hit Go! to refresh the chart(s).
