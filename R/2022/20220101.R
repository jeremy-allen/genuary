library(tidyverse)
library(ggfx)

dark <- "#212529"
light <- "#DEE2E6"
accent <- "#33cccc"
spot <- "#ffb366"

dat <- tibble(
 x = seq(1:5000),
 y = sample(1:5000, 5000, replace = TRUE),
 z = sample(c(light, accent), 5000, replace = TRUE)
) 

my_theme <- theme(
 panel.background = element_rect(fill = dark, color = dark),
 panel.grid = element_blank(),
 plot.background = element_rect(fill = dark, color = dark),
 axis.title = element_blank(),
 axis.text = element_blank(),
 legend.position = "none",
 text = element_text(color = accent),
 title = element_text(size = rel(.8)),
 plot.margin = margin(2, 2, 2, 2, "cm"),
)

dat %>%
 ggplot(aes(x = x, y = y, color = z)) +
 geom_line(size = .2, alpha = 1) +
  with_blur(
    geom_point(aes(x = x, y = y), size = 3, color = spot, alpha = .15),
    sigma = .8
  ) +
 geom_point(aes(x = x, y = y), size = .15, color = spot, alpha = 1) +
 scale_color_identity() +
 labs(
  title = "Ten Thousand Line Lights",
  subtitle = "Genuary 2022-01-01",
  caption = "@jeremy_data",
  x = NULL,
  y = NULL
 ) +
 my_theme
