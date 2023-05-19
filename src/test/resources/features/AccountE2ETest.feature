@Regression
Feature: End 2 End Account Testing
#End 2 End Account Testing.
#Create Account
#Add Address
#Add phone
#Add car
#Get Account
#Note: Everything in 1 scenario.
	Background: Setup Test Generate Token
	* def tokenFeature = callonce read('GenerateToken.feature')
	* def token = tokenFeature.response.token
	Given url "https://tek-insurance-api.azurewebsites.net"
	
Scenario: End-End Account Creation Testing
* def dataGenerator = Java.type('api.data.GenerateData')
* def autoEmail = dataGenerator.getEmail()
* def autoPhone = dataGenerator.getPhone()
* def autoLicense1 = dataGenerator.getRandomLicense()

#Create Account
Given path "/api/accounts/add-primary-account"
And header authorization = "Bearer " + token
And request
"""
{"email": "#(autoEmail)",
		"firstName": "Morteza",
		"lastName": "Sharifi",
		"title": "Mr.",
		"gender": "MALE",
		"maritalStatus": "SINGLE",
		"employmentStatus": "Tester",
		"dateOfBirth": "1995-05-10"
		}
"""
When method post
Then status 201
And print response
* def uniquId = response.id
And assert response.email == autoEmail

#Add Car
Given path "/api/accounts/add-account-car"
And header authorization = "Bearer " + token
And param primaryPersonId = uniquId
And request 
"""
{
  "make": "Toyota",
  "model": "Rav4",
  "year": "2023",
  "licensePlate": "#(autoLicense1)"
}
"""
When method post
Then status 201
And print response
And assert response.licensePlate == autoLicense1
And assert response.make == "Toyota" 

#Add Phone
Given path "/api/accounts/add-account-phone"
And header authorization = "Bearer " + token
And param primaryPersonId = uniquId
And request 
"""
{
  "phoneNumber": "#(autoPhone)",
  "phoneExtension": "1",
  "phoneTime": "Morning",
  "phoneType": "Home"
}
"""
When method post
Then status 201
And print response
And assert response.phoneNumber == autoPhone

#Add Address
Given path "/api/accounts/add-account-address"
And header authorization = "Bearer " + token
And param primaryPersonId = uniquId
And request 
"""
{
  "addressType": "Home",
  "addressLine1": "3487 Hemlock Rd",
  "city": "Toronto",
  "state": "Ontario",
  "postalCode": "12345",
  "countryCode": "1",
  "current": true
}
"""
When method post
Then status 201
And print response
And assert response.addressLine1 == "3487 Hemlock Rd"

#Get Account
Given path "api/accounts/get-primary-account"
And header authorization = "Bearer " + token
And param primaryPersonId = uniquId
When method get
Then status 200
And print response
And assert response.id == uniquId





