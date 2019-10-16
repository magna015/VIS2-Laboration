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

data <- read_excel("VIS2 Narkotikabrott - Regionsdata.xlsx")


#the main body of the script, using different functions to draw the
#graph and tweak the specific outputs, such as color-schemes and text

ggplot(data) +
  
  
  #tells RStudio which data from the data set to be used on what axis,
  #and in which way it is to colorize and group them
  
  aes(x = År,
      y = Antal,
      color = Region,
      group = Region) +
  
  
  #the actual graph, setting both line size
  #and which colors to be used in the graph
  
  geom_line(size = 1.2) +
  scale_color_manual(values =
                       c(brewer.pal(n = 3, "Reds")[-1])) +
  
  
  #sets the general theme of the axis and grid lines,
  #as well as locations of the different titles and
  #colors of the grid lines
  
  theme_bw() +
  theme(axis.title.y =
          element_text(angle = 0,
                       hjust = 1,
                       vjust = 0.5),
        plot.title = 
          element_text(hjust = 0.5),
        plot.subtitle =
          element_text(hjust = 0.5),
        panel.grid.major.x =
          element_line(color = "dark gray"),
        panel.grid.minor.x =
          element_line(color = "gray"),
        panel.grid.major.y =
          element_line(color = "dark gray"),
        panel.grid.minor.y =
          element_line(color = "gray")) +
  
  
  #changes the names of titles, including the axis titles
  
  labs(y = "Antal",
       x = "Årtal",
       title = "Antal anmälda våldsbrott per 100 000 invånare",
       subtitle = "Jämförelse av Östergötland och Stockholms län",
       caption = "Källa: Brottsförebyggande Rådet (BRÅ)")
