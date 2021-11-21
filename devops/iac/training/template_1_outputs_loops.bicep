@description('Prefixes of Storage Account')
param p_storageAccountPrefixes array = [
  'DFABC'
  'DFXYZ'
  'DFIJK'
]

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

var v_storageAccountPrefixesLower = [for element in p_storageAccountPrefixes : toLower(element)]

var v_storageAccountUniqueSuffix = uniqueString(resourceGroup().id)

var v_storageAccountNames = [for element in v_storageAccountPrefixesLower : '${element}${v_storageAccountUniqueSuffix}' ]
 
resource rDFStorageAccounts 'Microsoft.Storage/storageAccounts@2021-06-01' = [ for storageAccountName in v_storageAccountNames : {
  name: storageAccountName
  location: p_location
  tags: {
    Name: storageAccountName
    Environment: 'Datafence-Training'
    ManagedBy: 'Bicep Template Named - ${storageAccountName}'
  }
  sku: {
    name: p_skuType
  }
  kind: p_storageAccountType
  properties: {
    supportsHttpsTrafficOnly: p_httpsTrafficSupport
  }
}]


output storageAccountsDetails array = [for i in range(0, length(p_storageAccountPrefixes)) : {
  storageAccountEndpoint: rDFStorageAccounts[i].properties.primaryEndpoints.blob
  storageAccountId:  rDFStorageAccounts[i].id
}]
