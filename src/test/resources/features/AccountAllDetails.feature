@Regression
Feature: Create an account and add address, phone and car Testing

  Background: generate token
    * def tokenFeature = callonce read('GenerateToken.feature')
    * def token = tokenFeature.response.token
    Given url "https://tek-insurance-api.azurewebsites.net"

  Scenario: Create an account add address, phone and car Testing
    * def generateData = Java.type('api.data.GenerateData')
    * def randomEmail = generateData.getEmail()
    * def randomLicense = generateData.getRandomLicense()
    * def randomPhone = generateData.getPhoneNumber()
    # create an account
    Given path "/api/accounts/add-primary-account"
    And header Authorization = "Bearer " + token
    And request
      """
      {
       "email": "#(randomEmail)",
       "firstName": "Morteza",
       "lastName": "Sharifi",
       "title": "Mr.",
       "gender": "MALE",
       "maritalStatus": "SINGLE",
       "employmentStatus": "Tester",
       "dateOfBirth": "1996-11-28",
       "new": true
      }
      """
    When method post
    Then status 201
    And print response
    And assert response.email == randomEmail
    * def id = response.id
    And assert response.id == id
    # add address
    Given path "/api/accounts/add-account-address"
    And header Authorization = "Bearer " + token
    And param primaryPersonId = id
    And request
      """
      {
      "addressType": "Home",
      "addressLine1": "7600 July Ave",
      "city": "Windsor",
      "state": "Ontario",
      "postalCode": "986702",
      "countryCode": "",
      "current": true
      }
      """
    When method post
    Then status 201
    And print response
    And assert response.addressLine1 == "7600 July Ave"
    # add car
    Given path "/api/accounts/add-account-car"
    And header Authorization = "Bearer " + token
    And param primaryPersonId = id
    And request
      """
      {
      "make": "Toyota",
      "model": "Camry",
      "year": "2023",
      "licensePlate": "#(randomLicense)"
      }
      """
    When method post
    Then status 201
    And print response
    And assert response.licensePlate == randomLicense
    # add phone
    Given path "/api/accounts/add-account-phone"
    And header Authorization = "Bearer " + token
    And param primaryPersonId = id
    And request
      """
      {
      "phoneNumber": "#(randomPhone)",
      "phoneExtension": "",
      "phoneTime": "Home",
      "phoneType": "Mobile"
      }
      """
    When method post
    Then status 201
    And print response
    And assert response.phoneNumber == randomPhone
    #Get account
    Given path "/api/accounts/get-account"
    And header Authorization = "Bearer " + token
    And param primaryPersonId = id
    When method get
    Then status 200
    And print response
    And assert response.primaryPerson.id == id
