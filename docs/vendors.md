We're happy to have you join TinyStacks! We're happy to partner with you to deploy your applications and infrastructure quickly and easily into your customer's environments.

In this document you'll find some information on how you can get started onboarding your applications to TinyStacks. We don't expect this will answer every question you might have. Think of it as the beginning of a conversation. If you have any questions or concerns, please schedule time to talk directly. 

## What we need from you

At TinyStacks, we're ready to create a stack for your application that you and your customers can deploy with a few button clicks. To get there, we'll need a little bit of information from you.

### Your application

This can be in the form of a Git repository to which we have access rights. Let us know if you already have a working Dockerfile for compiling your app into a Docker image. (No worries if you don't - we can compile to Docker directly for most major frameworks.)

### Your system architecture 

A description of your system and all of the components it requires to run. This can take the form of a design document or an architecture diagram. 

### Access roles and permissions

The identity roles (e.g., AWS Identity and Access Management roles) that you use to access your customer's cloud accounts, along with all related permissions. TinyStacks will use a custom access role for your deployments scoped down to exactly the permissions your infrastructure needs and no more. 

### Infrastructure code

You may already have assets such as AWS CloudFormation templates or procedural code you use to build out your application infrastructure. If so, please provide it to us (even if it's incomplete). 

## Shared responsibility model

Once your application is in a deployable state, you and TinyStacks will work together on maintaining customer deployments via a shared responsibility model. 

You and your company will own your application and any functional issues that arise from its operation. This includes functional usage of cloud features such as data storage, virtual servers, etc., as well as all usage of cloud provider APIs. 

TinyStacks owns and takes responsibility for the distribution and ongoing operation of your base infrastructure. In other words, if there is a deployment failure or a stability issue with a deployed component (e.g., an ECS node goes down and is not replaced in a timely fashion), TinyStacks will investigate and resolve the issue. 

The line between these two sets of issues may not always be evident at first blush. For example, there may be instances where your application's behavior is causing infrastructure issues. In such cases, TinyStacks will work closely with you on the initial investigation to pinpoint the failure and determine ownership of responsibility. 

## Get more assistance

TinyStacks stands willing and ready to assist you during the onboarding process. If you have questions related to a specific application or project, please schedule time with us to discuss.