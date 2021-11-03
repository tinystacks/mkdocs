### Adding Stages

You can add a new stage to a stack on the TinyStacks Dashboard by clicking the **Add Stage** button.

[TODO: Add screenshot of new UI]

You can specify the following options when creating a new stage: 

**Create Postgres database for stage**

Adds a Postgres database that will be isolated to this stage’s deployment. 

**Require manual approval**

By default, check-ins to the repository and branch configured for a stack will trigger a build that will automatically move through each stage associated with a stack. If you select this box, the stage progression will stop until someone with access to your TinySTacks Dashboard manually approves the progression.

[TODO: Screenshot with new UI]

Manual approval supports scenarios where some degree of manual testing and verification of a stage is required before it is deemed ready to progress.
 
**Create load balancer**

Fronts the Docker container tasks comprising the application with a load balancer to route requests across task instances. For most deployments, this setting should be enabled on production stages.

### Configuring Environment Variables for a Stage

As discussed in the Architecture documentation, an application on TinyStacks is run as one or more task instances of a Docker image on Amazon Elastic Container Services (ECS). You can pass unique information to the task instances in each stage of your deployment by defining environment variables for the stage: 

[TODO: New UI screenshot]

Environment variables can be used to pass stage-specific information, such as a URL to a service discovery endpoint, an S3 bucket location, or debug flags. 

An environment variable defined on a stage will override any existing environment variable value with the same name that was defined by the Docker image’s Dockerfile. 

### Stage Shortcut Links

[TODO]

### Troubleshooting Stages

[TODO]

## Databases

Most applications aren’t very useful without some form of permanent data storage. TinyStacks makes it easy to add a Postgres database to any stack you provision. You can also wire up your application to use your own preferred data storage service, such as Amazon DynamoDB. 

### Creating Postgres Databases

You can add a Postgres database to any stage of a deployment by simply clicking the **Create Postgres database for stage** checkbox at stage creation time. 

[TODO: Screenshot with new UI]

You can also add a Postgres database to your stack at any point in time after creating the stage. Click on **Database** for your stage and, in the Database pop-up window, click Create. 

### Connecting to Your Postgres Database

TinyStacks automatically creates a Postgres user for you named `postgres` and generates a strong password. You can view this password in the TinySTacks Dashboard by clicking on **Database** for your stage and then clicking **View Secret**. You can change this password by clicking on the **Change Password** button.

[TODO: Add screenshot]

The connection information for your Postgres database is passed to your application by setting a series of environment variables on the running tasks for your container: 

* **PG_HOST**: The IP address
* **PG_PORT**: The port on which the Postgres database is running
* **PG_CREDENTIALS_SECRET**: The password for connecting to your Postgres database
* **PG_DATABASE**: The name of the database on the database host server

TinyStacks also creates a secret in AWS Secrets Manager containing the connection information, including its DNS address, port number, username, and password. The secrets for your Postgres database can be identified via the following tags:

* **aws:cloudformation:stack-name**. The value is the name of your stack in TinyStacks. 
* **aws:cloudformation:logical-id**. This variable contains the name of your stage, the word “postgresSecret”, and a unique ID. 

### Migrating Data Between Stages



### Using Other Databases



## Settings

Settings enable you to fine-tune the location of your services and perform additional customizations. You can control various settings for each stage through the TinyStacks Dashboard. 

### Environment Variables

With environment variables, you can pass custom name-value pairs to the running task instances for your Docker containers. This can be useful for passing stage-specific data, or for pointing to the location of other AWS services on which your application depends. 

[TODO: New UI screenshot]

Environment variables are deployed to your stage after you set them in the Dashboard. They are available to you container the name way you would normally access environment variables. For example, you can see the value of an environment variable named CUSTOM_ENV with the command-line command: 

```
Echo $CUSTOM_ENV
```

### Origins

The **Origins** dialog controls [Cross-Origin Resource Sharing (CORS)](https://developer.mozilla.org/en-US/docs/Web/HTTP/CORS) settings for your site. 

By default, HTTP calls from a Web browser (for example, using the XMLHTTPRequest object in JavaScript and the Document Object Model) are restricted to calls from the same origin site. This can create issues, as the front end for a Web site and its microservices are often hosted on separate origins. Use the **Origins** dialog to add origins (domains plus ports) that are authorized to call your Docker application. 

By default, only calls from localhost are allowed. 

### Logs

TinyStacks uses CloudWatch Logs to capture detailed information on the operation of your application on AWS. 

TinyStacks provides two types of logs for each stage: 

* A general log of application events. Any messages written out from the container (e.g., using `console.log()` in Node.js, `print()` in Python, etc.) will appear in this log. 
* The access log, which are the Apache HTTPd access logs for your application.

### Ports