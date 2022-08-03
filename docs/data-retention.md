TinyStacks enforces a number of data retention policies for the artifacts it manages and [the data that your applications generate](logging-monitoring.md). 

## CloudWatch Logs

Logs in CloudWatch are retained for 90 days. If you wish to retain logs for longer, you are free to export CloudWatch Logs data to Amazon S3 or another data store. 

## Elastic Container Repository (ECR) 

As detailed in our [architecture](architecture.md) document, we use ECR to store the container image that runs your application. We store up to 25 ECR images for a given stack. This means that, on your 26th Git commit, the container for your initial commit will be deleted. 

## CloudTrail events

Various services in AWS use <a href="https://docs.aws.amazon.com/awscloudtrail/latest/userguide/cloudtrail-user-guide.html" target="_blank">CloudTrail</a> to keep a running record of events that occur on your account. You can use CloudTrail to audit and monitor your AWS account to help analyze issues as well as identify potentially suspicious activity. 

CloudTrail events are kept for one year. 