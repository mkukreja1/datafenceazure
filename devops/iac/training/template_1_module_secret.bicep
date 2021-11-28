
@description('Prefixes of Storage Account')
param p_storageAccountPrefix string = 'dfsecret'

@description('Key Vault Name')
param p_keyVaultName string

@description('Secret Key in Key Vault')
param p_secretName string = 'StorageAccountSecretTag'

resource rContainerSecretMetadata 'Microsoft.KeyVault/vaults@2019-09-01' existing = {
  name: p_keyVaultName
}

module secret_storageaccounts 'template_1_outputs_secret.bicep' =  {
  name: 'template-modules-deployment-${p_storageAccountPrefix}'
  params: {
    p_storageAccountPrefix: p_storageAccountPrefix
    p_secretTag: rContainerSecretMetadata.getSecret(p_secretName)
  }
}
