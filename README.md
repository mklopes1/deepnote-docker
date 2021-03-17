# DeepNote Docker

This repository tracks and builds the Docker image used on the UCLATALL and CourseKata Deepnote environment set ups.
Changes commited to the Dockerfile on `main` will automatically be built, tagged, and published on 
[Docker Hub](https://hub.docker.com/repository/docker/uclatall/deepnote)

Please be careful making any changes as many notebooks rely on this Docker build, including those of people outside
of our organization. At minimum we need to be sure that the container is valid and works on Deepnote.
