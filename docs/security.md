At TinyStacks, we design all of our solutions with security in mind.

In this article, we describe the measures that TinyStacks takes to ensure the security of your stack. We also discuss the permissions required by TinyStacks to operate on your connected accounts. 

## Security compliance standards

[TinyStacks has achieved SOC 2 Type I compliance](https://www.tinystacks.com/blog-post/tinystacks-completes-soc-2-type-i-data-security-audit/) in accordance with American Institute of Certified Public Accountants (AICPA) standards for SOC for Service Organizations, also known as SSAE 18. TinyStacks, Inc. was audited by <a href="https://www.prescientassurance.com/" target="_blank">Prescient Assurance</a>, a leader in security and compliance attestation for B2B, SAAS companies worldwide.

An unqualified opinion on a SOC 2 Type I audit report demonstrates to TinyStacks, Inc.’s current and future customers that they manage their data with the highest standard of security and compliance. 

## Stack Security 

Every stack in TinyStacks is created with a secure architecture. The security measures we've taken include: 

**Hosting your stack in a VPC with public/isolated subnets**. TinyStacks hosts your stack with three public subnets and three isolated subnets. We place your (optional) database and ECS cluster compute instances in the isolated subnets for additional protection.

As discussed [in our architecture overview](architecture.md), we use one of two methods to provide public access to your application, depending on the scaling option you're using:

* **Application Load Balancer**: Your ALB is hosted in your public subnets. Since it's located in the same VPC as your isolated subnets, it can interact freely with your containers over your container's exposed ports.
* **API Gateway**: If you use API Gateway, we create a VPC link between API Gateway and your isolated subnets. This allows for secure communication between your API endpoints and your containers without traffic flowing over the public Internet. 

**Security groups**. We define security groups on all components of your architecture that restrict communications to trusted entities. For example, our security group rules ensure that only your containers running in your isolated subnets can connect to the appropriate port on your TinyStacks-provisioned database (and, optionally, your database bastion host if you create one). Similarly, if you use Application Load Balancer for your API endpoints, your containers restrict access to their exposed port(s) to the ALB instance running in your VPC. 

**Secure database access**. When TinyStacks creates a database for your application, we create it inside your isolated subnets. This secures your database against access from outside your VPC. You can also optionally create a bastion host, which will enable secure SSH tunneling to your VPC in case your team requires direct database access. 

**Encrypting secrets**. All secrets used by your stack (such as your database connection information and credentials) are stored in encrypted format in [AWS Secrets Manager](https://aws.amazon.com/secrets-manager/). For example, when you ask TinyStacks to create a database for your stack, TinyStacks stores the database name, hostname, username, password, and other sensitive access information in an entry in AWS Secrets Manager. TinyStacks does not store encryption keys or plaintext secrets for secrets hosted in customer accounts.

Your team can access AWS Secrets Manager secrets securely through the AWS Console. Your application can also access these values using the AWS Command Line Interface (CLI) or the AWS SDK of your choice. 

**Environment variables**. If you have secrets you need to pass to your application (e.g., an access key/secret for AWS account access), you can pass them via your Docker containers using environment variables. This eliminates the need to hard-code security credentials into your code base or plain-text configuration files. 

**S3**. S3 buckets are created for each region in a stack. These buckets are used to store access logs, build artifacts, and other supporting assets required to run stacks. S3 buckets are configured as private and they are versioned.

## AWS Permissions Required by TinyStacks

TinyStacks makes calls to your AWS account for the purposes of creating or reclaiming stack infrastructure at your request. Also for maintenance, monitor, and report status back.

In order to create a stack in your AWS account, TinyStacks first spins up an AWS CloudFormation template. This template takes three actions: 

* Creates an AWS Identity and Access Management (IAM) role in your account. 
* Gives the TinyStacks service role (tinystacks-service-role) the permission to assume this role. 
* Informs TinyStacks (via an AWS Lambda callback) that the role is correctly configured for your account. 

The role that TinyStacks creates gives the TinyStacks service role the following access in your AWS account:

* **CDK Role and Permissions**
    - There are a basic set of permissions created when your account is boostrapped by AWS's Cloud Development Kit.  We grant our role the ability to assume the IAM role created through this process as well as full access to a CDK specific S3 Bucket, and read-only permission to CDK specific SSM Parameters.
* **Amazon API Gateway**
    - Describe and tagging capabilities for all API Gateway resources
    - Basic read/update/delete permissions
    - Limited permissions for other operations
* **Application Autoscaling**
    - Describe and tagging capabilities for all resources
    - Basic read/update/delete permissions
    - Limited permissions for other operations
* **Autoscaling**
    - Describe and tagging capabilities for all resources
    - Basic read/update/delete permissions
    - Limited permissions for other operations
* **Amazon CloudFront**
    - Tagging capabilities for all CloudFront resources
    - Basic read/update/delete permissions
    - Limited permissions for other operations
* **AWS CloudFormation**
    - Full access for all CloudFormation capabilities
        * Note that while this allows us to call a particular action in CloudFormation, the access to the specific action and resource is still controlled by the other permissions listed here.
* **AWS CloudMap**
    - Describe and tagging capabilities for all resources
    - Basic read/update/delete permissions
    - Limited permissions for other operations
* **AWS CloudTrail**
    - Describe and tagging capabilities for all resources
    - Start Logging
    - Limited permissions for other operations
* **AWS CloudWatch**
    - Tagging capabilities for all CloudWatch resources
    - Basic read/update/delete permissions
    - Limited permissions for other operations
* **AWS CloudWatch Logs**
    - Describe and tagging capabilities for all resources
    - Basic read/update/delete permissions
    - Limited permissions for other operations
* **AWS CodeBuild**
    - Tagging capabilities for all resources
    - Basic read/update/delete permissions
    - Limited permissions for other operations
* **AWS CodePipeline**
    - Describe and tagging capabilities for all resources
    - Basic read/update/delete permissions
    - Limited permissions for other operations
* **AWS Cost Explorer**
    - Full access for all Cost Explorer capabilities
* **Amazon Elastic Container Service (ECS)**
    - Describe and tagging capabilities for all resources
    - Basic read/update/delete permissions
    - Limited permissions for other operations
* **Amazon Elastic Container Registry (ECR)**
    - Describe and tagging capabilities for all resources
    - Basic read/update/delete permissions
    - Limited permissions for other operations
* **Amazon EC2**
    - Describe and tagging capabilities for all resources
    - Basic read/update/delete permissions
    - Limited permissions for other operations
* **Elastic Load Balancer**
    - Describe and tagging capabilities for all resources
    - Basic read/update/delete permissions
    - Limited permissions for other operations
* **Amazon EventBridge**
    - Tagging capabilities for all resources
    - Basic create/update/delete permissions
    - Limited permissions for other operations
* **AWS Identity and Access Management**
    - Describe and tagging capabilities for all resources
    - Basic create/update/delete permissions
    - Limited permissions for other operations
* **Key Management Service (KMS)**
    - Tagging capabilities for all KMS resources
    - Decrypt capability for KMS resources
* **AWS Lambda**
    - Describe capabilities for all resources
    - Basic create/update/delete permissions
    - Limited permissions for other operations
* **Amazon Relational Database Service (RDS)**
    - Describe and tagging capabilities for all resources
    - Basic create/update/delete permissions
    - Limited permissions for other operations
* **Amazon Route 53**
    - Describe and tagging capabilities for all resources
    - Basic create/update/delete permissions
    - Limited permissions for other operations
* **AWS Secrets Manager**
    - Describe capabilities for all resources
    - Basic create/update/delete permissions
    - Limited permissions for other operations
* **AWS Systems Manager**
    - Tagging capabilities for all resources
    - Basic create/update/delete permissions
    - Limited permissions for other operations
* **Amazon Simple Notification Service (SNS)**
    - Describe and tagging capabilities for all resources
    - Basic create/update/delete permissions
    - Limited permissions for other operations
* **Amazon Simple Storage Service (S3)**
    - Describe and tagging capabilities for all resources
    - Basic create/update/delete permissions
    - Limited permissions for other operations

The CloudFormation template deployment that TinyStacks creates begins with the name **TinyStacksRole**. If you wish to revoke TinyStacks' access to your AWS account, you can delete this deployment at any time. Note that, once deleted, TinyStacks will no longer be able to stand up, modify, or present the status of stacks in your AWS account unless you re-deploy it.

You can see the full role in your AWS account's IAM dashboard. You can also view it [on our IAM Policy page](iam-policy.md).

## Git Repository Permissions Required by TinyStacks

In order to access your Git account, TinyStacks will request permissions for your Git repositories residing in GitHub or GitLab. 

GitHub permissions requested include: 

* Read access to organizational metadata
* Administrator access to repositories. You can either allow access to all repositories or restrict GitHub to accessing select repositories only
* Read/write access to administration, checks, code, commit statuses, deployments, discussions, packages, pull requests, and webhooks.

GitLab permissions requested include:

* Read access to organizational metadata
* Administrator access to projects
* Read/write access to administration (CRUD operations on repositories), checks, commit statuses, contents, deployments, discussions, packages, and pull requests.

The exact permissions requested from GitHub and GitLab may change over time.
