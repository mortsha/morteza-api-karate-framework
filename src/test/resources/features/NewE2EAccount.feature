Feature: New E - E Account Testing

  Background: Generate a valid Token
    * def tokenFolder = callonce read('GenerateToken1.feature')
    * def token = tokenFolder.response.token
    Given url "https://tek-insurance-api.azurewebsites.net"

  Scenario: Create Account and add phone, car, address
    * def generateData = Java.type('api.data.GenerateData')
    * def randomEmail = generateData.getNewEmail()
    * def randomPhone = generateData.getNewPhone()
    * def randomLicensePlate = generateData.getNewRanodmLicense()
    * def randomAddressLine = generateData.getAddressLine()
    * def randomPostal = generateData.getPostalCode()
    #Creating Account
    Given path "/api/accounts/add-primary-account"
    And header authorization = "Bearer " + token
    And request
      """
      {
      "email": "#(randomEmail)",
        "firstName": "Murtaza",
        "lastName": "Sharifi",
        "title": "Mr.",
        "gender": "MALE",
        "maritalStatus": "SINGLE",
        "employmentStatus": "Software Tester",
        "dateOfBirth": "1995-09-07",
        "new": true
      }
      """
    When method post
    Then status 201
    And print response
    * def mainId = response.id
    And assert response.email == randomEmail
    # Adding Phone
    Given path "/api/accounts/add-account-phone"
    And header authorization = "Bearer " + token
    And param primaryPersonId = mainId
    And request
      """
      {
        "phoneNumber": "#(randomPhone)",
        "phoneExtension": "",
        "phoneTime": "Morning",
        "phoneType": "Home"
      }
      """
    When method post
    Then status 201
    And print response
    And assert response.phoneNumber == randomPhone
    # Adding Car
    Given path "/api/accounts/add-account-car"
    And header authorization = "Bearer " + token
    And param primaryPersonId = mainId
    And request
      """
      {
        "make": "Lexus",
        "model": "RX 250",
        "year": "2023",
        "licensePlate": "#(randomLicensePlate)"
      }
      """
    When method post
    Then status 201
    And print response
    And assert response.licensePlate == randomLicensePlate
    # Adding Address
    Given path "/api/accounts/add-account-address"
    And header authorization = "Bearer " + token
    And param primaryPersonId = mainId
    And request
      """
      {
        "addressType": "Home",
        "addressLine1": "#(randomAddressLine)",
        "city": "Hamilton",
        "state": "Ontario",
        "postalCode": "#(randomPostal)",
        "countryCode": "",
        "current": true
      }
      """
    When method post
    Then status 201
    And print response
    And assert response.addressLine1 == randomAddressLine
    And assert response.postalCode == randomPostal
    
  
    Given path "/api/accounts/get-account"
    And header authorization = "Bearer " + token
    And param primaryPersonId = mainId
    When method get
    Then status 200
    And print response
    And assert response.primaryPerson.id == mainId
