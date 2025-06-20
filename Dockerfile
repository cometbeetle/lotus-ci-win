FROM python:3.12-slim

# Install uv.
RUN pip install uv
ENV PATH="$PATH:/root/.local/bin"

# Install dependencies.
RUN apt-get update && apt-get install libaio1 graphviz pandoc curl unzip git -y

# Install instant client.
RUN mkdir -p /opt/oracle
WORKDIR /opt/oracle
RUN curl -O https://download.oracle.com/otn_software/linux/instantclient/2350000/instantclient-basic-linux.x64-23.5.0.24.07.zip
RUN unzip instantclient-basic-linux.x64-23.5.0.24.07.zip
ENV LD_LIBRARY_PATH=/opt/oracle/instantclient_23_5

WORKDIR /