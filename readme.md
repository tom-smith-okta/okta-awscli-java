# Docker image for the Okta aws-cli-assume-role tool

This ubuntu-based image was built to run Okta's [java-based AWS CLI tool](https://github.com/oktadeveloper/okta-aws-cli-assume-role)

The image includes all of the prerequisites required to run the tool; you just need to pass it a configuration file with your Okta settings.

The image does not compile the source for the aws-cli-assume-role tool. It relies on published releases in the github repo.

## Prerequisites
* Docker
* An AWS account
* An Okta tenant
* Configure your Okta tenant and AWS to work together: [Integrating the Amazon Web Services Command Line Interface Using Okta](https://support.okta.com/help/s/article/Integrating-the-Amazon-Web-Services-Command-Line-Interface-Using-Okta)
* config.properties file

Please see the github repo for additional documentation and information about how the tool works, including how to set up your config.properties file.

To get started, you can start with a "bare minimum" config.properties file that contains only two lines:

`
OKTA_ORG=partnerpoc.oktapreview.com
OKTA_AWS_APP_URL=https://partnerpoc.oktapreview.com/home/amazon_aws/0oadci5fdr3PZtXB30h7/137
`
Of course, replace the example values with your own values.

Save the config.properties file in a .okta directory on your local system. Assuming that you are running Linux/MacOS and you've created your .okta directory in your home directory, you can launch the container with this command:

`bash
docker run -v ~/.okta/config.properties:/root/.okta/config.properties -it tomsmithokta/okta-awscli-java
`

If you are using Windows, or you've stored your config.properties file elsewhere, you may need to adjust the local file path (`~/.okta/config.properties` in the example.)

>Important: the tool will not run without a valid config.properties file

>Important: when the container launches, you must first execute this command before you do anything with the tool:

`source ~/.bash_profile`

After you have executed this initial command, you can start using the java-based Okta aws-cli-assume-role tool. Again, please refer to the github documentation for the tool itself for executing commands.