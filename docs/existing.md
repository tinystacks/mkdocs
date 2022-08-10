In our guide to [creating your first stack](create-stack.md), we showed you how to launch one of our sample applications as a fully scalable deployment on the cloud. But it's just as easy to package and deploy an existing application! 

## Framework support

TinyStacks directly supports projects the following languages and frameworks: 

* Node.js
* Python
* Java
* PHP
* Ruby

If your project uses one of these languages or frameworks, congratulations! Your code will run as is on TinyStacks with no manual intervention required. 

You can also run any other framework or language (e.g., .NET Core, Rust, Go, etc.) by building it into a Docker container. This will require adding a few files to your repository. If you're unfamiliar with Docker, [check out our walk-through for creating a Dockerfile](https://www.tinystacks.com/blog-post/hello-world-express-app-with-docker/) on the TinyStacks blog. 

## Prerequisites

Before you begin this guide, make sure you have set up your AWS and Git service connections as outlined in [Configure AWS and Git service connections](service-connections.md).

As discussed above, if your framework or language is currently not supported directly by TinyStacks, you will need to have a Dockerfile in the root of your repository.

## Create a new stack

After you configure your connections, you'll be prompted to select a project. You can either select a TinyStacks starter project or use your own project. For this guide, we'll be using your own project. 

Select **My projects**. You should see a list of all of the repositories available in your Git account. Find the repository whose code you are going to deploy and click **Prepare to deploy**.

![TinyStacks - select a project for your stack](img/tinystacks-existing-select-project.png)

You should now be on the **Configure your stack page**. 

## Configure your stack

On the **Configure your stack** page, you will be able to set a few parameters for your stack:

* **Project name**. Give your project an easily identifiable name. Since we will use this name when creating various components of your infrastructure, it's best to keep it short. We recommend using 20 characters or less.
* **Branch**. The Git branch from which to build your code. For a production deployment, this is typically **main** or **master**. 
* **Port**: If the application in your Docker container is using a port other than the default (8000) to serve traffic, enter it here. 
* **Custom health check**: AWS services such as Application Load Balancer use health checks to determine if an instance of your application is running correctly. Instances that fail a health check are destroyed and replaced with healthy instances. By default, TinyStacks uses the endpoint `/healthy` to check application health. If you use a different endpoint, specify it here. 

![TinyStacks - configure your stack](img/tinystacks-existing-configure-your-stack.png)

When ready, click **Next**. 

## Select your framework

On the next page, you'll be asked to confirm your settings. You will also need to select your application framework and framework version. 

If you choose a supported framework like Node.js, Python, etc. (i.e., anything other than Docker), you will have several fields where you can customize the root directory of your app. You will also need to specify the Build and Run commands. For example, for a Django app, you would specify `pip3 install -r requirements.txt` to install all required Python packages and `gunicorn --worker-tmp-dir /dev/shm mysite.wsgi` to start Gunicorn and run your Django app. 

![TinyStacks - configure your stack](img/tinystacks-existing-configure-supported-frameworks.png)

If you choose Docker as your application framework, we'll ask you to provide the relative path of your directory where your Dockerfile resides in your repository.

![TinyStacks - configure your stack](img/tinystacks-existing-configure-framework.png)

Once you are done, click **Set up infrastructure**. 

### Docker apps: additional instructions

*Note*: This section only applies if you select **Docker** as your framework. All other supported frameworks require no manual intervention. 

If you choose Docker, on the next screen we will give you a set of files to download and add to your Git repository: 

* A `Dockerfile`. This file contains the instructions for preparing your Docker container, which will run your application code. Your container will need to contain your application framework, as well as any configuration files and environment variables necessary to run your application. 
* A `build.yml` file, which AWS CodeDeploy will use to create the latest version of your Docker container and store it in an Amazon Elastic Code Repository (ECR) repo in your AWS account. 
* A `release.yml` file, which AWS CodeDeploy will use to run your Docker container on an Amazon Elastic Container Service (ECS) cluster hosted in your AWS account. 

For more details on these files and the elements of a TinyStacks deployment, [see our architecture page](architecture.md).

The root directory of your repo should look something like the example below after you are done:

![TinyStacks - root of repository with all required files present](img/tinystacks-existing-3.png)

Once you are done, click **Next**. 

## Choosing serverless or container deployment

You have one more step to go and then you're ready to launch your stack! After clicking **Deploy**, you'll see the screen below. Here, you need to select whether to launch your application using either serverless or container architecture. 

![TinyStacks - configure stack](img/tinystacks-create-8.png)

To keep costs low for this initial walk-through, select **Serverless**. (For more information on which architecture to choose for production applications, see (Architecture)[architecture.md] and (Serverless)[serverless.md].)

## Further customizing your deployment

This screen visualizes all of the AWS resources that TinyStacks will use or create on your behalf. These components and what they contribute to your stack are discussed in detail [in our architectural guide](architecture.md). Briefly, they include: 

* Your **Git repo** (either GitHub or GitLab) that holds your application code. 
* **AWS CodeBuild** to build and deploy your project as a Docker container. 
* An **Amazon Elastic Container Repository (ECR) repo** for storing your Docker container's versions. 
* An **Amazon Elastic Container Service (ECS) cluster** for hosting your running Docker containers. 
* **Amazon API Gateway** for routing traffic to your application's exposed endpoints. 
* **Amazon CloudWatch** for monitoring performance and storing application logs.
* An optional **database** for storing application data. 

