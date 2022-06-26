param location string = resourceGroup().location

// Sql server
resource sqlServer 'Microsoft.Sql/servers@2014-04-01' ={
  name: ''//name
  location: location
  properties: {
    administratorLogin: ''
    administratorLoginPassword: ''
  }
}

// whitelisting the ip address or allowing ip address to access
resource sqlServerFirewallRules 'Microsoft.Sql/servers/firewallRules@2020-11-01-preview' = {
  parent: sqlServer
  name: 'name'
  properties: {
    startIpAddress: ''
    endIpAddress: ''
  }
}

// Sql Server Database
resource sqlServerDatabase 'Microsoft.Sql/servers/databases@2014-04-01' = {
  parent: sqlServer
  name: ''
  location: location
  properties: {
    collation: 'SQL_Latin1_General_CP1_CI_AS'
    edition: 'Basic'
    maxSizeBytes: '2147483648'
    requestedServiceObjectiveName: 'Basic'
  }
}
