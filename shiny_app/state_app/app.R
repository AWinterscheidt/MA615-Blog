#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(tidyverse)
library(usmap)

ANES_normalized_copy <- read.csv("ANES_normalized.csv")

replace_party <- function(x) {
  if_else (is.na(x),
           "Unkown",
           x) }
                                               
ANES_party_clean <- ANES_normalized_copy %>% 
  mutate(party = replace_party(party))

states <- ANES_party_clean %>% pull(state) %>% unique() %>% sort()
auth_choices <- c("Child Authoritarian", "Women Authoritarian",
                  "Foreign Authoritarian", "Rural Authoritarian", "Overall Score")

convert_value <- function(x) {
  if (x == "Child Authoritarian") {
    "child_score"
  }
  else if (x == "Women Authoritarian") {
    "women_score"
  }
  else if (x == "Foreign Authoritarian") {
    "foreign_score"
  }
  else if (x == "Rural Authoritarian") {
    "rural_score"
  }
  else {
    "score"
  }
}

# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("Authoritarianism on a State Level"),
    fluidRow (
      column(width = 5, wellPanel (helpText("Select which state, year, and 
                                            authoritarian variable to explore."),
                                   selectInput(inputId = "state", 
                                               label = "State", 
                                               choices = states),
                                   sliderInput(inputId = "year",
                                               label = "Year",
                                               min = 2000,
                                               max = 2020,
                                               2000,
                                               step = 4,
                                               sep = ""),
                                   selectInput(inputId = "auth_var", 
                                               label = "Var", 
                                               choices = auth_choices),
                                   p("An example of a child authoritarianism 
                                     question would be:", em("Which child trait 
                                     more important curiosity or good manners?")),
                                   p("An example of a women authoritarianism 
                                     question would be:", em("Do women demanding 
                                     equality seekspecial favors?")),
                                   p("An example of a foreign authoritarianism 
                                     question would be:", em("Is the US better 
                                     or worse than most other countries?")),
                                   p("An example of a rural authoritarian 
                                     question would be:", em("People in rural 
                                     areas get more or less from government?")),
                                   p("Overall score is composed from all four 
                                     authoritarian variables.")
                                   )),
             column(width = 7,
                    verbatimTextOutput("error"),
                    plotOutput("distPlot")
                    )
      )
    )
    
# Define server logic required to draw a histogram
server <- function(input, output) {
  
    output$distPlot <- renderPlot({
      ANES_party_clean %>% filter(state %in% input$state) %>% 
        filter(year %in% input$year) %>% 
        ggplot(aes_string(y = convert_value(input$auth_var), color = "party")) +
        geom_boxplot(aes(x = input$year)) +
        labs(x = input$year, y = input$auth_var)
    })
    
    output$error <- renderText({
      if (nrow(ANES_party_clean %>% filter(state %in% input$state) %>% 
          filter(year %in% input$year)) == 0) {
        "Sorry, there is no data for the combination you've entered as 
ANES survey questions have changed throughout the years. 
Please change your entries."
      }
      else {
        paste("Number of survey entries:", nrow(ANES_party_clean %>% 
                                          filter(state %in% input$state) %>% 
                                          filter(year %in% input$year)))
      }
    })
}

# Run the application 
shinyApp(ui = ui, server = server)
