# syntax=docker/dockerfile:1

FROM python:3.10-slim-buster

WORKDIR /app

COPY requirements.txt requirements.txt
RUN pip3 install -r requirements.txt


COPY src/ /app
COPY .env /app

ENV FLASK_APP app
ENV FLASK_ENV production
ENV PORT 8080

EXPOSE 8080

CMD [ "python3", "waitress_server.py"]