@Regression
Feature: Verify Accounts

  Background: Setup Request URL
    Given url "https://tek-insurance-api.azurewebsites.net"

  Scenario: Retrieve an Account with valid token and valid id
    And path "/api/token"
    And request {"username": "supervisor","password": "tek_supervisor"}
    When method post
    Then status 200
    And print response
    Given path "/api/accounts/get-account"
    And header authorization = "Bearer " + response.token
    And param primaryPersonId = "6867"
    When method get
    Then status 200
    And print response
    And assert response.primaryPerson.id == 6867
    And assert response.primaryPerson.email == "sharifi12332@gmail.com"

  Scenario: Retrieve All Accounts with valid token
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
    And assert response.email == "JustaMurphy@gmail.com"
