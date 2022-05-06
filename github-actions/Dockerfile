FROM ubuntu:latest


RUN mkdir /actions 
WORKDIR /actions

RUN apt update
RUN apt install -y curl coreutils gnupg sudo
RUN curl -o actions-runner-linux-x64-2.291.1.tar.gz -L https://github.com/actions/runner/releases/download/v2.291.1/actions-runner-linux-x64-2.291.1.tar.gz
RUN echo "1bde3f2baf514adda5f8cf2ce531edd2f6be52ed84b9b6733bf43006d36dcd4c  actions-runner-linux-x64-2.291.1.tar.gz" | sha256sum -c
RUN tar xzf ./actions-runner-linux-x64-2.291.1.tar.gz

RUN apt install -y libicu70
RUN sed -i "s/user_id -eq 0/user_id -eq 1/" ./config.sh
RUN ./config.sh --url https://github.com/phesttas --token ABHT5EDUK7YH67E3FGCREPDCOSPQE

ENV RUNNER_ALLOW_RUNASROOT="1"

ENTRYPOINT [ "./run.sh" ]
