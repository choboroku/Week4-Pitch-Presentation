# Week4-Pitch-Presentation

This repo contains the codes to reproduce the Pitch Presentation Assignment.
Below are the intructions to run the app in R command-line, and in R Studio.
It is assumed the user has Shiny installed. Otherwise,  use the command

```
install.package('shiny')
```

# R command line

```
library(shiny)
source('ui.R')
source('server.R')
shinyApp(ui=ui, server=server)
```

The web browser should display the app. 

# R Studio
The instructions above can be used also in R Studio.
There is a file called week4.shiny.R in the repo. Open it in R Studio, and press
the button Run App located at the top of the editor. The app should appear shortly.