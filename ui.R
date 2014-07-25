shinyUI(pageWithSidebar(
  headerPanel("Technical Analysis of Stocks"),
  
  sidebarPanel(
    wellPanel(
      p(strong("Stocks")),
      checkboxInput(inputId = "stock_msft", label = "Microsoft (MSFT)", value = TRUE),
      checkboxInput(inputId = "stock_ibm",  label = "IBM (IBM)",        value = FALSE),
      checkboxInput(inputId = "stock_yhoo", label = "Yahoo (YHOO)",     value = FALSE)
    ),
 
    selectInput(inputId = "ta_type",
				label = "Technical Analysis Indicator",
                choices = c("Moving Average Conv/Div" = "macd",
                            "Relative Strength Indicator" = "rsi",
                            "Stochastic Momentum Indicator" = "smi"),
				selected = "macd"
    ),

    selectInput(inputId = "chart_type",
                label = "Chart type",
                choices = c("Candlestick" = "candlesticks",
                            "Matchstick" = "matchsticks",
                            "Bar" = "bars",
                            "Line" = "line")
    ),
 
    wellPanel(
      p(strong("Date range (back from present)")),
      sliderInput(inputId = "time_num",
                  label = "Time number",
                  min = 1, max = 100, step = 1, value = 50),
 
      selectInput(inputId = "time_unit",
                  label = "Time unit",
                  choices = c("Days" = "days",
                              "Weeks" = "weeks",
                              "Months" = "months",
                              "Years" = "years"),
                  selected = "days")
    ),
 
	checkboxInput(inputId = "log_y", label = "log y axis", value = FALSE),
	
	submitButton("Go!")
  ),
 
  mainPanel(
	h4("[Do Not Use Internet Explorer - Online User Guide does not render in IE]"),
	
    conditionalPanel(condition = "input.stock_msft",
      br(),
      div(plotOutput(outputId = "plot_msft"))),

 
    conditionalPanel(condition = "input.stock_ibm",
      br(),
      div(plotOutput(outputId = "plot_ibm"))),
 
 
	conditionalPanel(condition = "input.stock_yhoo",
      br(),
      plotOutput(outputId = "plot_yhoo")),
	  
	textOutput("user_guide"),  
	textOutput("user_guide1"),  
	textOutput("user_guide11"),  
	textOutput("user_guide2"),
	textOutput("user_guide21"),
	textOutput("user_guide22"),
	textOutput("user_guide3"),  
	textOutput("user_guide31"),  
	textOutput("user_guide4"),  
	textOutput("user_guide41"),
	textOutput("user_guide5"),  
	textOutput("user_guide51"),  
	textOutput("user_guide6"),  
	textOutput("user_guide61"),  
	textOutput("user_guide7")  
  )
))