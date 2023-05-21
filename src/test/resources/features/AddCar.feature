@Regression
Feature: Add Car to account

  Background: Setup api and generate token
    * def tokenFeature = callonce read('GenerateToken.feature')
    * def token = tokenFeature.response.token
    Given url "https://tek-insurance-api.azurewebsites.net"

  Scenario: Add Car to an account
    * def generateData = Java.type('api.data.GenerateData')
    * def generateLicense = generateData.getRandomLicense()
    Given path "/api/accounts/add-account-car"
    And header Authorization = "Bearer " + token
    And param primaryPersonId = 7888
    And request
      """
      {
       "make": "Nissan",
       "model": "Murano",
       "year": "2023",
       "licensePlate": "#(generateLicense)"
      }
      """
    When method post
    Then status 201
    And print response
    And assert response.licensePlate == generateLicense