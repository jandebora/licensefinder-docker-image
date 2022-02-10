FROM alpine:latest

# Add language runtimes to support their package managers
RUN apk add --no-cache ruby openjdk11 git bash maven

# Add packages to support native package compilation
RUN apk add --no-cache build-base libffi-dev
RUN gem install --conservative -N license_finder

# Create directories
RUN mkdir scripts
RUN mkdir data

# Copy scripts to container
COPY scripts/*.sh /scripts/

WORKDIR /scan

ENTRYPOINT ["sh", "/scripts/entrypoint.sh"]