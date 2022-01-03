# genuary day 2 - dither

# remotes::install_github('cj-holmes/ditherer)
# see https://github.com/cj-holmes/ditherer/

library(here)
library(ditherer)
library(colorfindr)
library(ggplot2)
library(showtext)

font_add("dosis-r", regular = "Dosis-Regular.ttf")
showtext_auto()

set.seed(6)

img <- here("assets", "portrait.jpg")

tp <- colorfindr::get_colors(img) %>% 
 colorfindr::make_palette(n = 4, show = FALSE)

accent <- "#c43086"
dark <- "#291586"

my_theme <- theme(
 text = element_text(family = "dosis-r", color = accent),
 plot.title = element_text(size = rel(10)),
 plot.subtitle = element_text(size = rel(8), margin = margin(5, 1, 15, 1, "pt")),
 plot.caption = element_text(size = rel(5)),
 plot.margin = margin(2, 2, 2, 2, "cm"),
 panel.background = element_rect(fill = dark, color = accent),
 panel.grid = element_blank(),
 plot.background = element_rect(fill = dark, color = dark)
)

# Dithered (target palette)
dither(img, scale = 100, target_palette = tp) +
 labs(
  title = "Dither - Genuary Day 2",
  subtitle = "4 color target palette",
  caption = "@jeremy_data"
  ) +
 my_theme

ggsave(
  "20220102_portrait_dither.png",
  device = "png",
  path = here("output"),
  width = 8,
  height = 8,
  units = "in",
  dpi = 600,
  scale = 1
)
