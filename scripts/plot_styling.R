library(ggplot2)
library(ggtext)
library(hrbrthemes)

# Set theme ---------------------------------------------------------------

theme_long <- function() {
  ret <- theme_ipsum_rc(
    grid = FALSE,
    axis_title_size = 11.5,
    axis_title_face = "bold"
  )
  ret <- ret + theme(
    plot.title = element_markdown(),
    plot.subtitle = element_markdown(),
    plot.caption = element_markdown(),
    # strip.text = element_text(face = "bold"),
    legend.position = "top",
    plot.title.position = "plot",
    plot.caption.position = "plot",
    axis.text = element_text(margin = margin(t = 2, r = 2)),
    axis.text.x = element_text(margin = margin(t = 2)),
    axis.text.y = element_text(margin = margin(r = 2)),
  )
  ret
}

theme_set(theme_long())

# Function to specify grid lines ------------------------------------------

panel_grid <- function(grid = "XY", on_top = FALSE) {
  ret <- theme(panel.ontop = on_top)
  if (grid == TRUE || is.character(grid)) {
    if (on_top == TRUE) 
      grid_col <- "#ffffff"
    else 
      grid_col <- "#cccccc"
    ret <- ret + theme(panel.grid = element_line(colour = grid_col, 
                                                 size = .2))
    ret <- ret + theme(panel.grid.major = element_line(colour = grid_col, 
                                                       size = .2))
    ret <- ret + theme(panel.grid.major.x = element_line(colour = grid_col, 
                                                         size = .2))
    ret <- ret + theme(panel.grid.major.y = element_line(colour = grid_col, 
                                                         size = .2))
    ret <- ret + theme(panel.grid.minor = element_line(colour = grid_col, 
                                                       size = .2))
    ret <- ret + theme(panel.grid.minor.x = element_line(colour = grid_col, 
                                                         size = .2))
    ret <- ret + theme(panel.grid.minor.y = element_line(colour = grid_col, 
                                                         size = .2))
    if (is.character(grid)) {
      if (!grepl("X", grid)) 
        ret <- ret + theme(panel.grid.major.x = element_blank())
      if (!grepl("Y", grid)) 
        ret <- ret + theme(panel.grid.major.y = element_blank())
      if (!grepl("x", grid)) 
        ret <- ret + theme(panel.grid.minor.x = element_blank())
      if (!grepl("y", grid)) 
        ret <- ret + theme(panel.grid.minor.y = element_blank())
      if (grid != "ticks") {
        ret <- ret + theme(axis.ticks = element_blank())
        ret <- ret + theme(axis.ticks.x = element_blank())
        ret <- ret + theme(axis.ticks.y = element_blank())
      } else {
        ret <- ret + theme(axis.ticks = element_line(size = .2))
        ret <- ret + theme(axis.ticks.x = element_line(size = .2))
        ret <- ret + theme(axis.ticks.y = element_line(size = .2))
        ret <- ret + theme(axis.ticks.length = grid::unit(4, "pt"))
      }
    }
  } else {
    ret <- theme(panel.ontop = FALSE)
    ret <- ret + theme(panel.grid = element_blank())
    ret <- ret + theme(panel.grid.major = element_blank())
    ret <- ret + theme(panel.grid.major.x = element_blank())
    ret <- ret + theme(panel.grid.major.y = element_blank())
    ret <- ret + theme(panel.grid.minor = element_blank())
    ret <- ret + theme(panel.grid.minor.x = element_blank())
    ret <- ret + theme(panel.grid.minor.y = element_blank())
  }
  ret
}
