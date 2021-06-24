# Define UI for application that draws a histogram
ui <- dashboardPage(
  
  dashboardHeader(title = "Rhizotest Data Prout"),
  dashboardSidebar(
    sidebarMenu(
      menuItem("Data", tabName = "dashboard", icon = icon("database")),
      menuItem("Analysis", tabName = "widgets", icon = icon("seedling"))
    )
  ),
  dashboardBody(
    # Boxes need to be put in a row (or column)
    tabItems(
      # First tab content
      tabItem(tabName = "dashboard",
              fluidRow(width = 12,
                box(width = 6,
                      selectInput("select",
                            label = "Select dataset", 
                            choices = list(
                              "55 Sols" = "55sols",
                              "Suminap" = "Suminap",
                              "Choice 3" = "autre",
                              "Voiture" = "cars"), 
                            selected = "55sols")
                )
              ),
              fluidRow(width = 12,
                box(width = 8,
                  DT::dataTableOutput('tbl2')
                ),
                box(width = 4,
                    leafletOutput("mymap"),
                    p(),
                    actionButton("recalc", "New points")
                    )
              )
              
      ),
      
      # Second tab content
      tabItem(tabName = "widgets",
              "Widgets tab content",
              fluidRow(width = 12,
                       box(width = 6,
                           selectInput("select2",
                                       label = "Select dataset", 
                                       choices = list(
                                         "55 Sols" = "55sols",
                                         "Suminap" = "Suminap",
                                         "Choice 3" = "autre",
                                         "Voiture" = "cars"), 
                                       selected = "55sols")
                       )
              ),
              fluidRow(
                box(
                  plotOutput('plot1')
                )
              )
              
      )
    )
  ),
  skin = "green"
)