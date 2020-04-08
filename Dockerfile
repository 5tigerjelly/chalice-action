FROM python:3.7

LABEL version="1.0.0"
LABEL repository="https://github.com/5tigerjelly/chalice-action"
LABEL homepage="https://github.com/5tigerjelly/chalice-action"
LABEL maintainer="Chris Oh <chris@5tigerjelly.com> (https://5tigerjelly.com)"

LABEL "com.github.actions.name"="AWS Chalice Deploy"
LABEL "com.github.actions.description"="Wraps the AWS Chalice Framework to enable deployment."
LABEL "com.github.actions.icon"="zap"
LABEL "com.github.actions.color"="red"

RUN pip install --upgrade pip
RUN pip install chalice

ENTRYPOINT["chalice"]