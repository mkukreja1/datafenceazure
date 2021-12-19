param p_storageAccountName string = 'dfstoragesyed'
param p_location string = 'EAST US'
param p_tags object = {
  Name: 'dfstoragesyed'
  Environment: 'Datafence-Training'
  ManagedBy: 'Bicep Template - Parameterized'
}
param p_skuType string = 'Standard_LRS'
param p_storageAccountType string = 'StorageV2'
param p_httpsTrafficSupport bool = true

resource rDFStorageAccount 'Microsoft.Storage/storageAccounts@2021-06-01' = {
  name: p_storageAccountName
  location: p_location
  tags: p_tags
  sku: {
    name: p_skuType
  }
  kind: p_storageAccountType
  properties: {
    supportsHttpsTrafficOnly: p_httpsTrafficSupport
  }
}
