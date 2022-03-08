At TinyStacks, we design all of our solutions with security in mind. In this article, we describe the measures that TinyStacks takes to ensure the security of your stack. We also discuss the permissions required by TinyStacks to operate on your connected accounts. 

## Stack Security 

Every stack in TinyStacks is created with a secure architecture. The security measures we've taken include: 

**Hosting your stack in a VPC with public/isolated subnets**. TinyStacks hosts your stack with three public subnets and three isolated subnets. We place your (optional) PostgreSQL database and ECS cluster compute instances in the isolated subnets for additional protection.

As discussed [in our architecture overview](architecture.md), we use one of two methods to provide public access to your application, depending on the scaling option you're using:

* **Application Load Balancer**: Your ALB is hosted in your public subnets. Since it's located in the same VPC as your isolated subnets, it can interact freely with your containers over your container's exposed ports.
* **API Gateway**: If you use API Gateway, we create a VPC link between API Gateway and your isolated subnets. This allows for secure communication between your API endpoints and your containers without traffic flowing over the public Internet. 

**Security groups**. We define security groups on all components of your architecture that restrict communications to trusted entities. For example, our security group rules ensure that only your containers running in your isolated subnets can connect to the appropriate port on your TinyStacks-provisioned PostgreSQL database (and, optionally, your database bastion host if you create one). Similarly, if you use Application Load Balancer for your API endpoints, your containers restrict access to their exposed port(s) to the ALB instance running in your VPC. 

**Secure database access**. When TinyStacks creates a PostgreSQL database for your application, we create it inside your isolated subnets. This secures your database against access from outside your VPC. You can also optionally create a bastion host, which will enable secure SSH tunneling to your VPC in case your team requires direct database access. 

