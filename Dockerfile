FROM python:3.10-slim

LABEL maintainer="Valispace DevOps <devops@valispace.com>"

# Set environment variables
ENV PYTHONUNBUFFERED=1 \
    DJANGO_SETTINGS_MODULE="settings.docker"

# Copy the application source code to docker image
COPY ./ /valifn
WORKDIR /valifn

RUN set -e && \
    # Install octave
    apt update && apt install -y octave && \
    # Install latest pip and it's requirements
    pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt

# No need to track logs because container is constantly
# destroyed after each execution or failure
CMD ["tail", "-f", "/dev/null"]
