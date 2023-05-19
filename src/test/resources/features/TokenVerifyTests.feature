
@Smoke @Regression
Feature: Token Verify Test

	Background: Setup Request URL
		Given url "https://tek-insurance-api.azurewebsites.net"
		
	Scenario: Verify valid token
		And path "/api/token"
		And request {"username": "supervisor","password": "tek_supervisor"}
		When method post
		Then status 200
		And print response
		Given path "/api/token/verify"
		And param token = response.token
		And param username = "supervisor"
		When method get
		Then status 200
		And print response
		
	Scenario: Verify valik token again
		And path "/api/token"
		And request {"username": "supervisor","password": "tek_supervisor"}
		When method post
		Then status 200
		And print response
		Given path "/api/token/verify"
		And param token = response.token
		And param username = "supervisor"
		When method get
		Then status 200
		And print response
		And assert response == "true"
		
	Scenario: Negative test validate token verify with wrong username
		And path "api/token"
		And request {"username": "supervisor","password": "tek_supervisor"}
		When method post
		Then status 200
		And print response
		Given path "/api/token/verify"
		And param token = response.token
		And param username = "anything"
		When method get
		Then status 400
		And print response
		And assert response.errorMessage == "Wrong Username send along with Token"
		
	Scenario: Negative test Verify token with Invalid token and valid username
		And path "api/token"
		And request {"username": "supervisor","password": "tek_supervisor"}
		When method post
		Then status 200
		And print response
		Given path "/api/token/verify"
		And param token = "anithigdsfsfsdfsdfs"
		And param username = "supervisor"
		When method get
		Then status 400
		And print response
		And assert response.errorMessage == "Token Expired or Invalid Token"
		
		
		
		
		
		
		