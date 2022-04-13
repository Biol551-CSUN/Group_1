# To install the latest version from Github:
# install.packages("devtools")
#devtools::install_github("tylermorganwall/rayshader")

library(here)
library(rayshader)
library(sp)
library(raster)
library(scales)
library(rgdal)
library(tidyverse)

#elevation = raster::raster(here("Data","section_SMM.tif"))
elevation <- raster::raster(here("Data","section_SMM.tif"))

height_shade(raster_to_matrix(elevation)) %>%
  plot_map() #height_shade generates the first layer of shades, depending on elevation

samo <- raster_to_matrix(elevation) #raster_to_matrix() transforms the original raster file to a 3D matrix of points

samo %>%
  sphere_shade(texture = "imhof3") %>% #texture makes reference to the color of the surface, the package offers predefined options
  add_water(detect_water(samo), color = "#233aa1") %>% 
  add_shadow(ray_shade(samo), 0.5) %>% #generate fine-scale shades from sun
  add_shadow(ambient_shade(samo), 0) %>%
  #generate shades from atmospheric scattering
  plot_3d(samo,
          zscale = 10,
          fov = 0,
          theta = 135,
          zoom = 0.60,
          phi = 45,
          windowsize = c(800, 600))

render_scalebar(limits=c(0, 5, 10, 15), #render a scalebar on top of the rendered map
                segments = 3, 
                label_unit = "km",
                position = "W")

render_compass(position = "E") #render a compass on top of the rendered map

render_label(samo, x = 160, y = 410, z = 7000, zscale = 50,
             text = "Point Dume", textcolor = "darkred", linecolor = "darkred",
             textsize = 2, linewidth = 5) #render a label on top of the rendered map


Sys.sleep(0.2) #delays the next function 0.2 seconds
render_snapshot()