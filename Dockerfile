FROM node:6.7.0
MAINTAINER Marcio Mansur <mrabeloo@gmail.com>

ENV USERNAME dev
ENV HOME /home/$USERNAME

RUN useradd --user-group --create-home --shell /bin/false $USERNAME && \
    mkdir $HOME/app

RUN npm install -g ethereumjs-testrpc truffle && \
    npm set progress=false

RUN chown -R $USERNAME:$USERNAME $HOME/mobileapp

USER $USERNAME

WORKDIR $HOME/app
VOLUME $HOME/app

ENTRYPOINT []
CMD []
