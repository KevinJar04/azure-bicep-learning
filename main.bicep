param location string = resourceGroup().location
param storageName string

param vnetName string
param vnetAddressPrefix string
param subnets array
param deployStorage bool = true

resource storage 'Microsoft.Storage/storageAccounts@2023-05-01' = if (deployStorage) {
  name: storageName
  location: location

  sku: {
    name: 'Standard_LRS'
  }

  kind: 'StorageV2'

  properties: {
    accessTier: 'Hot'
  }
}

module network './modules/network.bicep' = {
  name: 'networkDeployment'
  params: {
    location: location
    vnetName: vnetName
    vnetAddressPrefix: vnetAddressPrefix
    subnets: subnets
  }
}

output vnetId string = network.outputs.vnetId
output subnetIds array = network.outputs.subnetIds
