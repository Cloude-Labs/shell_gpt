FROM python:3-slim

# Environment Variables
ENV SHELL_INTERACTION=false
ENV PRETTIFY_MARKDOWN=false
ENV OS_NAME=auto
ENV SHELL_NAME=auto

# Set working directory
WORKDIR /app

# Copy files to the container
COPY . /app

# Install dependencies
RUN apt-get update && apt-get install -y --no-install-recommends gcc \
    && rm -rf /var/lib/apt/lists/*  # Clean up APT cache

RUN pip install --no-cache-dir /app && mkdir -p /tmp/shell_gpt

# Set up volume for temporary data
VOLUME /tmp/shell_gpt

# Default entrypoint
ENTRYPOINT ["sgpt"]
