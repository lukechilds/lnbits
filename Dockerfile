FROM python:3.7-slim

WORKDIR /app

# Setup virtualenv
ENV VIRTUAL_ENV=/opt/venv
RUN python3 -m venv $VIRTUAL_ENV
ENV PATH="$VIRTUAL_ENV/bin:$PATH"

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
