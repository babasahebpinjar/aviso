param location string

module strorageModule '../../resources/blob-storage/blob-storage.bicep' = {
  name: 'strorageModule'
  params: {
    uniqueStorageName: 'fileuploadsautomationhq'
    storageSKU: 'Standard_LRS'
    location: location
  }
}
