@Regression
Feature: Update the car

  Background: Generate token
    * def tokenFeature = callonce read('GenerateToken.feature')
    * def token = tokenFeature.response.token
    Given url "https://tek-insurance-api.azurewebsites.net"

  Scenario: Update the car of an account
    * def GenerateData = Java.type('api.data.GenerateData')
    * def autoLicense = GenerateData.getRandomLicense()
    Given path "/api/accounts/update-account-car"
    And header Authorization = "Bearer " + token
    And param primaryPersonId = 7888
    And request
      """
      {
        "make": "Honda",
        "model": "Civic",
        "year": "2023",
        "licensePlate": "#(autoLicense)"
      }
      """
    When method put
    Then status 200
    And print response
    And assert response.licensePlate == autoLicense
