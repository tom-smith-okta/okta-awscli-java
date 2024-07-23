# Docker image for the Okta aws-cli-assume-role tool
# Version v1.1.0

FROM --platform=linux/amd64 ubuntu:24.04

RUN apt-get update && apt-get install -y \
	vim \
	openjdk-21-jre \
	curl \
	unzip \
    && rm -rf /var/lib/apt/lists/*

# Install AWS cli
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "/tmp/awscliv2.zip" &&\
    unzip /tmp/awscliv2.zip -d /tmp &&\
    /tmp/aws/install &&\
    rm -rf /tmp/aws*

# install okta-aws-cli-assume-role tool
RUN curl -fsSL https://raw.githubusercontent.com/oktadev/okta-aws-cli-assume-role/master/bin/install.sh -o /tmp/install.sh \
    && bash /tmp/install.sh -i

ENV PATH=$PATH:/root/.okta/bin
RUN ln -s /root/.okta/bin/aws-okta /usr/local/bin/okta-aws
