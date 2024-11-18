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

// @secure()
// param secretName string

// @secure()
// param secretValue string

// resource secret 'Microsoft.KeyVault/vaults/secrets@2021-06-01-preview' = {
//   name: secretName
//   parent: keyVault
//   properties: {
//     value: acrResource.listCredentials(Username)
//   }
// }
