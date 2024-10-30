FROM alpine:3.17

RUN apk update && \
    apk upgrade && \
    apk add --no-cache \
      curl \
      git \
      bash \
      jq \
      yq \
      python3-dev \
      py3-pip \
      aws-cli \
      gcc \
      musl-dev \
      linux-headers \
      libffi-dev && \
    pip3 install --upgrade pip && \
    rm -rf /var/cache/apk/*

RUN curl -sSL https://sdk.cloud.google.com > /tmp/gcl && bash /tmp/gcl --install-dir=~/gcloud --disable-prompts

RUN git clone --depth=1 https://github.com/tfutils/tfenv.git ~/.tfenv && rm -rf ~/.tfenv/.git
RUN git clone --depth=1 https://github.com/cunymatthieu/tgenv.git ~/.tgenv && rm -rf ~/.tgenv/.git

RUN curl -fsSL -o helm-v3.13.2-linux-amd64.tar.gz https://get.helm.sh/helm-v3.13.2-linux-amd64.tar.gz && \
    tar -zxvf helm-v3.13.2-linux-amd64.tar.gz && \
    mv linux-amd64/helm /usr/local/bin/helm

ENV TGENV_AUTO_INSTALL=true

RUN ln -s ~/.tgenv/bin/* /usr/local/bin
RUN ln -s ~/.tfenv/bin/* /usr/local/bin
RUN ln -s ~/gcloud/google-cloud-sdk/bin/* /usr/local/bin

ENV PATH=$PATH:~/gcloud/google-cloud-sdk/bin
RUN /usr/local/bin/tfenv install 1.9.8
RUN /usr/local/bin/tgenv install 0.68.6

RUN pip install azure-cli

RUN curl -L https://github.com/getsops/sops/releases/download/v3.8.1/sops-v3.8.1.linux.amd64 -o /usr/local/bin/sops
RUN chmod +x /usr/local/bin/sops
