FROM python:3.9.22-slim-bookworm

WORKDIR /app

RUN apt-get update && apt-get install -y --no-install-recommends \
    git \
    build-essential \
    && rm -rf /var/lib/apt/lists/* 

RUN apt-get update && apt-get install -y curl && \
    curl -fsSL https://deb.nodesource.com/setup_20.x | bash - && \
    apt-get install -y nodejs build-essential && \
    npm install -g npm@10.6.0 && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

RUN npm cache clean --force && \
    npm install -g n && \
    n 20.12.2 && \
    npm install -g npm@10.6.0

# COPY  package*.json .

# COPY /assets .

# COPY tailwind.config.js .

COPY . .

RUN npm install

RUN npm run build

COPY /app ./

RUN python -m pip install --upgrade pip

RUN pip install --no-cache-dir -r requirements.txt

CMD ["flask", "run", "--host=0.0.0.0"]

