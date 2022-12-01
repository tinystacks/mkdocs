docker build . -t docs;
xdg-open localhost:8000;
docker run -p 8000:8000 -it docs;