**Encrypting secrets**. All secrets used by your stack (such as your database connection information and credentials) are stored in encrypted format in [AWS Secrets Manager](https://aws.amazon.com/secrets-manager/). For example, when you ask TinyStacks to create a PostgreSQL database for your stack, TinyStacks stores the database name, hostname, username, password, and other sensitive access information in an entry in AWS Secrets Manager. TinyStacks does not store encryption keys or plaintext secrets for secrets hosted in customer accounts.

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
    - Ragging capabilities for all API Gateway resources
    - POST, GET, PUT, PATCH, DELETE
* **Application Autoscaling**
    - Describe and tagging capabilities for all Application Autoscaling resources
    - Register and deregister Scalable Targets
    - Put and delete Scaling Policies
    - Put and delete Scheduled Actions
* **Autoscaling**
    - Describe and tagging capabilities for all Autoscaling resources
    - Create, get, update, and delete Scaling Plans
    - Create, get, update, and delete Scaling Plans
    - Create and delete Launch Configurations
    - Create, update, delete, and terminate Auto Scaling Groups
    - Delete Scheduled Actions
* **Amazon CloudFront**
    - tagging capabilities for all CloudFront resources
    - Create and get CloudFront Distributions
* **AWS CloudFormation**
    - Full access for all CloudFormation capabilities
        * Note that while this allows us to call a particular action in CloudFormation, the access to the specific action and resource is still controlled by the other permissions listed here.
* **AWS CloudMap**
    - Get and tagging capabilities for all CloudMap resources
    - Create and delete Serivces for service discovery
    - Create and delete Private DNS Namespaces for service discovery
* **AWS CloudTrail**
    - Describe and tagging capabilities for all CloudTrail resources
    - Start Logging
    - Put Event Selectors
    - Create and delete Trails
* **AWS CloudWatch**
    - Tagging capabilities for all CloudWatch resources
    - Put, list, get, and ddlete Dashboards
* **AWS CloudWatch Logs**
    - Get, describe, and tagging capabilities for all CloudWatch Logs resources
    - Create, update, list, and delete Log Deliveries
    - Create Log Groups
    - Create Log Streams
    - Put Log Events
    - Put Resource Policies
    - Put Retention Policies
* **AWS CodeBuild**
    - Tagging capabilities for all CodeBuild resources
    - Create, update, list, get, and delete Projects
    - Get Builds
* **AWS CodePipeline**
    - List, get, and tagging capabilities for all CodePipeline resources
    - Create, update, and delete Pipelines
    - Start and stop Pipeline Executions
* **AWS Cost Explorer**
    - Full access for all Cost Explorer capabilities
* **Amazon Elastic Container Service (ECS)**
    - List, describe, and tagging capabilities for all ECS resources
    - Create, update, and delete Clusters
    - Create, update, and delete Services
    - Create, update, delete, register, and deregister Task Definitions
    - Create, update, delete, and describe Capacity Providers
    - Put Cluster Capacity Providers
* **Amazon Elastic Container Registry (ECR)**
    - Get and tagging capabilities for all ECR resources
    - Create, describe, and delete Repositories
    - Put Image Scanning Configuration
* **Amazon EC2**
    - Describe and tagging capabilities for all EC2 resources
    - Create, copy, import, export, register, and deregister Images
    - Start, stop, run, reboot, and terminate EC2 Instances
    - Create and delete NAT Gateways
    - Create, replace, and delete Routes
    - Create, replace, delete, associate, and disassociate Route Tables
    - Create and delete Security Groups
    - Authorize and revoke Security Group Ingress and Egress
    - Associate and disassociate Subnet Cidr Blocks
    - Create and delete Subnets and Default Subnets
    - Create, get, and delete Subnet Cidr Reservations
    - Modify Subnet Attributes
    - Create and delete Virtual Private Clouds (VPC)
    - Modify VPC attributes
    - Create, modify, delete, accept and reject Transit Gateway Vpc Attachment
    - Create, modify, delete, accept and reject 
    - Allocate, release, associate, and disassociate Addresses (Elasitc IPs)
    - Modify and reset Address Attributes
    - Allocate Hosts
* **Elastic Load Balancer**
    - Describe and tagging capabilities for all Elastic Load Balancing resources
    - Create, modify, and delete Listeners
    - Create and delete Load Balancers
    - Create, modify, and delete Target Groups
    - Modify Target Group Attributes
    - Modify Load Balancer Attributes
* **Amazon EventBridge**
    - Tagging capabilities for all EventBridge resources
    - Put and remove Event Targets
    - Put, describe, and delete Event Rules
* **AWS Identity and Access Management**
    - List, get, tag, and untag capabilities for all IAM resources
    - Create, delete, add role, and remove role for Instance Profiles
    - Create and delete Polcies
    - Create, update, pass and delete Roles
    - Put, delete, attach, detach, and update Role Policy
* **Key Management Service (KMS)**
    - Tagging capabilities for all KMS resources
    - Decrypt capability for KMS resources
* **AWS Lambda**
    - List, get, and tagging capabilities for all Lambda resources
    - Create, update, invoke, and delete Lambda Functions
    - Add and remove permissions
    - Put and delete function concurrency
    - Put, update, and delete function code signing config
    - Put, update, and delete function event config
    - Update function code
    - Update function configuration
    - Publish and delete layer versions
    - Add and remove layer version permissions
* **Amazon Relational Database Service (RDS)**
    - Desribe and tagging capabilities for all RDS resources
    - Create and delete Subnet Groups
    - Create, modify, and delete Database Instances
    - Create and promote Read Replicas
* **Amazon Route 53**
    - Get, list and tagging capabilities for all Route53 resources
    - Create and delete Hosted Zones
    - Assoicate and disassociate VPC with Hosted Zones
    - Enable and disable Hosted Zone DNS Security Extensions (DNSSEC)
    - Update Hosted Zone Comments
* **AWS Secrets Manager**
    - Tagging capabilities for all Secrets Manager resources
    - Create and delete Secrets
    - Get and put Secret Values
    - Get random passwords
* **AWS Systems Manager**
    - Tagging capabilities for all Systems Manager resources
    - Put, get, and delete Parameters
* **Amazon Simple Notification Service (SNS)**
    - List, get and tagging capabilities for all SNS resources
    - Create and delete Topics
    - Subscribe and Unsubscribe from Topics
    - Confirm Topic Subscriptions
    - Set Subscription attributes
* **Amazon Simple Storage Service (S3)**
    - Get, list and tagging capabilities for all S3 resources
    - Create and delete Buckets
    - Put and delete Bucket Policies
    - Put Encryption Configuration
    - Put Bucket Versioning
    - Put Bucket Public Access Block
    - Put Bucket Access control list
    - Put, delete, replicate, and restore Objects
    - Delete Object versions
    - Override Object Owner To Bucket Owner
    - Put Bucket Object Lock Configuration
    - Put Object Access control list
    - Put Object Verion Access control list
    - Put Object legal hold
    - Put Object retention

The CloudFormation template deployment that TinyStacks creates begins with the name **TinyStacksRole**. If you wish to revoke TinyStacks' access to your AWS account, you can delete this deployment at any time. Note that, once deleted, TinyStacks will no longer be able to stand up, modify, or present the status of stacks in your AWS account unless you re-deploy it.

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
