FROM nvidia/cuda:12.3.1-base-ubuntu22.04

RUN apt update && apt install -y git curl pciutils dmidecode && \
    curl -fsSL https://deb.nodesource.com/setup_19.x |  bash - && apt-get install -y nodejs && \
    npm install --global yarn && \
    git clone https://github.com/MauriceNino/dashdot && \
    cd dashdot && \
    yarn && \
    yarn build:prod && \
    rm -rf /var/lib/apt/lists/*

WORKDIR dashdot/

CMD ["yarn", "start"]
