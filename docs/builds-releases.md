As discussed in our [architectural overview](architecture.md), TinyStacks uses two YAML files ingested by AWS CodeBuild to manage your builds and releases.

## build.yml

The build.yml file is run only once per Docker container image. The build.yml file must tag an image with the tag `:latest` by the end of the build:

```
version: 0.2
phases:
  build:
    commands:
      - aws ecr get-login-password | docker login --username AWS --password-stdin $ECR_ENDPOINT
      - docker build -t builtimage .
      - docker tag builtimage:latest $ECR_IMAGE_URL:latest
      - docker push $ECR_IMAGE_URL:latest
```

You can apply as many additional tags as you like. The only restriction is that your tags cannot have the same name as one of the stages in your stack. 

### Build stage environment variables created by TinyStacks

TinyStacks defines the following build environment variables to each build. These are immutable and your build cannot override them: 

| Environment variable | Description                                                                                                                               |
|---------------------------|-------------------------------------------------------------------------------------------------------------------------------------------|
| S3_BUCKET                 | The Amazon S3 bucket where logs and build artifacts are stored.                                                                           |
| ECR_ENDPOINT              | The Amazon ECR repository where your application's Docker container image is stored.                                                      |
| ECR_IMAGE_URL             | The full URL to your container image.                                                                                                     |

## release.yml

Your release.yml file is run with every stage deployment (dev, staging, prod, etc.). The default release.yml supplied by TinyStacks tags your image created in the last stage with the name of the current stage and prepares a new deployment in Amazon ECS: 

```
version: 0.2
phases:
  build:
    commands:
      - docker login -u AWS -p $(aws ecr get-login-password --region $AWS_REGION) $ECR_ENDPOINT
      - docker pull $ECR_IMAGE_URL:$PREVIOUS_STAGE_NAME
      - docker tag $ECR_IMAGE_URL:$PREVIOUS_STAGE_NAME $ECR_IMAGE_URL:$STAGE_NAME
      - docker push $ECR_IMAGE_URL:$STAGE_NAME
  post_build:
    on-failure: CONTINUE
    commands:
      - region="${STAGE_REGION:-$AWS_REGION}" 
      - if [ -z "$SERVICE_NAME" ] || [ "$SERVICE_NAME" == "placeholder" ]; then echo 'Service is not ready yet. Repository tagged correctly, exiting now'; else  aws ecs update-service --service $SERVICE_NAME --cluster $CLUSTER_ARN --region $region --force-new-deployment; fi
```

### Release stage environment variables created by TinyStacks

TinyStacks defines the following release environment variables to each build. These are immutable and your release cannot override them: 

| Environment variable | Description                                                                                                                               |
|---------------------------|-------------------------------------------------------------------------------------------------------------------------------------------|
| S3_BUCKET                 | The Amazon S3 bucket where logs and build artifacts are stored.                                                                           |
| STAGE_NAME                | The name of the current stage.                                                                                                            |
| ECR_ENDPOINT              | The Amazon ECR repository where your application's Docker container image is stored.                                                      |
| ECR_IMAGE_URL             | The full URL to your container image.                                                                                                     |
| PREVIOUS_STAGE_NAME       | Name of the previous stage in your stack. For the first stage in a stack, this will always be `:latest`.                                  |
| CLUSTER_ARN               | The Amazon Resource Name (ARN) that uniquely identifies the Amazon ECS cluster that TinyStacks creates to run and scale your application. |
| SERVICE_NAME              | The name of the ECS service that runs and scales your container image.                                                                    |
| STAGE_REGION              | The AWS region in which this stage is being launched.                                                                                     |

## When are deployments run? 

Deployments are run whenever you check in a change from Git. TinyStacks will also start a deployment update whenever you add a new build environment variable or runtime environment variable to your stack or one of its stages.

## Managing multiple projects in a single repository ("monorepo") 

For ease of management, many teams prefer to maintain multiple projects in a single repository, creating a so-called "monorepo". For example, a team may decide to construct its application as a set of microservices, with each service stored in a subdirectory within a single Git repo. 

To use TinyStacks with monorepos, create one TinyStacks stack for each service in your monorepo. Next, you will need to add as build environment variable called `DOCKERFILE_PATH` to each stack that points to the relative path to your Dockerfile. Finally, modify your build.yml so that it builds your service using this file path:

```
- docker build -t builtimage . -f $DOCKERFILE_PATH
```

For more information, see [Environment variables](environment-variables.md).