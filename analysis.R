#Cynthia Cisneros

library(dplyr)
library(usmap)
library(plotly)
library(ggplot2)

df <- read.csv("characters.csv")

#  An introduction of the problem domain and a description of the variable(s) you are choosing to analyze (and why!)
#A paragraph of summary information, citing at least 5 values calculated from the data
#A chart that shows trends over time for a variable of your choice
#A chart that compares two variables to one another
#A map that shows how your measure of interest varies geographically
#See below for additional information for each component. 

#Introduction + Summary Information
#As you introduce your report and the dataset, you should describe the variables that you've chosen to analyze. In doing so, make clear which measure(s) of incarceration you are focusing on. 

#Then, you will share at least 5 relevant values of interest. These will likely be calculated using your DPLYR skills, answering questions such as: 

#What is the average value of my variable across all the counties (in the current year)?
#Where is my variable the highest / lowest?
#How much has my variable change over the last N years?
#Feel free to calculate and report values that you find relevant. Again, remember that the purpose is to think about how these measure of incarceration vary by race. 

#Trends over time chart

#The first chart that you'll create and include will show the trend over time of your variable/topic. Think carefully about what you want to communicate to your user (you may have to find relevant trends in the dataset first!). Here are some requirements to help guide your design:
  
#  Show more than one, but fewer than ~10 lines: your graph should compare the trend of your measure over time. This may mean showing the same measure for different locations, or different racial groups. Think carefully about a meaningful comparison of locations (e.g., the top 10 counties in a state, top 10 states, etc.)
#You must have clear x and y axis labels,
#The chart needs a clear title 
#You need a legend for your different line colors, and a clear legend title
#In your .Rmd file, make sure to describe why you included the chart, and what patterns emerged
#When I say "clear" or "human readable" titles and labels, that means that you should not just display the variable name.

#Variable comparison chart

#The second chart that you'll create and include will show how two different (continuous) variables are related to one another. Again, think carefully about what such a comparison means, and want to communicate to your user (you may have to find relevant trends in the dataset first!). Here are some requirements to help guide your design:

#You must have clear x and y axis labels,
#The chart needs a clear title 
#If you choose to add a color encoding (not required), you need a legend for your different color and a clear legend title
#In your .Rmd file, make sure to describe why you included the chart, and what patterns emerged
#Map

#The last chart that you'll create and include will show how a variable is distributed geographically. Again, think carefully about what such a comparison means, and want to communicate to your user (you may have to find relevant trends in the dataset first!). Here are some requirements to help guide your design:
  
#  Your map needs a title
#Your color scale needs a legend with a clear label
#Use a map based coordinate system to set the aspect ratio of your map (see reading)
#Use a minimalist theme for the map (see reading)
#In your .Rmd file, make sure to describe why you included the chart, and what patterns emerged


