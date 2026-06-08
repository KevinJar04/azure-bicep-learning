using '../main.bicep'

param storageName = 'emakev123storage'

param vnetName = 'vnet-bicep-test'
param vnetAddressPrefix = '10.10.0.0/16'

param subnets = [
  {
    name: 'subnet-web'
    prefix: '10.10.1.0/24'
  }

  {
    name: 'subnet-app'
    prefix: '10.10.2.0/24'
  }

  {
    name: 'subnet-db'
    prefix: '10.10.3.0/24'
  }
]
