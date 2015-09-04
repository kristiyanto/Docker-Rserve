# Base Docker Image
FROM bioconductor/release_base

# Maintainer
MAINTAINER Daniel Kristiyanto, danielkr@uw.edu 

# Install required R Packages
RUN echo 'install.packages(c("Rserve", "igraph"), repos="http://cran.us.r-project.org", dependencies=TRUE)' > /tmp/packages.R \     && Rscript /tmp/packages.R

# Build a Script to start Rserve
RUN echo 'library("Rserve")' > /root/rserve.R
RUN echo 'Rserve()' >> /root/rserve.R 

# Run Script on entrance
CMD Rscript /root/rserve.R
