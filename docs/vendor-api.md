As a vendor, TinyStacks gives you the tools to publish applications for your customers on a self-service model. Once published, customers can access a custom URL to deploy the stack and any subsequent updates into their cloud accounts. 

Here are the steps for setting up your first TinyStacks-deployable customer stack. 

## Connect account access to your Git repository

First, you’ll need to wire up a supported Git repository to your TinyStacks account. TinyStacks supports using Git repositories hosted on GitHub or GitLab. 

When you first log in to TinyStacks, you'll be prompted to create a Git connection. 

![TinyStacks Create First Stack screen](img/tinystacks-create-1.png)

Select which Git service you plan to use: GitHub or Gitlab. A separate window will open. If you are not logged in to your selected service, you will be prompted to log in now. 

![TinyStacks add git account prompt](img/tinystacks-create-2.png)

Once logged in, you will need to grant authorization for TinyStacks to access your GitHub or GitLab account. This will allow us to add a repository to your account (if you use one of our starter projects) or read an existing repository (if you use your own project). 

For more information on administering service connections, in your account, see [Managing service connections](connections-manage.md).

## Create a code source

Next, you'll use the TinyStacks API to create a stack. The TinyStacks API provides REST API endpoints for creating and managing Infrastructure as Code (IaC) deployments on TinyStacks. Use this API to integrate TinyStacks deployments into your existing CI/CD infrastructure.

To create a new IaC deployment, first create a new code source using the [/infrastructure-code-sources method](https://docs.tinystacks.com/api/). A code source consists primarily of a Git repository, along with settings indicating which IaC toolset your deployment uses. (Currently supported toolsets are the AWS Cloud Development Kit and Terraform.)

Sample payload:

```json
{
    "name": "test-demo",
    "description": "A demo code source",
    "region": "us-east-2",
    "cloudProvider": "aws",
    "repository": {
    "cloneUrl": "https://github.com/tinystacks/awscdk-samples-eks-rds.git",
    "defaultBranch": "main",
    "name": "awscdk-samples-eks-rds",
    "provider": "github",
    "owner": "tinystacks"
    },
    "parameters": {
    "TEST_KEY": {
        "displayName": "test title",
        "propertyType": "String",
        "defaultValue": "some random value",
        "description": "Fill this out to do nothing",
        "required": true
    }
    },
    "infrastructureCodeType": {
    "format": "AWS_CDK",
    "language": "typescript"
    }
}
```

Sample cUrl command:

```shell
curl https://api.tinystacks.com/infrastructure-code-source/ -H "Content-Type: application/json" -H "Authorization: Bearer XXXX" -d @payload.json
``` 

Creating a code source will start the initial IaC build and generate your build artifacts. You can check the status of the build by calling the 

To retrieve build logs for detailed error messages, use the [/infrastructure-code-sources/logs/{sourceName}](https://docs.tinystacks.com/api/) method and examine the `status` property. 

## Create a stage

Next, create a stack and its associated stages using the [`/infrastructure-code-stacks`]((https://docs.tinystacks.com/api/) method. A stack represents a release pipeline, with each stage being a step in the pipeline. 

## Create a stack

Next, create a stack and its associated stages using the [/infrastructure-code-stacks/{stackName}/{stageName}/deploy](https://docs.tinystacks.com/api/) method. A stack represents a release pipeline, with each stage being a step in the pipeline.

## Test your deployment

TBD