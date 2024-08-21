# build stage
# Setting the base image
FROM python:3.11-slim AS build

# Creating a non-privileged user named 'python'
RUN groupadd -g 1000 python && \
    useradd -r -u 1000 -g python python

# Copying and installing dependencies
COPY requirements.txt .
RUN pip install -r requirements.txt

# Setting up the working directory and changing owner to previously created user
RUN mkdir /app && chown python:python /app
WORKDIR /app

# Copying app source code into the working directory
COPY app.py .

# Ensuring the processes running inside the container will be executed
# in non-privileged mode
USER 1000

ENV FLASK_APP=app
ENV FLASK_ENV=development

CMD ["python", "app.py"]
