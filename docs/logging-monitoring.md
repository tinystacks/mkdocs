TinyStacks maintains separate logs for each stage of your application's stack.

TinyStacks maintains three logs viewable directly in the TinyStacks dashboard for your stack. 

### Build Log

The Build Log displays all output from your Docker container's build. If your container fails to build, you can find the error here and diagnose any issues.

## Runtime Logs

Your Runtime Logs show any output from your running containers. Any application output written to standard output (e.g., `console.log()` in Node.js) from within your container will appear in this log. 

## Access Logs

Access Logs show who has been visiting your application. The format of the access logs will differ based on which endpoint technology you are using. An application that utilizes Amazon API Gateway will receive logs <a href="https://docs.aws.amazon.com/apigateway/latest/developerguide/set-up-logging.html" target="_blank">in API Gateway JSON format</a>:

```
04/21/2022 18:27:42: { "requestId":"Q8NnAiztIAMEV4w=", "ip": "73.239.102.103", "requestTime":"21/Apr/2022:17:09:26 +0000", "httpMethod":"GET","routeKey":"$default", "status":"200","protocol":"HTTP/1.1", "responseLength":"12", "resourcePath":"-" }
```

An application utilizing Application Load Balancer will receive logs in standard Apache Common Log Format: 

```

```

## Accessing log data outside of TinyStacks

Log data is stored in Amazon CloudWatch in your AWS account in various log groups. 

Your runtime logs as well as access logs are stored in log groups identified by tags. The tag takes the format: &lt;*stack-name*&gt;-&lt;*stack-name-and-stage*&gt;-&lt;*aws-account-number*&gt;-&lt;*stack-aws-region*&gt;

So, for example, assume your AWS account ID is *111111111111*. If you have a stack named *my-app* with a stage named *dev* in the us-east-1 region, your stack's tag would be: *my-app-my-app-dev-111111111111-us-east-1*. 

Using this, you can find CloudWatch Logs groups (and other TinyStacks-deployed assets) in your AWS accounts using tools such as the <a href="https://aws.amazon.com/cli/" target="_blank">AWS Command Line Interface (CLI)</a>. You can use these same tools to retrieve and export data from these logs and send them to your destination of choice.

## Monitoring Dashboard

TinyStacks also supplies a monitoring dashboard as part of your stack's deployment. You can monitor multiple runtime metrics for your application, including request rate, latency, CPU utilization of your underlying ECS cluster instances, 400/500 errors, and more. 

## Data retention policies

For information on data retention policies for TinyStacks-related data and services, see [Data retention](data-retention.md).