param location string
param vnetName string
param vnetAddressPrefix string
param subnets array

resource vnet 'Microsoft.Network/virtualNetworks@2024-05-01' = {
  name: vnetName
  location: location

  properties: {
    addressSpace: {
      addressPrefixes: [
        vnetAddressPrefix
      ]
    }
  }
}

resource subnet 'Microsoft.Network/virtualNetworks/subnets@2024-05-01' = [for subnetItem in subnets: {
  name: subnetItem.name
  parent: vnet

  properties: {
    addressPrefix: subnetItem.prefix
  }
}]

output vnetId string = vnet.id

output subnetIds array = [
  for i in range(0, length(subnets)): subnet[i].id
]
