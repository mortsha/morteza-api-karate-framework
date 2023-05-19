@Regression
Feature: Random Account Creation

	Background: Setup Test Generato Token
	
	* def tokenFeature = callonce read('GenerateToken.feature')
	* def token = tokenFeature.response.token
	Given url "https://tek-insurance-api.azurewebsites.net"

	
	Scenario: Create Account with Random Email
		# Call Java Class and Method with Karate.
		* def dataGenerator = Java.type('api.data.GenerateData')
		* def autoEmail = dataGenerator.getEmail()
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
		And assert response.email == autoEmail
		
		