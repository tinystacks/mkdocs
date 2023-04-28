# Concepts

|Name|Description|
|---------|---------|
|Console|A console is a top level construct. It includes a name to identify itself, as well as dashboards, widgets, providers and dependencies. 
|Dashboard|A dashboard is a page that consists of an id, a route and list of widget references. 
|Widget|Widgets are components that have two functions: render and getData. getData is called in the API’s server and is used to make external requests, do computations, etc. Once it is called, it sets some data on the widget itself that’s passed back to the frontend, where render is called to display the widget.
|Providers|Providers are the beating hearts of the Console. They can be long running and run in the background. They may be passed to widgets to provide sensitive information or long-lived information, whereas widgets are better written as quick request/response styled objects. 

### Providers
Currently supports AWS with plans to add others! AWS provider can be configured with local profiles or Access/Secret keys.  
#### AWS
```
providers:
  AwsLocalProvider:
    id: AwsLocalProvider
    type: AwsCredentialsProvider
    credentials:
      # Option A: local credentials
      profileName: default 
      # Option B: Access/Secret keys (required when deploying with opsconsole deploy)
      # AwsAccessKeyId:
      # AwsSecretAccessKey: 
```

### [Core widgets](https://github.com/tinystacks/ops-core-widgets)
|Name|Description|
|---------|---------|
|[Panel](https://github.com/tinystacks/ops-core-widgets#panel)|This widget renders multiple internal widgets in a single direction, either vertical or horizontal.
|[Tabs](https://github.com/tinystacks/ops-core-widgets#tabs)|This widget renders multiple internal widgets in a tab view. Combine with panel or grid to make robust views.
|[Grid](https://github.com/tinystacks/ops-core-widgets#grid)|This widget renders multiple internal widgets in a grid.
|[Markdown](https://github.com/tinystacks/ops-core-widgets#markdown)|This widget renders markdown.
|[CLI](https://github.com/tinystacks/ops-core-widgets#cli)|This widget runs a bash command. The command may be multiple commands separated by ';'. You can also reference scripts that exist in the same directory as your config.

### [AWS widgets](https://github.com/tinystacks/ops-aws-core-plugins)
|Name|Description|
|---------|---------|
|[CloudWatch Logs](https://github.com/tinystacks/ops-aws-core-plugins#cloudwatch-logs)|Renders a widget containing logs from a CloudWatchLogs log group or log stream.
|[CloudWatch Graph](https://github.com/tinystacks/ops-aws-core-widgets#cloudwatch-metric-graph)|Renders a widget containing graphs populated by one or many CloudWatch metrics.
|[ECS Info](https://github.com/tinystacks/ops-aws-core-widgets#ecs-info)|Renders a widget containing information about an ECS Service.
|[ECS Deployments](https://github.com/tinystacks/ops-aws-core-widgets#ecs-deployments)|Renders a widget containing information about an ECS Service's current deployments.

