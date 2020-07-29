FROM ubuntu:18.04
ENV PYTHONUNBUFFERED 1
ENV DJANGO_ENV dev
ENV DOCKER_CONTAINER 1
RUN apt-get update && apt-get install -y npm python3 python3-pip 
RUN npm install -g less
RUN cp /usr/bin/pip3 /usr/bin/pip
RUN rm /usr/bin/python
RUN ln -s /usr/bin/python3.6 /usr/bin/python
COPY ./pip-requires.txt /code/pip-requires.txt
RUN pip install -r /code/pip-requires.txt
COPY . /code/
WORKDIR /code/
EXPOSE 8000
