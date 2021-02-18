FROM python:3.7-slim

WORKDIR /app

# Install build deps
RUN apt-get update
RUN apt-get install -y --no-install-recommends build-essential
RUN pip install pipenv

# Install runtime deps
COPY Pipfile* /app/
RUN pipenv install --dev

# Copy in app source
COPY . /app

EXPOSE 5000
