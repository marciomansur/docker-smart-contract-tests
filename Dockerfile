FROM node:7.0.0
MAINTAINER Marcio Mansur <mrabeloo@gmail.com>

ENV USERNAME dev
ENV HOME /home/$USERNAME
ENV PORT 8545

RUN useradd --user-group --create-home --shell /bin/false $USERNAME && \
    mkdir $HOME/app

RUN npm install -g --unsafe-perm ethereumjs-testrpc@3.0.1 && \
    npm install -g truffle && \
    npm set progress=false

RUN chown -R $USERNAME:$USERNAME $HOME/app

USER $USERNAME

EXPOSE $PORT

WORKDIR $HOME/app
VOLUME $HOME/app

CMD ["testrpc"]
