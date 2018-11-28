FROM elixir:latest

WORKDIR /home/app
ADD . /home/app

RUN echo "set -o vi" >> ~/.bashrc \
    && echo "stty -ixon" >> ~/.bashrc \
    && echo "set editing-mode vi" >> ~/.inputrc \
    && echo "set keymap vi-command" >> ~/.inputrc \
