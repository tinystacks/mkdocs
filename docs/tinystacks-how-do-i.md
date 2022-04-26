So you've got your first stack up and running. Now, it's time to tailor your stack to meet your team's needs. The following guide addresses the most common use cases for maintaining and expanding your stack. 

## Basic How Do I 




### ...delete a stack? 

To delete a stack, [go to your Stacks page](https://tinystacks.com/stacks/) and, for the stack you want to modify, click the gear icon in the lower right corner. This will land you on the **Stack settings** page. There, you will find a **Delete** button. Click it, and type `delete` in the dialog box when prompted to confirm the operation. 

## Advanced How Do I 

### ...change the exposed port for my application? 

TinyStacks needs to know which port your application is serving HTTP traffic over in order to configure your Amazon ECS tasks properly. If you are using a port besides the standard port 80, you will need to change it in TinyStacks. 

To change your port, [go to your Stacks page](https://tinystacks.com/stacks/). For the stack you want to modify, click the gear icon in the lower right corner. On the **Stack Settings** page, under **Port**, input the number of the port on which your Docker container is exposing its services.

![TinyStacks - change port](img/tinystacks-port-1.png)



### ...pass custom data to the build process? 

Your `build.yml` file controls how your container is built and then stored in Amazon ECR. Sometimes, you may need to pass custom data at build time when building your Docker image. You can accomplish this by defining build variables for your stack. 

To define build variables, [go to your Stacks page](https://tinystacks.com/stacks/). For the stack you want to modify, click the gear icon in the lower right corner. On the **Stack Settings** page, click **Build variables**. Here you can define name-value pairs that you can reference in your `build.yml` file. 

![TinyStacks - build variables](img/tinystacks-build-variables-1.png)

### ...deploy an application that uses a framework not directly supported by TinyStacks? 

While TinyStacks contains sample code for several popular application frameworks, our service is framework-agnostic. So long as your application can be packaged into a Docker container, it can run on TinyStacks!


