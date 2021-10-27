In today’s marketplace, you have no limit of choices when it comes to application deployment. We believe that TinyStacks offers the most transparent and flexible path for small shops and teams looking to grow up and out. 

Here’s a short summary of how we stack up (pun *absolutely* intended) against other solutions. 

## Amazon Web Services (AWS)

We’re big fans of AWS at TinyStacks. Our founders are former engineering leaders at AWS. Our own service - and the services we deploy for customers - depend on it. In terms of features and scalability, AWS is the undisputed leader in public cloud technology. 

But while AWS is great, onboarding to AWS can be challenging - especially for smaller shops. Its web of overlapping features can take weeks or even months to understand, let alone master. Bringing an application onto AWS in a scalable, secure manner typically requires at least one dedicated DevOps engineer. 

AWS has taken numerous steps in response to complaints about its complexity. One of the most popular is its Cloud Development Kit (CDK), a set of command-line tools intended to ease onboarding to AWS. However, the CDK supposes an existing knowledge of AWS services. It also currently supports only a small number of languages. 

TinyStacks aims to simplify your team’s onboarding to AWS. Using TinyStacks, you can bring your existing app into the cloud in a matter of days or weeks as opposed to months. And, as your team’s knowledge of AWS grows, you’re free to incorporate the service’s rich features into your own applications - all while using TinyStacks to deploy and monitor your stacks easily. 

## AWS Amplify

AWS Amplify is an AWS feature geared towards creating Web and mobile applications. Amplify supports creating both back-end resources - databases, authentication, and storage - along with static Web and mobile front ends that connect to them. 

Amplify may be the right choice for some projects. But it brings serious overhead that may inhibit its suitability for others. Amplify takes a walled garden approach to application development. It steers developers towards certain architectural choices - such as Amazon Cognito for authentication and DynamoDB for data storage - that may not be right for your app. Additionally, Amplify ships with a weighty (2MB) client library that could negatively impact application load times. Finally, AWS Amplify’s pricing model somehow manages to make AWS pricing even **more** complicated.

Unlike Amplify, the TinyStacks DevOps workflow can be used with a variety of development stacks. We also don’t dictate critical architectural decisions such as data storage and authentication. 

## Amazon Lightsail 

Lightsail is Amazon’s Platform as a Service (PaaS) offering, enabling developers to deploy out- of-the-box packaged applications (like WordPress) and common development stacks with a few button clicks. Like other PaaS offerings, Lightsail works on a fixed-cost model, meaning that monthly charges are steady and predictable. 

However, Lightsail is only easy to use for the easy stuff. Lightsail deployments are based on creating individual Amazon EC2 instances. Lightsail deployments don’t implement horizontal scaling by default, meaning they won’t add new instances automatically to handle usage spikes. [Setting up a horizontal scaling deployment with a load balancer on Lightsail is almost as involved](https://metablogue.com/load-balancer-lightsail/) as performing the same task on native AWS.

TinyStacks combines ease of use with out-of-the-box scalability. A stack created by TinyStacks will always scale to meet the needs of your business. With a few clicks, you can deploy scalable architecture on AWS while only paying for what you use. 

## Heroku

Heroku is a PaaS provider, itself built on AWS, that makes it easy to deploy applications with low computational workloads. 

Teams that start with Heroku can have great success with the platform...for a while. But as your application grows and becomes more complex, it may start to outstrip the capabilities that Heroku offers. 

TinyStacks provides an easy-to-use bridge between services like Heroku and AWS. With TinyStacks, you can migrate your Heroku apps to the cloud and gain the following benefits:  

* **Performance**. While Heroku performs well for small computational loads, many teams struggle with performance as their workloads and traffic increase. TinyStacks uses services such as Amazon ECS and API Gateway to ensure your application can scale to meet demand. 
* **Services**. Heroku only exposes a fraction of AWS’s rich feature set. TinyStacks provides the ease of use of a service like Heroku combined with the full power of AWS. You can start simple with your stack and slowly expand your application’s features to take advantage of the full range of services that AWS has to offer. 
* **Cost**. Heroku becomes increasingly expensive as your application scales out. TinyStacks works relentlessly to ensure you’re getting the most cost-effective solution with your AWS stack deployments, no matter your application’s size and scale. 

## DigitalOcean

Like Heroku, DigitalOcean can be a good choice for development teams when they start out. DigitalOcean’s App Platform simplifies code deployment. And its fixed-price pricing model is alluring for firms just dipping their toes into the cloud. 

However, like Heroku, DigitalOcean offers a minimalistic set of features. As your business grows, it’s likely you’ll outgrow DigitalOcean. Plus, DigitalOcean doesn’t provide any DevOps support or tools to manage application pipelines. If you want to have separate dev/test environments distinct from production or want to stand up a demo site for prospective customers, you’ll need to roll it yourself. 

TinyStacks provides the ease of use of a platform like DigitalOcean backed by the power of AWS. Additionally, we make it easy to create and manage a full DevOps pipeline with separate dev, test, and prod environments - all without needing to hire a full-time DevOps engineer. 

## Render

Render is a Heroku competitor that provides a streamlined experience for deploying apps for a wide variety of developer frameworks. The company offers multiple higher-level features, such as Content Delivery Network (CDN) support and HTTP health checks. 

Like Heroku, however, Render deploys cloud resources on your behalf. The lack of transparent access to an underlying cloud provider limits growth. Eventually, you will run into scenarios that require access to the full capabilities of a service such as AWS. 

TinyStacks was built to make cloud deployment easier - not to limit your application’s growth. Since TinyStacks applications run in your own AWS account, you retain full control and visibility over them. 

## Managed Kubernetes

Another option your team might be weighing is a managed Kubernetes approach. Kubernetes (“k8s”) is a popular container orchestration and management system that works with Docker and other containerization technologies. It’s gained such a reputation for its scalability and reliability that every major cloud provider and many PaaS providers offer some form of managed Kubernetes hosting. 

The problem with Kubernetes? Complexity. For a team just transforming itself into a DevOps operation, Kubernetes has a daunting ramp-up time. It can take existing engineers months to ramp up on the system - and engineers with existing Kubernetes experience aren’t cheap.

Some PaaS-style Kubernetes solutions have managed to tame the complexity issue (somewhat) for first-time k8s developers. However, making them production-ready is often still a complex task that involves understanding and configuring multiple pieces of networking, logging, and monitoring software. And most managed k8s solutions don’t solve the issue of standing up a full DevOps pipeline to flow changes between dev, test, and production. 

Finally, managed Kubernetes solutions tend to be pricey. For example, using AWS’s managed solution, Elastic Kubernetes Service (EKS), will add an additional hourly cost on top of the underlying EC2 capacity used. 

TinyStacks does more than just simplify deployment - it supports a full DevOps architecture for growing teams. With a few button clicks, your team can create multiple stacks and bring additional rigor and reliability to your release process.
