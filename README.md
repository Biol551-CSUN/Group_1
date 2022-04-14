# Group 1

## Diego Gomez  
## Manroop Banipal  
## Jessica Hunter  


# Rayshader package

Introduction: 

In this repository we will be walking through the package “Rayshader” this package is made to created 3D maps and plots! Through this repository we will talk about how this package works specifically as well as how you can use various functions from the package to create your own 3D map or plot. 

## Folder Components: 
[Data folder](https://github.com/Biol551-CSUN/Group_1/tree/main/Data): Map Data, including geoTIF's of SF Valley and Santa Monica Mountains.


[Scripts folder](https://github.com/Biol551-CSUN/Group_1/tree/main/Scripts): Plots and Maps created through the script posted .


[Output folder](https://github.com/Biol551-CSUN/Group_1/tree/main/Output): Slides walking through the different aspects of Rayshader, Rmarkdown file for easy follow-up.


## Functions Reviewed:

raster_to_matrix():This function turns the raster file into a matrix file that’s easier to work with
 
plot_gg():This function is arguably the most important part of this package. The function works in conjunction with ggplot2 to take an object and through aesthetics/fill color the plot can be made into a 3D visualization.

detect_water() & add_water():This function uses an algorithm to find wide flat areas to detect water. It can be adjusted to only include flat areas of a minimal area. detect_water() function uses a flood to fill algorithm to detect where bodies of water would be present. The add_water() can then be used in conjunction with detect_water() to fill this area the color of the fill can also be customized. The customization can be done via manually entering a color name. Alternatively the sphere_shade palette can be used to get a more accurate or matching hue. 

sphere_shade():The sphere_shade() function has two main parts to it. This function acts to add texture to a map or hillshade through spherical mapping and color selection. This function also has a total of 7 preset palettes which can be used to add color to different aspects of the map.

add_shadow(): This functions combines the functions height_shade() and lamb_shade() which is then scaled and applied to create shadows on the map.

height_shade(): is able to determine a color for each surface point through an elevation to color map ie. it color matches your surface to what seems to be most accurate.

lamb_shade(): is used to set up the direction in which light is hitting your map and in doing so it also creates the shadow based on the manner in which light is reflected on the map.

plot_3d(): can be used interchangeably with plot_gg on ggplots but is more specifically used for forming 3D aspects on maps in maps specifically alongside making 3D it also provides texture and elevation matrix.

render_scalebar():This function is used to simply add a 3D scale bar to your map.

render_compass():This function allows you to add a 3D compass to your map.

render_label():This function allows for you to add x and y labels to your map which you can align with specified altitude in the map’s matrix. 
