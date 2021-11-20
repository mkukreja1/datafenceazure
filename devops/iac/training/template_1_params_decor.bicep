
@minLength(3)
@maxLength(24)
@description('Name of Storage Account')
param p_storageAccountName string = 'dfstorageaccount12345678'

@description('Location to deploy resource in')
param p_location string

@description('Tags to associate with resources')
param p_tags object = {
  Name: p_storageAccountName
  Environment: 'Datafence-Training'
  ManagedBy: 'Bicep Template Named - ${p_storageAccountName}'
}

@allowed([
  'Standard_LRS'
  'Standard_GRS'
  'Standard_ZRS'
  'Premium_LRS'
])
@description('Sku Type')
param p_skuType string = 'Standard_LRS'

@allowed([
  'BlobStorage'
  'BlockBlobStorage'
  'FileStorage'
  'Storage'
  'StorageV2'
])
@description('Storage Account Type')
param p_storageAccountType string = 'StorageV2'

@description('Allows https traffic only to storage service if sets to true')
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
