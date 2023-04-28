# Getting started
Follow installation instructions below to get the CLI installed. For a very basic dashboard that contains all the default layout elements, simply run

## Installation
```bash
# Install CLI
npm i -g @tinystacks/opsconsole;

# Make sure you have Docker installed and ports 3000 and 8000 open.
```
### Run sample dashboard 
#### AWS

This package includes other sample dashboard as well. As an example, it includes a sample dashboard that has ECS and AWS account info. To use that, follow these steps:

```
curl https://raw.githubusercontent.com/tinystacks/opsconsole/main/samples/ecs-dashboard-sample.yml -o ecs-dashboard-sample.yml

# Modify line 6 by changing [your AWS profile] to your local AWS profile name
# Modify lines [22-24] by changing the region, ecs clustername, and ecs service names to match resources in your account

opsconsole up -c ecs-dashboard-sample.yml
```
#### Basic
```
opsconsole init;
opsconsole up;
```