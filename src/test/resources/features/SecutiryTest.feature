@Smoke @Regression
Feature: API Test Security Section

  Background: Setup Request URL
    Given url "https://tek-insurance-api.azurewebsites.net"
    And path "/api/token"

  Scenario: Create token with valid username and password
    #prepare request
    And request {"username": "supervisor","password": "tek_supervisor"}
    #send request
    When method post
    #Validation response
    Then status 200
    And print response

  Scenario: Create token with Invalid username and password
    And request {"username": "super","password": "tek_supervisor"}
    When method post
    Then status 400
    And print response
    And assert response.errorMessage == "User not found"

  Scenario: Validate token with Invalid Password
    And request {"username": "supervisor","password": "sur"}
    When method post
    Then status 400
    And print response
    And assert response.errorCode == "WRONG_PASSWORD"
    And assert response.httpStatus == "BAD_REQUEST"
    And assert response.errorMessage == "Password Not Matched"
