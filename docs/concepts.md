The following page defines the key concepts you need to know to use TinyStacks effectively. 

## Standing Up a DevOps Infrastructure

To deploy an application, development teams must define two major components. First, they need a way to stand up the cloud infrastructure needed to run their application. Second, they need a way to stand up this infrastructure, on-demand, whenever they have a feature or bug fix to ship. 

### Infrastructure as Code

Before the advent of the cloud, companies had to stand up physical infrastructure - servers in data centers connected to high-speed networks - in order to deploy Web-based applications. This changed with the advent of cloud service providers such as AWS, which provide computing capacity on demand. Instead of standing up permanent capacity, companies could now rent what they needed, shut it down when they were finished, and pay for only what they used. 

Cloud computing capacity can be activated manually - e.g., via the AWS Management Console. It can also be activated automatically - via a programming language such as Python, or a declarative language such as <a href="https://aws.amazon.com/cloudformation/" target="_blank">AWS CloudFormation</a>. This paves the way for **infrastructure as code**: the ability to provision the computing capacity an application requires in an automated, repeatable fashion. 

With infrastructure as code, a development team can deploy multiple releases of their application using the same template. Additionally, they can stand up and shut down environments with ease: a test environment can be spun up to verify an application’s integrity, and then shut down at the end of the testing run to conserve costs. A team can also deploy multiple types of environments - from an environment for developers to a full production-ready deployment - using the same code. 

### Continuous Integration and Continuous Deployment 

As discussed in the Architectural overview, TinyStacks aims to simplify two processes critical to rapid application development: **continuous integration** and **continuous deployment**. 

In continuous integration, changes to an application’s codebase are compiled immediately once they are committed to a branch in a repository. This ensures that the codebase is healthy and can produce a viable release. 

In continuous deployment, the output produced by continuous integration is made available for usage and testing. Continuous deployment leverages infrastructure as code to deploy, not just the application, but all the underlying computing capacity the application requires. The goal of continuous deployment is to put a new, verified release into customer’s hands as quickly as possible. 

The process used to compile and bundle an application and push it through various phases of testing is called a **release pipeline**. 

### TinyStacks Automates The Release Process

Both infrastructure as code and release pipelines are powerful concepts. The problem is that, historically, they both take considerable time and resources to implement. 

TinyStacks automates and simplifies the task of building a full end-to-end release process. It leverages infrastructure as code to deploy your applications with all of the cloud computing capacity and capabilities that it requires. Further, it provides a simple, intuitive user interface that you and your team can use to construct your own release pipelines.

## Services

A **service** corresponds to a traditional microservice or Web application.

## Stacks

A **stack** is a TinyStacks project that consists of a microservice or other Web application. A stack contains at least one stage (see below) and often contains multiple stages. 

## Stages

A **stage** is a deployment intended for testing or use at a specific point in the development process. 

A release pipeline typically consists of multiple stages. Development teams use stages to perform quality verification of a release before making it available to customers. While the type and number of stages will differ from team to team (or even project to project), a typical split is: 

* A **dev** stage for testing brand new feature additions or bug fixes that work locally on a developer’s environment. 
* A **test** stage where automated test suites can be run alongside manual testing by other team members or internal stakeholders. 
* A **staging** or **preprod** (pre-production) stage that mimics production and is used by internal employees and select customers to vet the final release. 
* A **prod** (production) stage that hosts the customer-facing version of your application. 

For more on how to configure and manage stages, see [Stages](stages.md).