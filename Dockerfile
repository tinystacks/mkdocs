FROM public.ecr.aws/bitnami/python:3.6
WORKDIR /app

COPY . .

ENV LC_ALL=C.UTF-8

# Install app dependencies
RUN pip install -r requirements.txt 
RUN mkdocs build


EXPOSE 8000

CMD mkdocs serve -a 0.0.0.0:8000