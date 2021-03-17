FROM rocker/shiny-verse:4.0.4

# Install Jupyter
RUN /rocker_scripts/install_python.sh
RUN pip3 install --no-cache-dir jupyter

# Install R kernel and set as default
RUN sudo Rscript -e "install.packages(c('IRkernel'), repos='https://cran.rstudio.com/')"
RUN sudo Rscript -e "IRkernel::installspec()"
ENV DEFAULT_KERNEL_NAME=ir

# Install CourseKata packages
RUN sudo Rscript -e "install.packages('remotes', repos='http://cran.rstudio.com/')"
RUN sudo Rscript -e "remotes::install_github('UCLATALL/coursekata-r')"
RUN sudo Rscript -e "coursekata::coursekata_install()"

# Fix plot sizes
RUN sudo Rscript -e "install.packages('repr', repos='http://cran.rstudio.com/')"
RUN echo 'options(repr.plot.width = 4, repr.plot.height = 4)' > ~/.Rprofile

# Install other packages
RUN sudo Rscript -e "install.packages(c('psych', 'simstudy'), repos='http://cran.rstudio.com/')"
RUN sudo Rscript -e "install.packages(c('lme4'), repos='http://cran.rstudio.com/')"
