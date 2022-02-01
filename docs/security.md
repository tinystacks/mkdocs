At Tinystacks, we design all of our solutions with security in mind. In this article, we describe the measures that Tinystacks takes to ensure the security of your stack. We also discuss the permissions required by Tinystacks to operate on your connected accounts. 

### Stack Security 

Every stack in TinyStacks is created with a secure architecture. The security measures we've taken include: 

**Hosting your stack in a VPC with public/private subnets**. You can host your stack with one of two patterns: 

* Three public subnets and two private subnets. We use VPC Link to establish a peer into the public subnets. 
* Three private subnets and three isolated subnets. We use VPC Link to establish a peer into the private subnets. 

**Secure database access**. When TinyStacks creates a PostgreSQL database for your application, we create it inside one of your private subnets. This secures your database against intrusion attempts from outside your VPC. You can also optionally create a bastion host, which will enable secure SSH tunneling to your VPC in case your team requires direct database access. 

**Encrypting secrets**. All secrets used by your stack (such as your database connection information and credentials) are stored in encrypted format in [AWS Secrets Manager](https://aws.amazon.com/secrets-manager/). For example, when you ask TinyStacks to create a PostgreSQL database for your stack, TinyStacks stores the database name, hostname, username, password, and other sensitive access information in an entry in AWS Secrets Manager.

Your team can access AWS Secrets Manager secrets securely through the AWS Console. Your application can also access these values using the AWS Command Line Interface (CLI) or the AWS SDK of your choice. 

**Environment variables**. If you have secrets you need to pass to your application (e.g., an access key/secret for AWS account access), you can pass them via your Docker containers using environment variables. This eliminates the need to hard-code security credentials into your code base or plain-text configuration files. 

### AWS Permissions Required by Tinystacks

TinyStacks only makes calls to your AWS account for the purposes of creating or reclaiming stack  infrastructure at your request. 

In order to create a stack in your AWS account, Tinystacks first spins up an AWS CloudFormation template. This template takes three actions: 

* Creates an AWS Identity and Access M nagement (IAM) role in your account. 
* Gives the Tinystacks service role (tinystacks-service-role) the permission to assume this role. 
* Informs Tinystacks (via an AWS Lambda callback) that the role is correctly configured for your account. 

The role that Tinystacks creates gives the Tinystacks service role full access to the following services in your AWS account: 

* **API Gateway**
* **Application Autoscaling**
* **Cloudwatch**
* **CodeBuild**
* **CodePipeline**
* **Amazon Elastic Container Service (ECS)**
* **Amazon EC2**
* **Elastic Load Balancer**
* **Key Management Service**
* **AWS Lambda**
* **Amazon Route 53**
* **Amazon Simple Notification Service (SNS)**
* **Amazon S3**

The role also gives Tinystacks the following access to your AWS account: 

* **IAM**: Create role, assume role
* **Cloudfront**: Create/get distribution, tag resource, put event selectors
* **Cloudtrail**: Create trail, delete trail
* **Amazon Elastic Container Repository (ECR)**: Get lifecycle policy, create repository, list tags, get repository policy, describe repository policy
* **Amazon EventBridge**: Delete rule, put targets, remove targets, put rule, describe rule
* **Cloudwatch Logs**: Delete log delivery, list log deliveries, create log delivery, create group, describe log groups & streams, put retention policy
* **Amazon RDS**: Create/delete DB subnet group, create/delete instance, describe instances, describe subnet groups
* **AWS Service Discovery**: Get/create/delete service, get operation, get/create/delete private DNS namespace
* **AWS Secrets Manager**: Get/put secret value, create/delete secret, get random password, get service quota
* **AWS Systems Manager**: Get/create/put parameters

The CloudFormation template deployment that TinyStacks creates begins with the name **TinyStacksRole**. If you wish to revoke Tinystacks' access to your AWS account, you can delete this deployment at any time. Note that, once deleted, Tinystacks will no longer be able to stand up stacks in your AWS account unless you re-deploy it.

### Git Repository Permissions Required by TinyStacks

In order to access your Git account, TinyStacks will request 