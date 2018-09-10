# build
docker build -t catdt/docker-spark:1.0 .

# call docker images to check built images

# run
docker run -p 8888:8888 --name spark -it catdt/docker-spark:1.0
