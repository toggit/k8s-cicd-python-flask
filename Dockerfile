# syntax=docker/dockerfile:1

FROM python:3.10-slim-buster

RUN useradd -u 1001 -g appuser --no-log-init --create-home --shell /bin/bash /bin/bash appuser
RUN python -m pip install --upgrade pip

WORKDIR /app

COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt


COPY src/ /app

ENV FLASK_APP app
ENV FLASK_ENV production
ENV PORT 8080

EXPOSE 8080

CMD [ "python", "waitress_server.py"]