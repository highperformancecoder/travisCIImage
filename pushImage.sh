#docker login --username=highperformancecoder 
docker build --pull --network=host --tag highperformancecoder/builttravisciimage .
docker push highperformancecoder/builttravisciimage
