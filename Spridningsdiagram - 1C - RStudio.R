library(ggplot2)
library(RColorBrewer)
library(readxl)

dir <- "//ad.liu.se/home/magna015/Documents/Grundläggande Statistik/VIS2/Data"
setwd(dir)

data <- read_excel("VIS1 Lon.xlsx")
data2 <- read_excel("VIS1 Lon2.xlsx")

ggplot(data, aes(x = Alder,
                 y = Lon)) +
  geom_point(color = "red",
             size = 2) +
  geom_smooth(data = data,
              aes(color = "data"),
              method = lm,
              se = FALSE) +
  geom_smooth(data = data2,
              aes(color = "data2"),
              method = lm,
              se = FALSE) +
  scale_x_continuous(breaks = seq(from = 0, to = 47.5, by = 5)) +
  scale_color_manual(name = "Regressionslinjer",
                     values = c("data2" = "blue",
                                "data"= "red"),
                     labels = c("data2" = "Utan extremvärden",
                                "data" = "Hela datamaterialet")) +
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
          element_line(color = "gray"),
        panel.grid.minor.x = 
          element_line(color = "light gray"),
        panel.grid.major.y = 
          element_line(color = "gray"),
        panel.grid.minor.y = 
          element_line(color = "light gray")) + 
  labs(title = "Lönefördelning efter Ålder",
       x = "Ålder",
       y = "Lön",
       caption = "Källa: Hietala (2019)")

?scale_x_discrete()
  