FROM runatlantis/atlantis:v0.15.0

RUN echo Installer extra utilities \
 && apk --no-cache add python3 py3-pip jq \
 && pip3 install awscli==1.18.39 \
 && curl -sSfL -o /usr/local/bin/terragrunt \
   https://github.com/gruntwork-io/terragrunt/releases/download/v0.23.10/terragrunt_linux_amd64 \
 && chmod a+x /usr/local/bin/terragrunt

