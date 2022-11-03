# library(tidyverse)
#
# foo <- dplyr::bind_rows(
#   add_column(ds_94_4, experiment = "94_4"),
#   add_column(ds_380, experiment = "380")
#   )
#
# foo %>%
#   ggplot(mapping = aes(x = cycle, y = fluor, group = interaction(well, experiment), col = experiment)) +
#   geom_line(size = 0.1) +
#   labs(y = "Raw fluorescence", colour="Experiment", title = "Four-point 10-fold dilution series") +
#   guides(color = guide_legend(override.aes = list(size = 0.5)))
