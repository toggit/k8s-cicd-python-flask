# syntax=docker/dockerfile:1

FROM python:3.10-slim-buster

ENV PATH="/app/venv/bin/:/app/venv/Scripts/:/app/.local/bin:${PATH}"

RUN groupadd --gid 1001 appuser  && useradd --uid 1001 -g appuser --no-log-init --create-home --shell /bin/bash -d /app appuser
USER appuser
WORKDIR /app

RUN python -m venv venv
RUN . venv/bin/activate

RUN python -m pip install --upgrade pip

COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt


COPY src/ /app

ARG port=8080
ENV FLASK_APP app
ENV FLASK_ENV production
ENV PORT ${port}

EXPOSE ${port}

CMD [ "python", "waitress_server.py"]