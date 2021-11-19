#' module2_analysis UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_module2_analysis_ui <- function(id){
  ns <- NS(id)
  #tagList(  )
  
  fluidPage(
    sidebarLayout(
      sidebarPanel(          
        h3("Univariate Numerical Data Analysis"),
        hr(),
        selectizeInput(ns("numvar"), label = "Select a numerical variable", 
                       choices = names(mtcars), multiple = FALSE), 
        radioButtons(
          inputId = ns("descriptive"),
          label = "Descriptive Statistics",
          choices = c(
            "Numerical summary" = "summary",
            "Histogram" = "Histplot"
          )
        ),
        
        
      ),
      
      
      
      mainPanel(
        
        conditionalPanel(
          condition = "input.descriptive=='summary' ",
          verbatimTextOutput(ns("summary")), ns=ns
        ),
        conditionalPanel(
          condition = "input.descriptive=='Histplot' ",
          plotOutput(ns("histogram")), ns=ns
        )
        
        
        
      )
      
      
    )
  )
  
}

#' module2_analysis Server Functions
#'
#' @noRd 
mod_module2_analysis_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
    
    Data <- reactive({
      Data <- values$data_imported
      return(Data)
    })
    
    
    observe({
      updateSelectizeInput(session, "numvar", 
                           choices = names(Data())  )
      
    })
    
    
    output$summary <- renderPrint({
      summary(Data()[, input$numvar])
    })
    
    output$histogram<- renderPlot({
      hist(Data()[, input$numvar])
      
    })
    
  })
}

## To be copied in the UI
# mod_module2_analysis_ui("module2_analysis_ui_1")

## To be copied in the server
# mod_module2_analysis_server("module2_analysis_ui_1")
