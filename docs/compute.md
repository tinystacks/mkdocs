As discussed on our [Architecture](architecture.md) page, TinyStacks uses Amazon Elastic Container Service (ECS) to host your application's Docker containers. 

### Your ECS Cluster 

On AWS, containers can be hosted in one of two ways: 

* On an ECS cluster (a group of Amazon ECS virtual machine instances) hosted on your AWS account; or
* Via AWS Fargate, a fully managed container hosting service. 

Fargate still runs your container on clusters of EC2 instances. However, these instances are managed by AWS and are never visible in your account. In Fargate, your container may run on the same EC2 instances as containers launched by other AWS customers. 

TinyStacks uses EC2 clusters hosted in your own AWS account. The primary considering behind this decision was cost. Our own experiments showed that <a href="https://blog.tinystacks.com/ecs-serverless-or-not-fargate-vs-ec2-clusters" target="_blank">using EC2 instances resulted in a 40% cost savings</a> to our customers. 

### ECS services

There are two ways to run containers on ECS. One is to run individual tasks, or running instances of your container. The other is to run your container as a service. An ECS service runs a specified number of instances of your container on your cluster. 

Using a service provides an additional level of quality for your application. If a container task fails and stops running, ECS can detect this and replace it with a new, healthy instance. ECS services also contain logic to limit container re-spawn and thus reduce thrashing. 

TinyStacks uses the `REPLICA` service scheduler strategy, which spreads task instances evenly across cluster instances and AWS availability zones (AZs). This ensures high application reliability should a single AZ become unavailable. 

For more information, <a href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ecs_services.html" target="_blank">see the AWS documentation on services</a>.

#### Running and updating your container

Your container is defined using a <a href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task_definitions.html" target="_blank">task definition</a>, a versioned specification that defines various parameters for your running container. 

When you publish a new version of your application, TinyStacks creates a new version of the task definition and publishes it to the service. Your service will gradually spin down instances of its old container and spin up instances of the new one in order to prevent any service interruptions. 

### Scaling

You can configure your application to scale to handle increased load in one of two ways: 

* Scaling out the number of Amazon EC2 instances running in your ECS cluster.
* Scaling out the number of running instances of your container. 

For detailed information, see [Autoscaling](autoscaling.md). 