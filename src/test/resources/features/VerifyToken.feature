Feature: Verify Token

  Scenario: Generate Token and Verify it - Positive Testing
    Given url "https://tek-insurance-api.azurewebsites.net"
    And path "/api/token"
    And request {"username" : "supervisor" , "password" : "tek_supervisor"}
    When method post
    Then status 200
    And print response
    And assert response.fullName == "Supervisor"
    Given path "/api/token/verify"
    And param token = response.token
    And param username = "SUPERVISOR"
    When method get
    Then status 200
    And print response
    And assert response == "true"

  Scenario: Negative test validate token verify with wrong username - Negative Testing
    Given url "https://tek-insurance-api.azurewebsites.net"
    And path "/api/token"
    And request {"username" : "supervisor" , "password" : "tek_supervisor"}
    When method post
    Then status 200
    And print response
    And assert response.username == "SUPERVISOR"
    Given path "/api/token/verify"
    And param token = response.token
    And param username = "SUPERVIsdf"
    When method get
    Then status 400
    And print response
    And assert response.errorCode == "TOKEN_NOT_VERIFIED"
    And assert response.httpStatus == "BAD_REQUEST"
    And assert response.errorMessage == "Wrong Username send along with Token"

  Scenario: Negative Test with Invalid Token and valid Username - Negative Testing
    Given url "https://tek-insurance-api.azurewebsites.net"
    And path "/api/token"
    And request {"username" : "supervisor" , "password" : "tek_supervisor"}
    When method post
    Then status 200
    And print response
    And assert response.fullName == "Supervisor"
    
    Given path "/api/token/verify"
    And param token = "sdfsfsfslkdjfsdlf slfd j"
    And param username = "SUPERVISOR"
    When method get
    Then status 400
    And print response
    And assert response.errorMessage == "Token Expired or Invalid Token"
    
    
