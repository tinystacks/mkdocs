# Usage

## CLI Commands
#### opsconsole
Shows usage and help information

#### opsconsole init
Creates a sample template file for a basic, layout only Ops Console.

#### opsconsole up
Starts the ops console by pulling down the docker images for the ops api (public.ecr.aws/tinystacks/ops-api) and frontend (public.ecr.aws/tinystacks/ops-frontend) and rebuilding them using dependencies included in your yaml file. This may take several minutes depending on your system's available resources. It creates a docker networking bridge called ops-console through which the containers communicate with each other.
Specify the ops console you want to use with the -c flag. 

#### opsconsole deploy
Deploys ops console on a TinyStacks hosted solution. Requires a free account and an API key.
Specify the ops console you want to use with the -c flag. 

#### opsconsole configure
Prompts for configuration information including an API token that will be used for deploying your console as a hosted solution. Not necessary for running locally via the "up" command.

#### opsconsole signup
Open signup portal to creating/managing account and API tokens. Not necessary for running locally via the "up" command.

#### opsconsole list
List the details of your existing hosted consoles. Requires an account and an API key.

#### opsconsole update
Updates the Ops Console CLI to the latest version

#### Options
|Flag|Arguments|Description|
|----|---------|-----------|
|-a, --arch|\<arch\>|  Specifies the architecture. Defaults to 'x86'. Options: 'x86', 'arm'
|-c, --config-file|\<config-file\>|  Specifies a config file. See the `samples` folder in this repo for sample config files. Looks for config.yml in the current working directory by default.
|-V, --verbose||  Displays additional logs.
|-b, --backend-port|\<backend-port\>| Specifies the port to be exposed by the backend service. Defaults to port 8000.
|-f, --frontend-port|\<frontend-port\>| Specifies the port to be exposed by the frontend service. Defaults to port 3000.
|-h, --help|| display help for this command
