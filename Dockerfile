FROM ubuntu:14.04

RUN apt-get install -y python-setuptools
RUN easy_install pip

ADD requirements.txt /src/requirements.txt
RUN cd /src; pip install -r requirements.txt

ADD . /src

EXPOSE 5000

CMD python /src/application.py server

# to build image
# docker build -t docker-flask-foundation .
# docker images

# to run
# docker run -d -p 5000:5000 docker-flask-foundation
# docker ps

# to open
# open "http://$(boot2docker ip 2> /dev/null):5000"