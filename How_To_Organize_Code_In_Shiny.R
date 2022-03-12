#  https://shiny.rstudio.com/tutorial/written-tutorial/lesson5/

#Here’s what we’ve learned so far:

#The shinyApp function is run once, when you launch your app
#The server function is run once each time a user visits your app
#The R expressions inside render* functions are run many times. Shiny runs them once each time a user change the value of a widget.
#How can you use this information?

#Source scripts, load libraries, and read data sets at the beginning of app.R outside of the server function. Shiny will only run this code once, which is all you need to set your server up to run the R expressions contained in server.

#Define user specific objects inside server function, but outside of any render* calls. These would be objects that you think each user will need their own personal copy of. For example, an object that records the user’s session information. This code will be run once per user.

#Only place code that Shiny must rerun to build an object inside of a render* function. Shiny will rerun all of the code in a render* chunk each time a user changes a widget mentioned in the chunk. This can be quite often.

#You should generally avoid placing code inside a render function that does not need to be there. Doing so will slow down the entire app.
