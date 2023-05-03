# Dashboards

|Name|Description|
|---------|---------|
|Console|A console is a top level construct. It includes a name to identify itself, as well as dashboards, widgets, providers and dependencies. 
|Dashboard|A dashboard is a page that consists of an id, a route, and list of widget references. 
|Widget|Widgets are components that have two functions: render and getData. getData is called in the API’s server and is used to make external requests, do computations, etc. Once it is called, it sets some data on the widget itself that’s passed back to the frontend, where render is called to display the widget.
|Provider|Providers are data sources for widgets. They are only executed server side and can be used to offload complex logic from a widget's `getData` function.  Providers can also be used across multiple widgets and are therefore better suited for any processes that involve caching, credentials management, or fetching data required by multiple widgets. Provider definitions are also currently read-only from the perspective of the API, so any additional data attached to a provider during runtime will not leak back into the yaml on save whereas a widget requires explicit filtering of class properties via its `toJson` function to prevent properties from being persisted to the yaml. 
|Constant|Constants are static values that can be shared across dashboards.|
|Parameter|Parameters are dynamic values at the dashboard level that can be override with URL parameters.|

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

#### Enabling Providers in CLI 
To enable Provider usage in the CLI widget, the Provider must implement [CliEnvironmentProvider](https://github.com/tinystacks/ops-core-widgets/blob/main/src/cli-environment-provider.ts).

### Core widgets [:material-github:](https://github.com/tinystacks/ops-core-widgets)
|Name|Description|
|---------|---------|
|[Panel](https://github.com/tinystacks/ops-core-widgets#panel)|This widget renders multiple internal widgets in a single direction, either vertical or horizontal.
|[Tabs](https://github.com/tinystacks/ops-core-widgets#tabs)|This widget renders multiple internal widgets in a tab view. Combine with panel or grid to make robust views.
|[Grid](https://github.com/tinystacks/ops-core-widgets#grid)|This widget renders multiple internal widgets in a grid.
|[Markdown](https://github.com/tinystacks/ops-core-widgets#markdown)|This widget renders markdown.
|[CLI](https://github.com/tinystacks/ops-core-widgets#cli)|This widget runs a bash command. The command may be multiple commands separated by ';'. You can also reference scripts that exist in the same directory as your config. (currently, only supported locally)

### AWS widgets [:material-github:](https://github.com/tinystacks/ops-aws-core-plugins)
|Name|Description|
|---------|---------|
|[CloudWatch Logs](https://github.com/tinystacks/ops-aws-core-plugins#cloudwatch-logs)|Renders a widget containing logs from a CloudWatchLogs log group or log stream.
|[CloudWatch Graph](https://github.com/tinystacks/ops-aws-core-widgets#cloudwatch-metric-graph)|Renders a widget containing graphs populated by one or many CloudWatch metrics.
|[ECS Info](https://github.com/tinystacks/ops-aws-core-widgets#ecs-info)|Renders a widget containing information about an ECS Service.
|[ECS Deployments](https://github.com/tinystacks/ops-aws-core-widgets#ecs-deployments)|Renders a widget containing information about an ECS Service's current deployments.

### Constants
Constants are defined at the console level and can be shared across dashboards. To reference a constant, use the name of the constant prefixed with `$const.`. ex. `$const.const1`.

Example for defining constants:
```
Console:
  name: console
  constants:
    const1:
      type: string
      value: 'text'
    const2: 
      value: true
      type: boolean
    const3:
      value: 123456
      type: number
    const4:
      value: '2022-04-27'
      type: date
```

### Parameters
Parameters are dynamic values at the dashboard level that can be override with URL parameters. To reference a parameter, use the name of the parameter prefixed with `$param.` ex. `$param.text`.

Example for defining parameters:
```
dashboards:
    LayoutDashboard:
      parameters:
        - name: text
          default: test 123
        - name: num
          type: number
          default: 42
        - name: bool
          type: boolean
        - name: date
          type: date
```

### Customizing Dashboards
For reference, see one of the samples in the [opsconsole repository](https://github.com/tinystacks/opsconsole/tree/main/samples).

#### Using widgets
1. Define the widget in the `widgets` section of YAML
2. Reference the widget in a dashboard
3. Add the widget's source to the `dependencies` section of the YAML in the format `widget name: 'dependency package'`

#### Using providers
Providers provide data to widgets. They are backend-only code and can interact with the filesystem, keep data around, and do other more traditionally backend tasks. They are also the best way to provide credentials so that they don't leak through to the client.

1. Define the provider in the `providers` section
2. Reference the provider as a list item in a widget.

See the [AWS sample](https://github.com/tinystacks/opsconsole/blob/main/samples/aws-sample.yml#L4) for reference.

#### Sharing data between widgets
Any property in a widget’s YAML can be substituted for either the props or data of another widget. 

|Parameter|Required|Syntax|Example|
|---------|---------|---------|---------|
|Reference|Yes|$ref: [widget path]|$ref: '#/Console/widgets/EcsInfo'
|Path|No|path: [path of data or props of the widget]|path: region
