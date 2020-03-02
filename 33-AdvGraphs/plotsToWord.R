#plots to Word
#https://davidgohel.github.io/officer/articles/offcran/graphics.html

library(officer)
#officer is not producing the image, it only provides functions to add a produced image into a Word document.
library(devEMF)
library(magrittr)
library(ggplot2)


# ggplot example
gg <- ggplot(mtcars, aes(x = mpg , y = wt, colour = qsec)) + geom_point() + theme_minimal()

# produce an emf file containing the ggplot
filename <- tempfile(fileext = ".emf")
emf(file = filename, width = 6, height = 7)
print(gg)
dev.off()

read_docx() %>% 
  body_add_img(src = filename, width = 6, height = 7) %>% 
  print(target = "E:/graphs/demo_emf.docx")


#------




#-----
#PowerPoint documents and graphics
Raster images and vector graphic images are added in a PowerPoint document as a shape on the current slide. In PowerPoint, images and text can not be mixed in the same shape (or placeholder). officer provides a function ph_with to let users add images into a PowerPoint document:
  
#Again those functions accept various image formats: png, jpeg and emf.

read_pptx() %>% 
  add_slide(layout = "Title and Content", master = "Office Theme") %>% 
  ph_with(external_img(src = filename, width = 6, height = 7), 
          location = ph_location_type(type = "body"), use_loc_size = FALSE ) %>% 
  add_slide(layout = "Title Only", master = "Office Theme") %>% 
  ph_with(external_img(src = filename, width = 6, height = 7), 
          location = ph_location(left = 0, top = 0, width = 6, height = 7) ) %>% 
  print(target = "E:/graphs/demo_emf.pptx")
