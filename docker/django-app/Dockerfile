# building on top of 14.04 because i like trusty
FROM ubuntu:14.04

# no more pyc or buffering prints
ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1

RUN apt-get update -y && \
    apt-get install -y \
      libpq-dev \
      python-dev \
      python-pip

# this layer wont be rebuilt unless we update our requirements.txt
COPY ./env/requirements.txt ./env/gunicorn/gunicorn.txt /opt/
RUN pip install --upgrade pip && pip install -r /opt/requirements.txt

# copy in the conf and project to the docker image
WORKDIR /opt
COPY ./env/conf/ /opt/conf/.
COPY ./project/ /opt/.

VOLUME /opt/media /opt/static
ENTRYPOINT [ "/opt/runserver.sh" ]
