#' The application server-side
#' 
#' @param input,output,session Internal parameters for {shiny}. 
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
values = reactiveValues(data_imported=NULL)
app_server <- function( input, output, session ) {
  # Your application server logic 
  mod_module1_data_server("module1_data_ui_1")
  mod_module2_analysis_server("module2_analysis_ui_1")
  
}
