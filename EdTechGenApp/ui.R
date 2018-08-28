

library(shiny)
library(future)
plan(multiprocess)


fluidPage(
  titlePanel("Uploading Video Files"),
  
  sidebarLayout(
    sidebarPanel(
      fileInput('video', 'Choose file to upload',
                accept = c(
                  'text/csv',
                  'text/comma-separated-values',
                  'text/tab-separated-values',
                  'text/plain',
                  '.csv',
                  '.tsv',
                  '.mp4'
                )
      ),

      tags$hr(),
      p('If you want a sample .mp4 to upload,',
        'you can first download the sample',
        a(href = "https://drive.google.com/uc?export=download&id=1RMW6rTGoHRJnEpaBR9xtrQxLrCEa_YQp", 'object_programming'), 'or',
        a(href = "https://drive.google.com/uc?export=download&id=10ErJ9A0YM249QwVzMZ4BUsFCLIvszdni", 'sociology'),
        'files, and then try uploading them.'
      ),
      
      textInput("keyword", "Keywords (separated by commas):", "Education, meteorogoly, etc"),
      selectInput("language", "Language:", choice = c("French" = "fr", "English" = "en")),
      
      actionButton("upload_to_gcs", "Upload")

    ),
    
    mainPanel(("Characteristics:"),
      textOutput("keyword"),
      textOutput("language")
    )
    
  )
)

