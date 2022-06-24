

## Shiny modules are self-contained. So variables will be stay inside its own namespace. If wanted to transfer data out, need to use return value to pass the value.

## You can think of the code inside the module UI and Server poriton are residing in corresponding locations in the app.R file.

## When passing an reactive value into the module server funciton file, do not need to write as reactive_parameter(), instead using reactive_parameter. For example:
ABCUI <- function(id) {

selectInput(NS(id, "abc"), label = "test label", selected = c(1,4), choices = c(1,4), multiple =T))

}


ABCServer <- function(id, Reactive_Argument){

  stopifnot(is.reactive(Reactive_Argument))
  
  moduleServer(id, function(input, output, session)){
  
  
  ABC <- Reactive_Argument()
  
  }


}


## So in your server portion of the app.R file

XYZ <- reactivevalue(c(1,4))

ABCServer(id = "Test_ID", Reactive_Argument = XYZ)    ## Here the reactive value XYZ should NOT write as XYZ() or it will cause error.
