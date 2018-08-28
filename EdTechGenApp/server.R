

# By default, the file size limit is 5MB. It can be changed by
# setting this option. Here we'll raise limit to 9MB.
options(shiny.maxRequestSize = 90*1024^2)

function(input, output) {
  
  # Upload video to the app
  output$video_upload <- reactive({ if (is.null(input$video)) return(NULL) })
  
  # Keywords setup
  output$keyword <- renderText({ if (is.null(input$keyword)) { return(NULL) } else { input$keyword } })
  
  # Language setup
  output$language <- renderText({input$language})
  
  # Transfert the vidéo to GCS
  observe({ if(input$upload_to_gcs > 0) { to.gcs.async(file = input$video, keywords = input$keyword, language = input$language) } })
  
}

