# Introduction

It’s not easy shipping software to the cloud. A team aiming to deploy its application backends to a cloud provider such as Amazon Web Services needs to understand a dozen or more AWS features just to stand up a small project. And as the scale and size of your project grows, so does the complexity of its deployment. Many companies soon find themselves spending more time making their cloud applications secure and scalable than they do writing its core functionality. 

TinyStacks takes the drudgery out of deployment. Using TinyStacks, development teams can: 

* Create a multi-stage (dev/test/stage/prod) CI/CD pipeline. TinyStacks deploys directly to your own AWS account, making it easy to deploy onto the cloud quickly while also providing transparency and flexibility. 
* Use your favorite languages and frameworks 
* Deploy applications to production to the cloud with minimal overhead
* Scale applications and APIs from hundreds of users to millions with little additional effort

By deploying with TinyStacks, your team can spend less time building out DevOps architecture and more time building out the core features that make your application unique! 

## What TinyStacks Does

Below are some of the benefits that applications gain by deploying with TinyStacks. 

**Use Your Favorite Languages and Frameworks.** TinyStacks is language- and framework-agnostic. Our deployment processes will work with any application deployed via a Docker container. If your application currently isn’t Dockerized, we have pre-built template files for the Node.js, Django, Express, and Flask frameworks to get you started. 

**Full-Stack Architecture.** TinyStacks creates everything your application requires to run on the cloud. It can even provision a Postgres database for data storage. 

**Multi-Stage Deployments.** TinyStacks supports defining as many development stages as you need. By default, we create a dev stage for development purposes. Using the TinyStacks dashboard, you can easily add a production stage and any intermediate stages - such as testing and staging - to your deployment process. 

**Continuous Integration and Continuous Deployment.** A TinyStacks stack is wired to a repository you own in GitHub or GitLab. By default, any changes you make to a stack’s corresponding branch will be automatically compiled and updated in the currently running environment. You can also define manual approvals for any stage. 

**Security by Default.** TinyStacks incorporates the latest security best practices for cloud-based applications.

**Cost Efficiency.** Controlling costs on the cloud is difficult. Finding the best price point for your application can require hundreds of hours of testing and experimentation. TinyStacks constantly monitor, test, and change the way we deploy stacks for our customers to get the best performance at the lowest price. (Read about [a major change we made to our deployments that saved up to 40% on stack costs](https://blog.tinystacks.com/ecs-serverless-or-not-fargate-vs-ec2-clusters) for our customers.) 

## What TinyStacks Doesn’t Do 

While TinyStacks conveys many benefits to development teams, it can’t do *everything*. The following areas remain your responsibility: 

**Hosting.** TinyStacks is a DevOps orchestration framework, not a cloud hosting provider. All provisioned cloud capacity is run in your own cloud provider’s accounts and you are directly responsible for all costs incurred. 

**End to End Security.** TinyStacks cannot make an insecure application secure. While Tinystacks takes multiple measures to ensure your infrastructure is secure by default, it does not *guarantee* the security of your application. It is up to you and your team to design and implement applications that adhere to the tenets of good security, such as defensive programming and the principle of least privilege. 
