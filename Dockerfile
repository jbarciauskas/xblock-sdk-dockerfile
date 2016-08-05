FROM phusion/baseimage:latest
RUN apt-get update && apt-get install -y \
    build-essential \
    git \
    lib32z1-dev \
    libjpeg62-dev \
    libxml2-dev \
    libxslt-dev \
    python-dev \
    python-setuptools \
    xz-utils \
&& rm -rf /var/lib/apt/lists/*
RUN mkdir -p /usr/local/src \
    && curl -SL https://github.com/edx/xblock-sdk/archive/v0.1.2.tar.gz \
    | tar -xzC /usr/local/src
RUN easy_install pip
WORKDIR /usr/local/src/xblock-sdk-0.1.2
RUN make install
ENTRYPOINT ["python", "manage.py"]
