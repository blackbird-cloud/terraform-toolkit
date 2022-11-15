FROM alpine:3.16.3

RUN apk update
RUN apk add curl
RUN apk add git
RUN apk add bash
RUN apk add jq

RUN git clone https://github.com/tfutils/tfenv.git ~/.tfenv
RUN git clone https://github.com/cunymatthieu/tgenv.git ~/.tgenv

ENV TGENV_AUTO_INSTALL=true

RUN ln -s ~/.tgenv/bin/* /usr/local/bin
RUN ln -s ~/.tfenv/bin/* /usr/local/bin

RUN echo -e 'PATH="/root/.tgenv/bin:/root/.tfenv/bin:$PATH"' >> ~/.env

RUN /usr/local/bin/tfenv install latest
RUN /usr/local/bin/tfenv install 1.1.9
RUN /usr/local/bin/tgenv install latest
RUN /usr/local/bin/tgenv install 0.38.9