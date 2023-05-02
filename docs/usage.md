# Usage

## CLI Commands

##### opsconsole
Shows usage and help information

#### opsconsole init
Creates a sample config file that includes a basic template. If you don't 

#### opsconsole up
Starts the ops console by pulling down the docker images for the ops api (public.ecr.aws/tinystacks/ops-api) and frontend (public.ecr.aws/tinystacks/ops-frontend) and rebuilding them using dependencies included in your yaml file. This may take several minutes depending on your system's available resources. It creates a docker networking bridge called ops-console through which the containers communicate with each other.

#### opsconsole update
Updates the Ops Console CLI to the latest version

#### Additional Options
|Flag|Arguments|Description|
|----|---------|-----------|
|-a, --arch|\<arch\>|  Specifies the architecture. Defaults to 'x86'. Options: 'x86', 'arm'
|-c, --config-file|\<config-file\>|  Specifies a config file. See the `samples` folder in this repo for sample config files. Looks for config.yml in the current working directory by default.
|-V, --verbose||  Displays additional logs.
|-b, --backend-port|\<backend-port\>| Specifies the port to be exposed by the backend service. Defaults to port 8000.
|-f, --frontend-port|\<frontend-port\>| Specifies the port to be exposed by the frontend service. Defaults to port 3000.
|-h, --help||             display help for this command


## Customizing Dashboards
For reference, see one of the samples in the [opsconsole repository](https://github.com/tinystacks/opsconsole/tree/main/samples).

### Using widgets
1. Define the widget in the `widgets` section of YAML
2. Reference the widget in a dashboard
3. Add the widget's source to the `dependencies` section of the YAML in the format `widget name: 'dependency package'`

### Using providers
Providers provide data to widgets. They are backend-only code and can interact with the filesystem, keep data around, and do other more traditionally backend tasks. They are also the best way to provide credentials so that they don't leak through to the client.

1. Define the provider in the `providers` section
2. Reference the provider as a list item in a widget.

See the [AWS ECS sample](https://github.com/tinystacks/opsconsole/blob/main/samples/aws-sample.yml#L4) for reference.

### Sharing data between widgets
Any property in a widget’s YAML can be substituted for either the props or data of another widget. 

|Parameter|Required|Syntax|Example|
|---------|---------|---------|---------|
|Reference|Yes|$ref: [widget path]|$ref: '#/Console/widgets/EcsInfo'
|Path|No|path: [path of data or props of the widget]|path: region
