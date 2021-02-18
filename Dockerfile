# Build image
FROM python:3.7-slim as builder

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

# Production image
FROM python:3.7-slim as lnbits

WORKDIR /app

# Copy over virtualenv
ENV VIRTUAL_ENV=/opt/venv
COPY --from=builder $VIRTUAL_ENV $VIRTUAL_ENV
ENV PATH="$VIRTUAL_ENV/bin:$PATH"

# Copy in app source
COPY lnbits /app/lnbits

EXPOSE 5000

CMD python -m lnbits
