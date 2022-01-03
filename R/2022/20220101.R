library(tidyverse)
library(ggfx)
library(here)

dark <- "#394047"
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
 axis.ticks = element_blank(),
 legend.position = "none",
 text = element_text(color = accent),
 title = element_text(size = rel(1.2)),
 plot.margin = margin(2, 2, 2, 2, "cm"),
)

dat %>%
  ggplot(aes(x = x, y = y, color = z)) +
  with_shadow(
    geom_line(size = .2, alpha = 1),
    x_offset = 10,
    y_offset = 15,
    sigma = 7
  ) +
  with_blur(
    geom_point(aes(x = x, y = y), size = 4.5, color = spot, alpha = .10),
    sigma = 1.5
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

ggsave(
  "20220101_light_lines.png",
  device = "png",
  path = here("output"),
  width = 16,
  height = 9,
  units = "in",
  dpi = 600
)
