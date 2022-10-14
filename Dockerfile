FROM alpine:3.16.2

RUN apk update
RUN apk add curl
RUN apk add git
RUN apk add bash

RUN git clone https://github.com/tfutils/tfenv.git ~/.tfenv
RUN git clone https://github.com/cunymatthieu/tgenv.git ~/.tgenv

RUN ln -s ~/.tgenv/bin/* /usr/local/bin
RUN ln -s ~/.tfenv/bin/* /usr/local/bin

RUN /usr/local/bin/tfenv install latest
RUN /usr/local/bin/tgenv install latest