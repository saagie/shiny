FROM rocker/shiny

MAINTAINER Saagie

RUN apt-get update && apt-get install -y odbcinst
RUN apt-get install -y unixodbc-dev
RUN wget --no-verbose https://downloads.cloudera.com/connectors/impala_odbc_2.5.41.1029/Debian/clouderaimpalaodbc_2.5.41.1029-2_amd64.deb
RUN dpkg -i clouderaimpalaodbc_*.deb
RUN odbcinst -i -d -f /opt/cloudera/impalaodbc/Setup/odbcinst.ini

RUN echo 'install.packages(c("odbc", "DBI", "dplyr", "dbplyr", "implyr", "shinydashboard"), repos="http://cran.rstudio.com", dependencies=TRUE)' > /tmp/packages.R \
  && Rscript /tmp/packages.R

# Remove provided Shiny examples
RUN rm -rf /srv/shiny-server/*
