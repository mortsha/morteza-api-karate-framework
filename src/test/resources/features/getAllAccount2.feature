@Regression
Feature: Get all accounts

  Background: Generate token
    * def tokenFeature = callonce read('GenerateToken.feature')
    * def token = tokenFeature.response.token
    Given url "https://tek-insurance-api.azurewebsites.net"

  Scenario: Get all accounts
    Given path "/api/accounts/get-all-accounts"
    And header Authorization = "Bearer " + token
    When method get
    Then status 200
    And print response
