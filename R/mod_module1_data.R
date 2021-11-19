#' module1_data UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_module1_data_ui <- function(id){
  ns <- NS(id)
  
  fluidPage(
    
    sidebarLayout(
      
      sidebarPanel( 
        h3("Data import"),
        hr(),
        
        selectInput(ns("dataset"), label = "Choose a Dataset", 
                    choices = c(
                      "mtcars" = "mtcars", 
                      "iris" = "iris"
                    ), selected= "mtcars")
        
      ),
      
      mainPanel(
        dataTableOutput(ns("datatable")) 
      )
      
      
    )
  )
  
  
  
  
}

#' module1_data Server Functions
#'
#' @noRd 
mod_module1_data_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
    
    
    observe({
      values$data_imported <- get(input$dataset)
    }) 
    
    Data <- reactive({
      Data <- values$data_imported
      return(Data)
    })
    
    output$datatable<-renderDataTable({ Data()  })
    
  })
}

## To be copied in the UI
# mod_module1_data_ui("module1_data_ui_1")

## To be copied in the server
# mod_module1_data_server("module1_data_ui_1")
