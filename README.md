# ssm-linux-user

This script is called by the lambda function here: https://github.com/VIOOH/ssm-user-lambda

It's purpose is to create the two required users for access to the nodes via SSM agent when using the `RunAs` feature of SSM agent,

We need to create these users via the script because of the following issue: https://github.com/aws/amazon-ssm-agent/pull/394
