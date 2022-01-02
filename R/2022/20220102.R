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
 plot.title = element_text(size = rel(2.5)),
 plot.subtitle = element_text(size = rel(1.5), margin = margin(5, 1, 15, 1, "pt")),
 plot.caption = element_text(size = rel(1)),
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

# Original
dither(img, scale = 100, original = TRUE) +
 labs(caption="Original")
