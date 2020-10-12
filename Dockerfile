FROM rocker/shiny-verse:4.0.0
RUN apt-get update \
  && apt-get install -y --no-install-recommends \
    libxml2-dev \
    libglpk-dev

ADD install.packages.R /install.packages.R

RUN Rscript install.packages.R
ADD . /app
WORKDIR /app
CMD ["Rscript", "-e", "rmarkdown::run(file = '/app/pndl_dashboard.Rmd', shiny_args = list(port = 3838, host = '0.0.0.0'))"]