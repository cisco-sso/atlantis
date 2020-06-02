FROM runatlantis/atlantis:v0.13.0

RUN echo Installer extra utilities \
 && apk --no-cache add python3 jq \
 && pip3 install awscli==1.18.39
