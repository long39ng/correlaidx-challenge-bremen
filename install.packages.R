packages <- c("remotes", "rmarkdown", "flexdashboard", "igraph", "reactable", "htmltools", "highcharter", "shiny", "dplyr")

for (p in packages) {
   install.packages(p)
}

remotes::install_github("hadley/emo")