packages <- c("remotes", "rmarkdown", "flexdashboard", "igraph", "reactable", "htmltools")

for (p in packages) {
   install.packages(p)
}

remotes::install_github("hadley/emo")
remotes::install_version("dplyr", "1.0.2", repos = "cran.rstudio.com")
remotes::install_version("highcharter", "0.8.2", repos = "cran.rstudio.com")
