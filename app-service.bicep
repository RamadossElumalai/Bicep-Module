param location string = resourceGroup().location

// creating app service plan
resource appServicePlan 'Microsoft.Web/serverfarms@2020-12-01' = {
  name: ''  //Name 
  location: location
  sku: {
    name: 'S1' //Pricing tier
    capacity: 1 //Number of instance,
  }
}

// creating app service
resource appService 'Microsoft.Web/sites@2021-03-01' = {
  name: '' //name
  location: location
  properties:{
    //Important we should give your app service plan name
    serverFarmId: resourceId('Microsoft.Web/serverfarms', '')
  }
  dependsOn:[
    //if your creating your app service plan with this file 
    //then you have to mention your app service plan name
    appServicePlan
  ]
  
}



// creating application setting for the app service and linking application insights
resource appServiceAppSettings 'Microsoft.Web/sites/config@2021-03-01' = {
  name: 'web'
  kind: 'string'
  parent: appService
  properties: {
    appSettings: [
      {
        name: 'APPINSIGHTS_INSTRUMENTATION_KEY'
        value: appInsights.properties.InstrumentationKey
      }
    ]
  }
}

//creating application insights with out linking it
resource appInsights 'Microsoft.Insights/components@2020-02-02' = {
  name: '' //name
  location: location
  kind: 'web'
  properties:{
    Application_Type: 'web'
  }
}
