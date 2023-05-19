@Regression
Feature: Create An Account Test

	Background: Setup Request URL
		# callonce read is Karate Step to execute and read another feature file.
		# the result of callonce can store into new variable using def step.
		* def result = callonce read('GenerateToken.feature')
		And print result
		* def generatedToken = result.response.token
		Given url "https://tek-insurance-api.azurewebsites.net"
		
	Scenario: Create An Account and Delete the Account
		Given path "/api/accounts/add-primary-account"
		And header authorization = "Bearer " + generatedToken
		And request 
		"""
		{"email": "mort7781@gmail.com",
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
		* def emailAccount = response.email
		And assert response.email == response.email
		
		#delete account
		Given path "api/accounts/delete-account"
		And header authorization = "Bearer " + generatedToken
		And param primaryPersonId = response.id
		When method delete
		Then status 200
		And print response
		And assert response == "Account Successfully deleted"
		