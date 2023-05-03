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

# Ensure you have set an access and secret key for AWS credentials
# deploy your Ops Console to the TinyStacks cloud!
opsconsole deploy -c DASHBOARD-NAME.yaml
```

That's it! Deployments take a few minutes. 

:warning: When deploying a hosted version of the Ops Console, an access/secret key pair must be used. Local credentials are not saved by the Ops Console and will not work in a hosted version of Ops Console. 