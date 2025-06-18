Feature: API Auth - FakeStore

  Background:
    * url baseUrl
    * configure headers = { 'Content-Type': 'application/json' }
    * def bodyAuthSuccess = read('classpath:json/auth/auth-success.json')
    * def bodyAuthFail = read('classpath:json/auth/auth-failed.json')

  @AUTH_SUCCESS
  Scenario: Autenticación exitosa con credenciales válidas
    Given path '/auth/login'
    And request bodyAuthSuccess
    When method post
    Then status 200
    And print response
    And match response.token != null
    And match response.token contains 'ey'

  @AUTH_FAIL
  Scenario: Autenticación fallida con credenciales inválidas
    Given path '/auth/login'
    And request bodyAuthFail
    When method post
    Then status 401
    And print response
    And match response == 'username or password is incorrect'