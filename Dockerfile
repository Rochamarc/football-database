# specify start image
FROM python:3.10-bookworm

# all commands start from this directory
WORKDIR /app

EXPOSE 8888

# copy all files from this folder to working directory (ignores files in .dockerignore)
COPY . .

RUN pip install -r requirements.txt 

# set the start command
CMD ["jupyter", "lab", "--ip='0.0.0.0'", "--port=8888", "--no-browser", "--allow-root"]


# docker build -t football-database:0.1 .

# docker run -it -d -p 8888:8888 football-database:0.1

# docker exec -it {CODIGO_DO_CONTAINER} /bin/bash