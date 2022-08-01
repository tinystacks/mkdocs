### Virtual Private Clouds (VPCs)

One of the most technically complex aspects of setting up infrastructure on AWS is creating your Virtual Private Cloud, or VPC. A VPC establishes the IP address ranges available to your application in its own isolated address space, defines routing between your applications and other VPCs and the public Internet, and sets out security rules that control how others can interact with your network.

A VPC defines a set of IP address ranges using logical groupings called subnets. Subnets can be one of three types: 

* **Public**: Traffic is allowed in from and out to the Internet and between subnets within the VPC. Inbound traffic is still often restricted to specific ports (e.g., ports 80 and 443 for Web apps). 
* **Private**: Traffic is allowed between subnets within the VPC. Requests can be made out to the public Internet via a NAT gateway. 
* **Isolated**: Traffic is allowed between subnets within the VPC. There is no defined route for Internet requests.

By using a combination of private/isolated and public subnets, application developers can create a secure hosting environment that reduces an application's surface attack area and minimizes the risk of intrusion. 

Designing and deploying a secure VPC usually requires a solid knowledge of networking and of AWS. TinyStacks eliminates this requirement by deploying every stack with a secure VPC by default.

Each TinyStacks VPC consists of: 

* **Three public subnets**. These subnets contain any public-facing infrastructure (e.g., your Application Load Balancer or API Gateway endpoints).
* **Three isolated or private subnets**. These subnets contain your ECS cluster instances and your database (if you provisioned it with TinyStacks). During stack creation process, we ask you if you want to add a NAT instance to your subnets. If you choose to add a NAT instance, the subnets are private. If you choose not to add a NAT instance, they are isolated.　By default, we create a NAT instance and private subnets.

Both sets of subnets are spread across different AWS <a href="https://aws.amazon.com/about-aws/global-infrastructure/regions_az/" target="_blank">Availability Zones</a>. Critical resources are hosted across three separate subnets and Availability Zones. This helps protect against unexpected outages by placing the pieces of your infrastructure in geographically isolated data centers on AWS. For example, if you launch three Amazon ECS instances in your ECS cluster, we spread these evenly across all three availability zones This means your application can still keep serving traffic if a single availability zone goes down. 

How we connect your ECS cluster instances to the Internet depends on the scaling option you choose. If you use Application Load Balancer, the ALB can forward requests to your container instances by virtue of running in the same VPC. 

![TinyStacks VPC diagram for Application Load Balancer](img/tinystacks-vpc-alb.png)

If you use API Gateway as your application front end, TinyStacks creates a VPC Link so that API Gateway can securely forward requests to your Docker container instances running on your cluster instances.

![TinyStacks VPC diagram for API Gateway](img/tinystacks-vpc-apig.png)

### Security Groups

Security groups in AWS define which resources on AWS or the public Internet can access certain AWS resources. We define security groups that restrict access to protected resources. For example, ECS cluster instances can only be accessed by your API Gateway or Application Load Balancer front ends at the specific port that you specify at stack creation time. Likewise, only the ECS cluster instances can talk to the database (unless you create a bastion host, as described below), and only on a single dedicated port.

This architecture reduces your application's potential attack surface by only publicly exposing the minimal surface area required for your application to operate. 

### Bastion Host

By default, we do not allow any Internet connectivity directly to your database. However, your team may need to access the database outside of your application (e.g., to run ad hoc queries or troubleshoot issues). 

To facilitate this, TinyStacks supports creating a <a href="https://aws.amazon.com/premiumsupport/knowledge-center/rds-connect-using-bastion-host-linux/" target="_blank">bastion host</a> for your database. The bastion host is an Amazon EC2 instance that sits in one of your public subnets and to which you can connect via SSH using a cryptographic key. Once on the bastion host, you can connect directly to your database in its isolated subnets.