###         https://stackoverflow.com/questions/32588056/change-variable-outside-of-reactive-function-context

7

##If I understand your question correctly (you cannot update c inside the observeEvent function), you need to put your c variable in a reactive and change it inside the observeEvent:

variables = reactiveValues(a = FALSE, c = FALSE)

observeEvent(input$test, {
    variables$a = FALSE
    variables$c = TRUE
})

##Then you can use variables$c in your code, and anything depending on variables will be updated if you press the button (e.g. a plot).
