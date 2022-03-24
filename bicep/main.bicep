targetScope = 'subscription'

// If an environment is set up (dev, test, prod...), it is used in the application name
param environment string = 'dev'
param applicationName string = 'demo-3856-9057'
param location string = 'westeurope'
var instanceNumber = '001'

var defaultTags = {
  'environment': environment
  'application': applicationName
  'nubesgen-version': '0.10.1-SNAPSHOT'
}

resource rg 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: 'rg-${applicationName}-${instanceNumber}'
  location: location
  tags: defaultTags
}




var applicationEnvironmentVariables = [
// You can add your custom environment variables here      
]


module webApp 'modules/app-service/app-service.bicep' = {
  name: 'webApp'
  scope: resourceGroup(rg.name)
  params: {
    location: location
    applicationName: applicationName
    environment: environment
    resourceTags: defaultTags
    instanceNumber: instanceNumber
    environmentVariables: applicationEnvironmentVariables
  }
}

