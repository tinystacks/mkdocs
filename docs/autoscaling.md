TinyStacks runs two instances of your Amazon ECS container by default. However, if your application is under heavy load, these instances may not be enough to handle the demand. 

TinyStacks uses the auto scaling feature of Amazon ECS to ensure your application can still run under heavy demand. Your stack defines several AWS CloudWatch alarms that monitor CPU utilization on the running containers associated with your task definition. If aggregate utilization for all running containers exceeds 75%, another container is launched, up to a maximum of five. 

Note that the scalability of a container is dependent upon good programming practices. Your application code should avoid storing state on disk or in memory on any given container, as you cannot predict which running container instance will service a given request. 

## Changing your cluster scale settings

When you [create a stage](stages.md), you can specify how you want your application to scale. If you need to change these at any time, you can do so through the stage's **Settings** page.

<a href="https://tinystacks.com/stacks/" target="_blank">Go to your Stacks page</a> and, for the stack you want to modify, click the gear icon in the lower right corner. 

By default, TinyStacks will start two Amazon EC2 instances in your ECS cluster. We also define Amazon CloudWatch rules that implement the following behavior: 

* If the aggregate CPU usage of your ECS cluster instances exceeds 75% for more than 15 minutes, AWS will automatically add another EC2 instances to the cluster. 
* If the aggregate CPU usage of your ECS cluster instances is lower than 75% for more than 15 minutes, AWS will automatically remove an EC2 instance from the cluster. 

You may need to change these defaults if your application is either using too many underutilized resources or (more likely) is maxing out on available ECS cluster instances. 

To change scale settings, select **Build and scale** from the navigation menu on the **Settings** page. 

![TinyStacks - change ECS cluster scaling settings](img/tinystacks-change-scale-2.png)

### Change EC2 instance sizing settings 

Here, you can change several settings. The first is your application's **instance sizing**. You can upgrade instance sizing if you are spinning up new ECS cluster instances too quickly. If you are currently using a t3.micro instance size, consider upgrading to an m3.medium or an m3.large.

### Change cluster scale settings

You can also control how many EC2 instances your cluster runs. You can control the following three  settings. 

**Desired capacity**

The number of ECS cluster instances to maintain if no auto scaling rules have been triggered by a CloudWatch alarm. 

The desired capacity should be set to a level that can sustain normal, everyday traffic. If you set it too high, you will spend additional money on ECS cluster instances you aren't using. Conversely, if you set it too high, you may experience service interruptions, as it can take several minutes to initialize a new cluster instance.

**Min Capacity**

The minimum number of cluster instances to run regardless of auto scaling rules. As stated above, scaling up a new cluster instance can take time; setting a minimum number of instances ensures you always have "warm" cluster instances that are stood up and able to accept incoming traffic. 

**Max Capacity**

The maximum number of cluster instances to run regardless of auto scaling rules. This setting provides an upper boundary beyond which your application will not scale, which is  useful for controlling costs or responding to a potential denial of service attack. 

For more information on scaling of EC2 instances, <a href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/asg-capacity-limits.html" target="_blank">see the AWS documentation</a>. 

*Note*: Saving settings changes will trigger a rebuild of your stage. Your application may not be accessible on this stage until the rebuild and redeploy has completed. Changing any of the settings in this section may result in increased AWS service costs. 