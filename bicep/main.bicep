targetScope = 'subscription'

// If an environment is set up (dev, test, prod...), it is used in the application name
param environment string = 'dev'
param applicationName string = 'demo-4944-3166'
param location string = 'eastus'
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

output application_name string = webApp.outputs.application_name
output application_url string = webApp.outputs.application_url
output resource_group string = rg.name
output container_registry_name string = webApp.outputs.container_registry_name
