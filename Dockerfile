# Docker image for the Okta aws-cli-assume-role tool
# Version v1.0.3

FROM ubuntu:18.04

RUN apt-get update && apt-get install -y \
	vim \
	python3.6 \
	awscli \
	openjdk-11-jre \
	curl \
 && rm -rf /var/lib/apt/lists/*

# install okta-aws-cli-assume-role tool
RUN curl 'https://raw.githubusercontent.com/oktadeveloper/okta-aws-cli-assume-role/master/bin/install.sh' | bash