Additionally, you can see and configure several additional options: 

* The **AWS pricing breakdown** gives you a sense of what you'll spend per month for your stack in its current configuration. 
* You can define **Environment variables** as name-value pairs that will be exposed as environment variables to your running application's Docker container. 

If a tile has a gear icon in the upper right corner, you can click it to configure advanced options for that tile. Configurable options include the following. 

### Configure Your VPC (optional for serverless)

If you choose container architecture, TinyStacks will by default create a new, secure VPC with three public and three isolated subnets. Your application will run into the isolated subnets. 

![TinyStacks - configure VPC](img/tinystacks-vpc-config.png)

You can click the gear icon to opt instead to use your own pre-created VPC from your AWS account. You can use your own VPC that you created or a VPC that TinyStacks created for one of your other stacks. 

![TinyStacks - configure VPC](img/tinystacks-vpc-select-existing.png)

You can also option to turn the isolated subnets into private subnets by adding a NAT Gateway. This will enable applications running in these subnets to make calls out to the public Internet. You should enable this if your application has an external dependency, such as on a publicly hosted Web service. (Note: You will incur an hourly charge for your NAT Gateway as well as data transfer charges for every 1GB of data that flows to the Internet or to compute capacity in a different Availability Zone. See the [AWS NAT Gateway Pricing page](https://aws.amazon.com/vpc/pricing/) for more details.)

![TinyStacks - configure VPC](img/tinystacks-vpc-nat-gateway.png)

Note that serverless applications, by default, do not run in a VPC. You can, however, opt to run them in a VPC that's already defined in your AWS account. 

### Add a Database

Click **Enable** to create an Amazon RDS Postgres database, an Amazon RDS MySQL database, or a Redis in-memory database for your account. Use the settings option to select an existing database instead and to configure other database-related options. 

For more information on the available database options on TinyStacks, see [Databases](database.md).

### Amazon ECS (container architecture only)

Configure build and scale settings for your Amazon ECS cluster, such as the size of the Amazon EC2 instances used in your cluster. (If you're not familiar with these settings, you can leave them as the default for now.)

### AWS Lambda (serverless architecture only) 

Configure scale settings for your AWS Lambda function, including the memory available to your application and the runtime timeout setting. (If you're not familiar with these settings, you can leave them as the default for now.)

![TinyStacks - select serverless](img/serverless-settings.png)

### Front-End Routing 

Choose between using Amazon API Gateway or Application Load Balancer for front end application routing. 

You can change any of these options now or change them later, after your original deployment. Your stack will also build as is, without any additional configuration. For now, start the creation of your first stack by clicking **Build**.

## Testing your stack

Once you're ready, click the **Build** button to build your Docker container and deploy it to AWS. 

Your application's environment will take a few minutes to build. We'll present detailed status updates in the upper-right corner of this as we build out your stack.

Once it's done, you'll be taken to the **Stacks** page on your TinyStacks account, where you can see your running stack listed. 

![TinyStacks - list of stacks in your account](img/tinystacks-create-12.jpg)

Click on your stack's name to navigate to the Stack Details page. 

![TinyStacks - stack details page](img/tinystacks-create-13.jpg)

This page shows your stack and all of the stages you've defined. The initial stack creation process creates a single stage named `dev`. You can use the **Add stage** button to add more stages at any time.

For now, let's test out the dev stack and ensure it's working. On the lower right corner of the `dev` box, click **Copy endpoint**. 

You can use this base URL to access a valid page or REST API call in your application. If everything is configured correctly, you should see your application return an appropriate response to your request.

## Properly containerizing your application

By following the steps above, your application should deploy and run in the cloud. However, you may notice some issues running your code if you haven't prepared your application to run in a container. 

[As explained in our architectural overview](architecture.md), a Docker container is a virtualized operating system that contains all of the executable files, scripts, shared libraries, configuration files and other dependencies required for your application to run. In order to scale your application to handle upwards of millions of requests, your AWS account will need to run multiple copies of this container across multiple nodes in an Amazon ECS cluster. 

If your application has been designed as a monolithic application, it may make certain assumptions about its runtime environment that won't hold true after your application is containerized. If you are seeing errors or strange behavior in your application, here are a few things to consider. 

### Filesystem storage

Each running Docker container instance has its own virtualized filesystem. Data written to this filesystem in one running container instance won't be visible to other running instances. Ensure that any data that all container instances must access is written to a shared location - e.g., a database, a cloud storage service like Amazon S3, or an in-memory cache server like <a href="https://aws.amazon.com/elasticache/" target="_blank">Amazon ElastiCache</a>.

### Configuration

Each running container instance will need its own copies of whatever configuration files your application might need. If you need to update any of these configuration files, you will need either to push changes through Git, or store the configuration in a location that all of your running container instances can access dynamically (such as Amazon S3). 

### Shared memory

A monolithic application running on a large server or virtual machine may cache some values in memory. This lightens the load on the application's database and can speed up responses to user requests. 

However, naive caching won't work in a scenario where multiple instances of your application are running. Additionally, in serverless applications, AWS will shut down instances of your application if they don't receive traffic within a given time period.

If you are running with a Container framework, you can mitigate this issue in the short term by constraining your application to launch only a single instance of your container. In the long term, you can integrate a shared memory cache such as <a href="https://aws.amazon.com/elasticache/" target="_blank">Amazon ElastiCache</a> into your application. 