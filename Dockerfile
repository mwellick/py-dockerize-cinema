FROM python:alpine3.19
LABEL maintainer="mr.anderson528491@gmail.com"

ENV PYTHONUNBUFFERED 1

WORKDIR app/

COPY requirements.txt requirements.txt

RUN pip install -r requirements.txt

COPY . .

RUN mkdir -p /files/media

RUN adduser \
    --disabled-password \
    --no-create-home \
    cinema_user

RUN chown -R cinema_user /files/media
RUN chmod -R 755 /files/media

USER cinema_user
