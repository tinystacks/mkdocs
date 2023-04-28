# Introduction

Welcome to the TinyStacks documentation. Let's get started in making your own Ops Console.

OpsConsole is an open-source console for cloud operations that delivers a dashboard and workflow engine so developers can organize resources in sensible ways, view key service metadata in one place and automate cloud workflows. With a low-code, widget-based approach, developers can design custom dashboards and workflows and even build their own custom widgets.

With the Ops Console, engineering and DevOps teams can: 

✅ Organize cloud resources with a single pane of glass<br/>
✅ Build deep operational health dashboards<br/>
✅ Share and run operational scripts via the CLI plugin<br/>
✅ Manage cloud sprawl and automate resolution for underutilized resources

The platform comes with default plugins that offer a variety of features such as widgets for AWS ECS services and deployments, IAM JSON Policy viewers, and an AWS CLI, among others. The widgets are interactive and can exchange information, which enables the creation of dynamic and robust dashboards. With a provider and plugin model, developers can customize and extend the Ops Console as much as they wish. The [samples/](https://github.com/tinystacks/opsconsole/tree/main/samples) folder includes several samples of dashboards that can be configured via YAML.

### What problems is the Ops Console intended to serve? 

1. Cloud sprawl is real - modern cloud applications are built with hundreds of cloud services and resources and difficult to manage. 
2. Viewing and organizing cloud resources (to your choice) is difficult especially when debugging or monitoring deployments. 
3. The daily workflows of engineers involve guessing through tens of screens and clicks to find information with no ability to save or build repeatable workflows. 
4. Inability for developers to centralize and evaluate cloud configurations alongside observability tools.

### Why does cloud sprawl matter? 

Our founders spent six years at AWS and witnessed thousands of customer issued, that frankly shouldn't exist. 

1. Unable to find a resource because they were looking at the wrong region. 
2. Debugging a critical issue and facing difficulty reconciling info across observability tools and tens of service consoles. 
3. Navigating through endless screens and clicks just to find out which version of the container image is currently deployed. 
4. Broken glass syndrome of cleaning up resources and driving down costs. 

### What can customers do with the Ops Console?

Developers can connect their cloud accounts and organize resources in sensible ways providing immediate cloud comprehensibility. Developers can then build dashboards with common widgets for deployments, environment variables, logs, alarms and even write their own. Teams can share and run operational scripts via the CLI widget embedded directly in the relavent dashboards. 
