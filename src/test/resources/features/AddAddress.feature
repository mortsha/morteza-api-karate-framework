@Regression
Feature: Add Address to account

  Background: generate token
    * def tokenFeature = callonce read('GenerateToken.feature')
    * def token = tokenFeature.response.token
    Given url "https://tek-insurance-api.azurewebsites.net"

  Scenario: Add address to account
    Given path "/api/accounts/add-account-address"
    And header Authorization = "Bearer " + token
    And param primaryPersonId = 7888
    And request
      """
      {
        "addressType": "Home",
        "addressLine1": "7684 Anthing rd",
        "city": "Toronto",
        "state": "Ontario",
        "postalCode": "876543",
        "countryCode": "",
        "current": true
      }
      """
    When method post
    Then status 201
    And print response
    And assert response.addressLine1 == "7684 Anthing rd"
