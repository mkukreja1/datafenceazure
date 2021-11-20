
@minLength(3)
@maxLength(11)
@description('Name of Storage Account')
param p_storageAccountPrefix string = 'dfstorageac'

@description('Location to deploy resource in')
param p_location string = resourceGroup().location

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

var v_storageAccountPrefixLower = toLower(p_storageAccountPrefix)
var v_StorageAccountUniqueSuffix = uniqueString(resourceGroup().id)
var v_storageAccountName = '${v_storageAccountPrefixLower}${v_StorageAccountUniqueSuffix}'

var v_tags = {
  Name: v_storageAccountName
  Environment: 'Datafence-Training'
  ManagedBy: 'Bicep Template Named - ${v_storageAccountName}'
}

resource rDFStorageAccount 'Microsoft.Storage/storageAccounts@2021-06-01' = {
  name: v_storageAccountName
  location: p_location
  tags: v_tags
  sku: {
    name: p_skuType
  }
  kind: p_storageAccountType
  properties: {
    supportsHttpsTrafficOnly: p_httpsTrafficSupport
  }
}
