@Regression
Feature: Update Phone Account

  Scenario: Generate a valid Token And update phone account
    Given url "https://tek-insurance-api.azurewebsites.net"
    And path "/api/token"
    And request
      """
      {
        "username": "supervisor",
        "password": "tek_supervisor"
      }
      """
    When method post
    Then status 200
    And print response
    * def generateData = Java.type('api.data.GenerateData')
    * def randomPhone = generateData.getPhone()
    Given url "https://tek-insurance-api.azurewebsites.net"
    And path "/api/accounts/update-account-phone"
    And header Authorization = "Bearer " + response.token
    And param primaryPersonId = 7888
    And request
      """
      {
      "phoneNumber": "#(randomPhone)",
      "phoneExtension": "",
      "phoneTime": "Home",
      "phoneType": "Mobile"
      }
      """
    When method put
    Then status 200
    And print response
    And assert response.phoneNumber == randomPhone
