module Appservice 'app-service.bicep' = {
  name: 'AppServicePlan'
}

module SqlDataBase 'sql-database.bicep' = {
  name: 'SqlDataBase'
}
