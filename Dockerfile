FROM python:3.8.14-buster
LABEL maintainer = "gabriele martinero"

ENV PYTHONBUFFERED 1

COPY ./requirements/requirements.txt /tmp/requirements.txt
COPY . /app
WORKDIR /app
EXPOSE 8000

ARG DEV=false
RUN python -m venv /py && \
    /py/bin/pip install --upgrade pip && \
    /py/bin/pip install -r /tmp/requirements.txt && \
    rm -rf /tmp && \
    if [$DEV = "true"]; \
        then /py/bin/pip install -r /tmp/requirements.dev.txt;\
    adduser \
        --disabled-password \
        --no-create-home \
        django-user

ENV PATH="/py/bin:$PATH"
# for security in case of breach
USER django-user