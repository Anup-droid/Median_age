library(gganimate)
library(ggplot2)
library(gapminder)
library(ggthemes)
library(gifski)
library(readr)
library(tidyr)
library(tidyverse)
library(viridis)
library(viridisLite)
library(readxl)

#Read required data
median <- read_excel("C:/Users/Anup Kumar/Desktop/R-Code/Data_Visualization/Anim_line_Race/median.xlsx")

#Filter the data 1950-2050
median = median %>% filter(Year<2051)

#Plot Base Graph
m_anim <- median %>%
  ggplot(aes(x = Year, y = Median_age, color = Country)) +
  geom_line(linewidth = 2, alpha = 0.75) +
  theme_solarized_2(light = FALSE) +
  labs(title = "Median age,1950-2050",
       subtitle = "The median age divides the population into two parts of equal size",
       caption = "Source: United Nations, World Population Prospects (2022).
                  Note: 1950 to 2021 show historical estimates.
                  From 2022 the UN projections (medium variant) are shown",
       y = "Median age",
       x = "Year") +
  theme(
    text = element_text(family = "DM Sans Medium", colour = "#EEEEEE"),
    title = element_text(color = "#EEEEEE"),
    axis.title.x = element_blank(),
    panel.background = element_rect(fill = NA),
    plot.background = element_rect(fill = "#111111"),
    panel.grid.major = element_blank(),
    panel.grid.minor = element_blank(),
    legend.background = element_blank(),
    legend.key = element_blank(),
    legend.position = "bottom",
    plot.title = element_text(vjust = 1),
    plot.subtitle = element_text(size = 10)
  ) +
  scale_color_viridis(discrete = TRUE) +
  geom_point() +
  scale_x_continuous("Year", breaks = seq(1950, 2050, 20))+
  transition_reveal(Year) +
  view_follow(fixed_y = TRUE)

#Make animated graph
anim_med=animate(
  m_anim,
  height = 400,
  width = 600,
  fps = 15,
  duration = 20,
  end_pause = 30,
  res = 100
)

#Save animated graph
anim_save("C:/Users/Anup Kumar/Desktop/R-Code/Data_Visualization/Anim_line_Race/median.gif",)
