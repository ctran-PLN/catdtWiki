# build
docker build -t catdt/docker-spark:1.0 .

# call docker images to check built images

# run
docker run --name spark -it catdt/docker-spark:1.0
