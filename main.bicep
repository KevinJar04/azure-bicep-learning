param location string = resourceGroup().location
param storageName string

param vnetName string
param vnetAddressPrefix string
param subnetName string
param subnetAddressPrefix string

resource storage 'Microsoft.Storage/storageAccounts@2023-05-01' = {
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
    subnetName: subnetName
    subnetAddressPrefix: subnetAddressPrefix
  }
}

output vnetId string = network.outputs.vnetId
output subnetId string = network.outputs.subnetId
