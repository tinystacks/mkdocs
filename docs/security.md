At TinyStacks, we design all of our solutions with security in mind. In this article, we describe the measures that TinyStacks takes to ensure the security of your stack. We also discuss the permissions required by TinyStacks to operate on your connected accounts. 

## Stack Security 

Every stack in TinyStacks is created with a secure architecture. The security measures we've taken include: 

**Hosting your stack in a VPC with public/isolated subnets**. TinyStacks hosts your stack with three private subnets and three isolated subnets. We place your (optional) PostgreSQL database and ECS cluster compute instances in the isolated subnets for additional protection. 

As discussed [in our architecture overview](architecture.md), we use one of two methods to provide public access to your application, depending on the scaling option you're using:

* **Application Load Balancer**: Your ALB is hosted in your public subnets. Since it's located in the same VPC as your isolated subnets, it can interact freely with your containers over your container's exposed ports.
* **API Gateway**: If you use API Gateway, we create a VPC link between API Gateway and your isolated subnets. This allows for secure communication between your API endpoints and your containers without traffic flowing over the public Internet. 

**Security groups**. We define security groups on all components of your architecture that restrict communications to trusted entities. For example, our security group rules ensure that only your containers running in your isolated subnets can connect to the appropriate port on your TinyStacks-provisioned PostgreSQL database (and, optionally, your database bastion host if you create one). Similarly, if you use Application Load Balancer for your API endpoints, your containers restrict access to their exposed port(s) to the ALB instance running in your VPC. 

**Secure database access**. When TinyStacks creates a PostgreSQL database for your application, we create it inside your isolated subnets. This secures your database against access from outside your VPC. You can also optionally create a bastion host, which will enable secure SSH tunneling to your VPC in case your team requires direct database access. 

**Encrypting secrets**. All secrets used by your stack (such as your database connection information and credentials) are stored in encrypted format in [AWS Secrets Manager](https://aws.amazon.com/secrets-manager/). For example, when you ask TinyStacks to create a PostgreSQL database for your stack, TinyStacks stores the database name, hostname, username, password, and other sensitive access information in an entry in AWS Secrets Manager.

Your team can access AWS Secrets Manager secrets securely through the AWS Console. Your application can also access these values using the AWS Command Line Interface (CLI) or the AWS SDK of your choice. 

**Environment variables**. If you have secrets you need to pass to your application (e.g., an access key/secret for AWS account access), you can pass them via your Docker containers using environment variables. This eliminates the need to hard-code security credentials into your code base or plain-text configuration files. 

## AWS Permissions Required by TinyStacks

TinyStacks only makes calls to your AWS account for the purposes of creating or reclaiming stack  infrastructure at your request. 

In order to create a stack in your AWS account, TinyStacks first spins up an AWS CloudFormation template. This template takes three actions: 

* Creates an AWS Identity and Access Management (IAM) role in your account. 
* Gives the TinyStacks service role (tinystacks-service-role) the permission to assume this role. 
* Informs TinyStacks (via an AWS Lambda callback) that the role is correctly configured for your account. 

The role that TinyStacks creates gives the TinyStacks service role full access to the following services in your AWS account: 

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

The role also gives TinyStacks the following access to your AWS account: 

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

The CloudFormation template deployment that TinyStacks creates begins with the name **TinyStacksRole**. If you wish to revoke TinyStacks' access to your AWS account, you can delete this deployment at any time. Note that, once deleted, TinyStacks will no longer be able to stand up stacks in your AWS account unless you re-deploy it.

## Git Repository Permissions Required by TinyStacks

In order to access your Git account, TinyStacks will request permissions for your Git repositories residing in GitHub or GitLab. 

GitHub permissions requested include: 

* Read access to organizational metadata
* Administrator access to repositories. You can either allow access to all repositories or restrict GitHub to accessing select repositories only
* Read/write access to administration, checks, code, commit statuses, deployments, discussions, packages, and pull requests

GitLab permissions requested include:

* Read access to organizational metadata
* Administrator access to projects
* Read/write access to administration (CRUD operations on repositories), checks, commit statuses, contents, deployments, discussions, packages, and pull requests.

The exact permissions requested from GitHub and GitLab may change over time.