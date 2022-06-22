FROM python:3.10-slim-buster

COPY ./requirements.txt /root/
COPY ./requirements-docker.txt /root/

RUN python3 -m venv /opt/venv3 && \
    /opt/venv3/bin/python3 -m pip install -r /root/requirements.txt && \
    /opt/venv3/bin/python3 -m pip install -r /root/requirements-docker.txt

ENV PATH="/opt/venv3/bin:$PATH"
ENV PYTHONPATH=/app:/opt/venv3/lib/python3.10/site-packages/

COPY . /app
COPY ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

WORKDIR /app

RUN useradd -ms /bin/bash srv
USER srv

ENTRYPOINT ["/entrypoint.sh"]
