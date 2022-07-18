TinyStacks can be used as a standalone solution. It can also be integrated with other DevOps tools. Read on for guidance on how to integrate other DevOps tools with your TinyStacks stacks. 

### Integrating with your existing CI/CD provider

By default, TinyStacks automates building and releasing of your application code. Builds are handled via a build.yml file that is used by AWS CodeBuild. Our standard build script is fairly straightforward: it runs a Docker build on your code base and tags the resulting image in an Amazon Elastic Container Repository (ECR) repo in your AWS account. (For an example, [see the build.yml file](https://github.com/tinystacks/aws-docker-templates-express/blob/main/build.yml) in our Express sample deployment template.)

For more complex build needs, you can leverage CI/CD solutions outside of TinyStacks. For example, you may need to construct your own base Docker image that includes components from other teams or partners. In this case, you can run your existing CI/CD pipeline and, at the end, merge the output into a branch monitored by TinyStacks. that you asked TinyStacks to monitor. Once this check-in completes, TinyStacks will kick off its build and release process as with any other check-in.

### Integrating New Relic for application monitoring

There are two basic kinds of monitoring with containerized applications: 

* **Instance monitoring**: monitors the status and health your running cluster container instances
* **Application monitoring**: monitors runtime performance and reports application anomalies (errors, intrusion attempts, etc.)

You can leverage tools like <a href="https://newrelic.com/" target="_blank">New Relic</a> to perform application monitoring of your TinyStacks application. [While most instance monitoring is handled by default by TinyStacks](logging-monitoring.md), you can also roll our instance monitoring metrics into New Relic so that you can see both instance and application monitoring statistics in a single pane of glass. 

#### Prerequisites

To use New Relic or a similar third party monitoring service for either instance or application monitoring, you'll need to launch a TinyStacks stack with a NAT instance enabled. This is necessary to enable your application to connect to the public Internet and the New Relic service. For detailed instructions on using a NAT instance, see [Create Your First Stack](create-stack.md).

#### Setting up New Relic

If you haven't used New Relic before, you can try it out by signing up for a free account. Once signed up, from the top right user menu, select **API Keys**, and then click **Create Key**. Keep the key in an open text editing window for later use. 

#### Gathering instance monitoring data

To enable instance monitoring data, you'll need to find the name of your ECS cluster. Log into the <a href="https://console.aws.amazon.com/" target="_blank">AWS Management Console</a> and navigate to **Elastic Container Service**. Your cluster name will begin with the name of your TinyStacks stack. Copy the full name to a text editing window. 

Next, <a href="https://us-east-1.console.aws.amazon.com/cloudformation/home?region=us-east-1#/stacks/quickcreate?templateURL=https://nr-downloads-main.s3.amazonaws.com/infrastructure_agent/integrations/ecs/cloudformation/service.yaml&NewRelicInfraTaskVersion=1" target="_blank">launch this AWS CloudFormation stack supplied by New Relic</a>. You will need to supply both your cluster name and your New Relic API key that you created earlier as parameters. If you're unfamiliar with launching a CloudFormation stack, <a href="https://docs.newrelic.com/docs/infrastructure/elastic-container-service-integration/installation/install-ecs-integration/" target="_blank">see the detailed instructions on New Relic's Web site</a>.

Once this stack finishes launching, you should see your cluster instance data appear in New Relic. 

#### Gathering application monitoring data

To enable New Relic application monitoring, you will need to set up your application on New Relic's site and set up your container to use New Relic. This procedure will differ depending on your language and dev framework. For detailed instructions, look up your framework and language <a href="https://docs.newrelic.com/docs/apm/new-relic-apm/getting-started/introduction-apm/" target="_blank">in New Relic's APM Agents documentation</a>. 

Once that's done, update each stage using your container on TinyStacks to include the following environment variables: 

* `NEW_RELIC_LICENSE_KEY`: Your API key that you created earlier.
* `NEW_RELIC_APP_NAME`: The name of your application as it will appear in the New Relic dashboard.
* `NEW_RELIC_NO_CONFIG_FILE`: Set this value to `true`. 

For detailed instructions on setting environment variables for your application, see [Environment Variables](environment-variables.md).

