@Regression
Feature: Add phone to account

Background: generate token
	* def generateFeature = callonce read('GenerateToken.feature')
	* def token = generateFeature.response.token
	Given url "https://tek-insurance-api.azurewebsites.net"
	
	Scenario: Add phone to account
	* def generateData = Java.type('api.data.GenerateData')
	* def generatePhone = generateData.getPhoneNumber() 
	Given path "/api/accounts/add-account-phone"
	And header Authorization = "Bearer " + token
	And param primaryPersonId = 7888
	And request
	"""
	{
  "phoneNumber": "#(generatePhone)",
  "phoneExtension": "1",
  "phoneTime": "Home",
  "phoneType": "Mobile"
}
	"""
	When method post
	Then status 201
	And print response
	And assert response.phoneNumber == generatePhone