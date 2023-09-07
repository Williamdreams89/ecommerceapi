FROM python:alpine3.17
LABEL maintainer="williamdreams89@outlook.com"
ENV PYTHONUNBUFFERED 1

COPY requirements.txt /tmp/requirements/txt
COPY ./api /api
WORKDIR /api

RUN python -m venv /py && \
    /py/bin/pip install --upgrade pip && \
    /py/bin/pip install -r /tmp/requirements.txt && \
    rm -rf /tmp && \
    adduser --disabled-password --no-create-home django -user && \
ENV  PATH="py/bin:$PATH"
USER django-user