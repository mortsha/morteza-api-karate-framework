@Regression
Feature: Get Branch code story

	Background: Setup Request URL
	* def result = callonce read('GenerateToken.feature')
		And print result
		* def generatedToken = result.response.token
		Given url "https://tek-insurance-api.azurewebsites.net"
		
	Scenario: Get all plans code
	Given path "/api/plans/get-all-plan-code"
	And header authorization = "Bearer " + generatedToken
	
	