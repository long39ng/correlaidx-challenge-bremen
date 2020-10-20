packages <- c("remotes", "rmarkdown", "flexdashboard", "igraph", "reactable", "htmltools", "shinyjs")

for (p in packages) {
   install.packages(p)
}

remotes::install_github("hadley/emo")
# fixing dplyr and highcharter versions is necessary
# bc the default install.packages are older versions that result in a nasty error
# related to `hc-key` inside mutate (did not find an issue but it definitely didn't work)
remotes::install_version("dplyr", "1.0.2", repos = "cran.rstudio.com")
remotes::install_version("highcharter", "0.8.2", repos = "cran.rstudio.com")
