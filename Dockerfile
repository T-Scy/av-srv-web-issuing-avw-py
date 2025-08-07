FROM python:3.9.22-slim-bullseye

WORKDIR /app

COPY  /app . 


RUN apt-get update && apt-get install -y --no-install-recommends \
    git \
    build-essential \
    && rm -rf /var/lib/apt/lists/* 

ENV NODE_VERSION=20.12.2
RUN curl -fsSL https://nodejs.org/dist/v$NODE_VERSION/node-v$NODE_VERSION-linux-x64.tar.xz | tar -xJ -C /usr/local --strip-components=1 && \
    ln -s /usr/local/bin/node /usr/bin/node && \
    ln -s /usr/local/bin/npm /usr/bin/npm

RUN node -v && npm -v

RUN npm install -g npm@10.6.0 && npm -v

RUN python -m pip install --upgrade pip

RUN pip install --no-cache-dir -r requirements.txt

CMD ["flask", "run", "--host=0.0.0.0"]

