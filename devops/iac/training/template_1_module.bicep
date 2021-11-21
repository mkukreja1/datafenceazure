
@description('Prefixes of Storage Account')
param p_storageAccountPrefixes array = [
  'DFMOD1'
  'DFMOD2'
  'DFMOD3'
]


module iterative_storageaccounts 'template_1_outputs.bicep' = [ for storageAccountPrefix in p_storageAccountPrefixes : {
  name: 'template-modules-deployment-${storageAccountPrefix}'
  params: {
    p_storageAccountPrefix: storageAccountPrefix
  }
}]
