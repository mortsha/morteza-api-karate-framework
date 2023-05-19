Feature: Get All Account

  Background: Setup Request URL
    Given url "https://tek-insurance-api.azurewebsites.net"

  Scenario: Get All Account
    And path "/api/token"
    And request {"username": "supervisor","password": "tek_supervisor"}
    When method post
    Then status 200
    And print response
    Given path "/api/accounts/get-all-accounts"
    And header authorization = "Bearer " + response.token
    When method get
    Then status 200
    And print response
