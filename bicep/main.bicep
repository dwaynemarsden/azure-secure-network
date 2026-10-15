@description ('location for resources')
param location string = resourceGroup().location

@description('Vnet Name')
param vnetName string = 'vnet-secure-demo'

@description('Subnet Name')
param subnetName string = 'app-subnet'

@description ('NSG Name')
param nsgName string = 'nsg-secure-demo'

resource nsg 'microsoft.network/networkSecurityGroups@2023-09-01' = {
name: nsgName
location: location
}

resource vnet 'microsoft.network/virtualNetworks@2023-09-01' = {
name: vnetName
location: location

properties: {
   addressSpace: {
      addressPrefixes: [
'10.10.0.0/16'
      ]
}

subnets: [
{
  name: subnetName
 properties: {
addressPrefix: '10.10.1.0/24'
  networkSecurityGroup: 
{
        id: nsg.id

}
 }
}
] 
}

output vnetId string = vnet.id
output subnetName string = subnetName 
