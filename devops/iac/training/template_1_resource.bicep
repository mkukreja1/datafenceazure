resource rDFStorageAccount 'Microsoft.Storage/storageAccounts@2021-06-01' = {
  name: 'dfstoragesyed'
  location: 'EAST US'
  tags: {
    Name: 'dfstorageaccount12345678'
    Environment: 'Datafence-Training'
  }
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
  properties: {
    supportsHttpsTrafficOnly: true
  }
}
