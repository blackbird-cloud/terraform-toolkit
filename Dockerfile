FROM alpine:3.17.2

RUN apk update
RUN apk add --no-cache curl git bash jq python3 py3-pip aws-cli
RUN pip3 install --upgrade pip \
    && pip3 install --no-cache-dir \
    awscli \
    && rm -rf /var/cache/apk/*

RUN curl -sSL https://sdk.cloud.google.com > /tmp/gcl && bash /tmp/gcl --install-dir=~/gcloud --disable-prompts

RUN git clone https://github.com/tfutils/tfenv.git ~/.tfenv
RUN git clone https://github.com/cunymatthieu/tgenv.git ~/.tgenv

ENV TGENV_AUTO_INSTALL=true

RUN ln -s ~/.tgenv/bin/* /usr/local/bin
RUN ln -s ~/.tfenv/bin/* /usr/local/bin

RUN echo -e 'PATH="/root/.tgenv/bin:/root/.tfenv/bin:$PATH"' >> ~/.env

RUN /usr/local/bin/tfenv install latest
RUN /usr/local/bin/tfenv install 1.1.9
RUN /usr/local/bin/tfenv install 1.3.5
RUN /usr/local/bin/tgenv install latest
RUN /usr/local/bin/tgenv install 0.38.9
