# Installation and Deploying

## Pre-requisites
To use the default installation, you need to have [docker installed](https://docs.docker.com/get-docker/).

**Windows users** must have Docker Desktop running.

You system user also needs read/write access to the directory that contains your config file; typically this is also the directory where you are running the opsconsole.

Also please make sure that ports 8000 and 3000 are open, as those ports are used by the [API](https://github.com/tinystacks/ops-api) and [frontend](https://github.com/tinystacks/ops-frontend). If these ports are reserved, you can specify different ports using the `--backend-port` and `--frontend-port` flags on the `opsconsole up` command.

## Install from the Global NPM registry
```bash
# Install from the public npm registry
npm i -g @tinystacks/opsconsole;

# Use the CLI, refer to the usage guide below
opsconsole -v;

```

## Local Installation
```bash
# Clone this package
git clone https://github.com/tinystacks/opsconsole.git;

# Install dependencies and build
npm i; npm run build;

# Install the CLI globally
# Using the -g option installs the ops cli to your shell scope instead of the package scope. 
#  It adds the CLI command to bin, allowing you to call opsconsole from anywhere
npm i -g;

# Use the CLI, refer to the usage guide below
opsconsole -v;
```
