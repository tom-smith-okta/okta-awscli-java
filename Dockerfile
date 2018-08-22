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
# at the moment (August 2018) the release version of the okta-aws-cli-assume-role tool is hard-coded
# in the install.sh script
# version 1.0.3
RUN curl 'https://raw.githubusercontent.com/tom-smith-okta/okta-aws-cli-assume-role/master/bin/install.sh' | bash