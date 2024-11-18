# azure-infra-bicep-repo

This repository contains Azure Bicep code for deploying resources for AutomationHQ.

## Important Notes

1. The `module-definition.bicep` file serves only as a reference for available modules. It does not directly control which resources are deployed or destroyed. Always modify the appropriate main Bicep files (`deploy.bicep` or `destroy.bicep`) when adding or removing resources.

2. To deploy a container app, you need to add parameters in JSON format to the `parameters/container-app-param` directory. For example, use `parameters/container-app-param/mtaf-influxdb.json`.

## Deployment Instructions

### General Deployment

1. Ensure the resource you want to deploy is defined in `deploy.bicep`.
2. Run the GitHub Action "Deploy Resources" to deploy the resources.

### Deploying Azure Container Registry (ACR)

To deploy an ACR:

1. Run the GitHub Action "Deploy ACR".

### Deploying Container App

To deploy a container app:

1. Create a JSON file with the required parameters in the `parameters/container-app-param` directory.
2. Run the GitHub Action "Deploy Container App".

### Destruction Instructions

To destroy desired resources:

1. Remove the module definition of the resource you want to destroy from `destroy.bicep`.
2. Any resources defined in `destroy.bicep` will not be deployed during destruction.

## Running GitHub Actions

1. Go to the "Actions" tab in your repository.
2. Select the workflow you want to run (e.g., "Deploy Resources", "Deploy ACR", "Deploy Container App").
3. Click "Run workflow".
4. Select the branch you want to run the action on (usually "main").
5. Click "Run workflow" again.
