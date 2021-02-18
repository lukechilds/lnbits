FROM python:3.7-slim

WORKDIR /app

RUN apt-get update
RUN apt-get install -y --no-install-recommends build-essential

COPY requirements.txt /app/
RUN pip install --no-cache-dir -q -r requirements.txt

COPY . /app

EXPOSE 5000
