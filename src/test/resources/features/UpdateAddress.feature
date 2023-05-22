@Regression
Feature: Update the address

  Background: generate token
    * def tokenFeature = callonce read('GenerateToken.feature')
    * def token = tokenFeature.response.token
    Given url "https://tek-insurance-api.azurewebsites.net"

  Scenario: Update the address with valid Id
    Given path "/api/accounts/update-account-address"
    And header Authorization = "Bearer " + token
    And param primaryPersonId = 7888
    And request
      """
      {
        "addressType": "Appartment",
        "addressLine1": "8787 havij",
        "city": "Kharej",
        "state": "Keshvar",
        "postalCode": "678956",
        "countryCode": "",
        "current": true
      }
      """
    When method put
    Then status 202
    And print response
    And assert response.addressLine1 == "8787 havij"
