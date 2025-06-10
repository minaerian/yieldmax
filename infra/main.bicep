param location string = resourceGroup().location
param environment string = 'dev'

resource appPlan 'Microsoft.Web/serverfarms@2022-09-01' = {
  name: 'yieldmax-${environment}-plan'
  location: location
  sku: {
    name: 'B1'
    tier: 'Basic'
  }
}

resource webApp 'Microsoft.Web/sites@2022-09-01' = {
  name: 'yieldmax-${environment}-app'
  location: location
  serverFarmId: appPlan.id
  siteConfig: {
    linuxFxVersion: 'PYTHON|3.11'
  }
}

output webAppUrl string = webApp.properties.defaultHostName
