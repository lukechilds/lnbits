FROM python:3.7-slim

WORKDIR /app

# Install build deps
RUN apt-get update
RUN apt-get install -y --no-install-recommends build-essential

# Install runtime deps
COPY requirements.txt /app/
RUN pip install --no-cache-dir -q -r requirements.txt

# Copy in app source
COPY . /app

EXPOSE 5000
