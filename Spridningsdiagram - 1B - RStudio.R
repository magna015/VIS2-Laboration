#activates required packages for the script to run

library(ggplot2)
library(RColorBrewer)
library(readxl)


#sets the working directory of the script,
#where all the data is taken from and saved into

dir <- "//ad.liu.se/home/magna015/Documents/Grundläggande Statistik/VIS2/Data/"
setwd(dir)


#reads the data into a variable that can be used,
#making it easier to call upon that data later

data <- read_excel("VIS1 Lon.xlsx")


#the main body of the script, using different functions to draw the
#graph and tweak the specific outputs, such as color-schemes and text

ggplot(data,
       
       
       #tells RStudio which data from the data set to be used on what axis,
       #and in which way it is to colorize and group them
       
       aes(x = Alder,
                 y = Lon)) +
  
  
  #the actual graph, setting both line size, grouping
  #and which colors to be used in the graph
  
  geom_point(color = "red",
             size = 2) +
  geom_smooth(method = lm,
              se = FALSE,
              color = "red") +
  
  
  #sets the general theme of the axis and grid lines,
  #as well as locations of the different titles and
  #colors of the grid lines
  
  theme_bw() +
  theme(axis.title.y = 
          element_text(angle = 0, 
                       hjust = 1, 
                       vjust = 0.5,
                       size = 15),
        axis.title.x =
          element_text(size = 15), #scales font size
        axis.text.x =
          element_text(size = 12,
                       face = "bold"), #scales font size
        axis.text.y =
          element_text(size = 12,
                       face = "bold"), #scales font size
        plot.title = 
          element_text(hjust = 0.5,
                       size = 18,
                       face = "bold"),
        plot.caption = 
          element_text(hjust = 1,
                       size = 15),
        panel.grid.major.x = 
          element_line(color = "gray"),
        panel.grid.minor.x = 
          element_line(color = "light gray"),
        panel.grid.major.y = 
          element_line(color = "gray"),
        panel.grid.minor.y = 
          element_line(color = "light gray")) +
  
  
  #changes the names of titles, including the axis titles
  
  labs(title = "Lönefördelning efter Ålder",
       x = "Ålder",
       y = "Lön",
       caption = "Källa: Hietala (2019)")
