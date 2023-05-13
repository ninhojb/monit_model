FROM apache/airflow:2.5.1-python3.9 as monitor
USER root
RUN apt-get update \
    && apt-get install -y --no-onstall-recommnends \
            vim \
    && apt-get autoremove -yqq --purge \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \

RUN apt clean && \
    apt update && \
    apt install -y \
    lixslt-dev \
    libxml2-dev \
    libpam-dev \
    libedit-dev \
    gcc \
    git \
    bzip2 \
    libffi-dev \
    postgresql \
    libpq-dev \
    libevent-dev \
    xz-utils \
    default-libmysqlclient-dev \
    htop \
    libssl-dev \

user airflow
copy requirements.txt ./


RUN pip install --upgrade pip
RUN pip install -U setuptools wheel pipenv
RUN pipenv install -r requirements.txt
