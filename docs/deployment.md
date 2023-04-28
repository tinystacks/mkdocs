# Deployment

## Local Deployment

To run the Ops Console locally, just use the `opsconsole up` command. Its that simple!
```
opsconsole up -c DASHBOARD_NAME.yaml
```

## Hosted Deployment
Deploy a hosted version of the TinyStacks Ops Console in minutes. 

```
# Routes to signup UI to obtain an auth token
opsconsole signup; 

opsconsole configure
# paste your token here

# deploy your Ops Console to the TinyStacks cloud!
opsconsole deploy -c DASHBOARD-NAME.yaml
```

That's it! Deployments take a few minutes. 

* Please note that when deploying a hosted version of the Ops Console, local AWS profiles in the AWS provider will not work. Instead, an access/secret key pair needs to be used.