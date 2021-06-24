library(shiny)
library(shinydashboard)
library(DT)
library(ggplot2)
library(leaflet)


server <- function(input, output) {
  
  data <- reactive({
    switch(input$select,
           "55sols" = df1,
           "Suminap" = df2,
           "autre" = iris,
           "cars" = cars)
  })
  
 
  output$tbl2 <- DT::renderDataTable({
    DT::datatable(data())
  })
  
  points <- eventReactive(input$recalc, {
    cbind(rnorm(1) * 2 + 10, rnorm(1) + 47)
  }, ignoreNULL = FALSE)
  
  output$mymap <- renderLeaflet({
      leaflet() %>%
        addProviderTiles(providers$Stamen.TonerLite,
                         options = providerTileOptions(noWrap = TRUE)
        ) %>%
        addMarkers(data = points())
    })
  
  data2 <- reactive({
    switch(input$select2,
           "55sols" = df1,
           "Suminap" = df2,
           "autre" = iris,
           "cars" = cars)
  })
  
  output$plot1 <- renderPlot({
    ggplot(data = data2()) + 
      geom_point(aes(x = element, y = value))
  })
  
}
