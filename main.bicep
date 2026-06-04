param location string = resourceGroup().location

module network './modules/network.bicep' = {
  name: 'networkDeployment'
  params: {
    location: location
    vnetName: 'vnet-bicep-test'
    vnetAddressPrefix: '10.10.0.0/16'
    subnetName: 'subnet-default'
    subnetAddressPrefix: '10.10.1.0/24'
  }
}

output vnetId string = network.outputs.vnetId
output subnetId string = network.outputs.subnetId
