// define the module that u dont wanna destroy and dont define the module that u wanna destroy

param location string = resourceGroup().location
param objectId string

module keyVault './resources/key-vault/key-vault.bicep' = {
  name: 'keyVault'
  params: {
    vaultName: 'keyVault'
    location: location
    userAccessPolicies: [
      {
        objectId: objectId
        tenantId: subscription().tenantId
        permissions: {
          secrets: [
            'all'
          ]
          certificates: [
            'all'
          ]
          keys: [
            'all'
          ]
        }
      }
    ]
  }
}

resource acrResource 'Microsoft.ContainerRegistry/registries@2023-01-01-preview' = {
  name: 'mtafecr'
  location: location
  sku: {
    name: 'Basic'
  }
  properties: {
    adminUserEnabled: true
  }
}
