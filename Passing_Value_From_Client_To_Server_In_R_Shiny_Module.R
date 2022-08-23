###  https://rdrr.io/cran/shinyjs/man/hidden.html

if (interactive()) {
  library(shiny)
  shinyApp(
    ui = fluidPage(
      useShinyjs(),  # Set up shinyjs
      actionButton("btn", "Click me"),
      hidden(
        p(id = "element", "I was born invisible")
      )
    ),
    server = function(input, output) {
      observeEvent(input$btn, {
        show("element")
      })
    }
  )
}

library(shiny)
hidden(span(id = "a"), div(id = "b"))
hidden(tagList(span(id = "a"), div(id = "b")))
hidden(list(span(id = "a"), div(id = "b")))


## For A Module

library(shiny)
library(shinyjs)

## define a function first. Here the purpose is only to send numeric value.  Basically what happened here is to passing an NumericInput to the server but hide it using additional javascript hidden() function.
sendNumericValueToServer <- function(id, Numeric_value) {
  hidden(numericInput(
    id, "If you can see this, you forgot use Shinyjs()", Numeric_value
  ))
}

Module_UI <- function(id, pass_value = c(1, 2) ){
  
  
  tagList(
  sendNumericValueToServer(NS(id, "param_id"), value=pass_value),
 
  )
  
}



Module_Server <- function(id){

moduleServer(id, function(input, output, session) {
    

    inital_value <- isolate(input$param_id)
    
    selected_value <- reactiveValues(bins = inital_value)

}




