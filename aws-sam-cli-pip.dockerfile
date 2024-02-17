FROM alpine:3.19
MAINTAINER Pascal Zimmermann <pascal.zimmermann@theiotstudio.com>

LABEL application="AWS SAM ClI Apline container" \
      description="AWS SAM ClI Apline container" \
      version="0.0.1" \
      lastUpdatedBy="Pascal Zimmermann" \
      lastUpdatedOn="2024-02-17"

# Be aware musl-dev, py3-ruamel.yaml.clib and py3-cffi is only necessary in case of ARM64 based containers
RUN apk --no-cache update && apk --no-cache upgrade && apk add python3 python3-dev py-pip py3-ruamel.yaml.clib py3-cffi && \
    rm /usr/lib/python3.11/EXTERNALLY-MANAGED && pip install aws-sam-cli && \
    sam --version
