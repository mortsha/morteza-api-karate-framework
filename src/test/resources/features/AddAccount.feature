@Regression
Feature: Create a new Account

  Background: generate token
    * def result = callonce read('GenerateToken.feature')
    * def generatedToken = result.response.token
    Given url "https://tek-insurance-api.azurewebsites.net"

  Scenario: Create a new Account
    * def generatedData = Java.type('api.data.GenerateData')
    * def randomEmail = generatedData.getEmail()
    Given path "/api/accounts/add-primary-account"
    And header Authorization = "Bearer " + generatedToken
    And request
      """
      {
       "email": "#(randomEmail)",
       "firstName": "Morteza",
       "lastName": "Sharifi",
       "title": "Mr.",
       "gender": "MALE",
       "maritalStatus": "MARRIED",
       "employmentStatus": "Student",
       "dateOfBirth": "1996-11-28",
       "new": true
      }
      """
    When method post
    Then status 201
    And print response
