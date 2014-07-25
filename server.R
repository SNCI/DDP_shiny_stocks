if (!require(quantmod)) {
  stop("This app requires the quantmod package. To install it, run 'install.packages(\"quantmod\")'.\n")
}
 
# Download data for a stock if needed, and return the data
require_symbol <- function(symbol, envir = parent.frame()) {
  if (is.null(envir[[symbol]])) {
    envir[[symbol]] <- getSymbols(symbol, auto.assign = FALSE)
  }
 
  envir[[symbol]]
}
 
 
shinyServer(function(input, output) {
 
  # Create an environment for storing data
  symbol_env <- new.env()
 
  # Make a chart for a symbol, with the settings from the inputs
  make_chart <- function(symbol) {
    symbol_data <- require_symbol(symbol, symbol_env)
 
    chartSeries(symbol_data,
                name      = symbol,
                type      = input$chart_type,
                subset    = paste("last", input$time_num, input$time_unit),
                log.scale = input$log_y,
                theme     = "white", 
				TA = "addBBands();"
				)
	if (input$ta_type == "macd") {
		addMACD()
	} 
	else if (input$ta_type == "rsi") {
		addRSI()
	} 
	else if (input$ta_type == "smi") {
		addSMI()
	} 
	
	
  }
 
  output$plot_msft <- renderPlot({ make_chart("MSFT") })
  output$plot_ibm  <- renderPlot({ make_chart("IBM")  })
  output$plot_yhoo <- renderPlot({ make_chart("YHOO") })
  output$user_guide <- renderText({"User Guide"})
	output$user_guide1 <- renderText({"1. Select one or more stocks by checking the box next to the name(s)"})
		output$user_guide11 <- renderText({"Default stock is Microsoft.  Each chart will have price, trade volume, and a default technical analysis indicator called Bollinger Band which quantifies the aspect of volatility of price movement."})
	output$user_guide2 <- renderText({"2. Select the Technical Analysis Indicator from drop-down list"})
		output$user_guide21 <- renderText({"  Default indicator is MACD (Moving Average Convergence and Divergence) which quantifies the aspect of trend of stock prices."})
		output$user_guide22 <- renderText({"  Additionally, you can choose RSI - Relative Strength Indicator which quantifies the momentum aspect of stock price movement; and SMI - Stochastic Momentum Indicator, which quantifies the momentum aspect in a different perspective."})
	output$user_guide3 <- renderText({"3. Select Chart type from the drop-down list"})
		output$user_guide31 <- renderText({"  Default is Candlestick which plots the High, Low, Open, Close of a stock at each time series points."})
	output$user_guide4 <- renderText({"4. Select the number of time periods (number of data points) to plot by sliding on the slider."})
		output$user_guide41 <- renderText({"  Default is 50 periods.  Maximum is 100 periods."})
	output$user_guide5 <- renderText({"5. Select Time unit for each period"})
		output$user_guide51 <- renderText({"  Defaulf is Days (each data point represents the price information on a daily basis)"})
	output$user_guide6 <- renderText({"6. Select if you want the data series displayed on a log scale (which helps to see trends better)."})
		output$user_guide61 <- renderText({"  Default scale is linear."})
	output$user_guide7 <- renderText({"7. Once you are happy with previous selections, hit Go! to refresh the chart(s)"})

  
})