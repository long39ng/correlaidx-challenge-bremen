packages <- c("rmarkdown", "flexdashboard", "igraph", "reactable", "htmltools", "highcharter")

for (p in packages) {
   print(p)
   install.packages(p)
}

remotes::install_github("hadley/emo")