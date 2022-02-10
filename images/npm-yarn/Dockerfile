FROM alpine:latest

# Add language runtimes to support their package managers
RUN apk add --no-cache ruby nodejs npm git bash

# Add packages to support native package compilation
RUN apk add --no-cache build-base libffi-dev
RUN gem install --conservative -N license_finder

# Install yarn JS package manager
RUN npm install --global yarn

# Create directories
RUN mkdir scripts
RUN mkdir data
# Copy scripts to container
COPY scripts/*.sh /scripts/

WORKDIR /scan

ENTRYPOINT ["sh", "/scripts/entrypoint.sh"]