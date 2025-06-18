Feature: API Users - FakeStore

  Background:
    * url baseUrl
    * configure headers = { 'Content-Type': 'application/json' }
    * def bodyPost = read('classpath:json/users/post-user.json')
    * def bodyPut = read('classpath:json/users/put-user.json')

  @GET_ALL_USERS
  Scenario: Obtener todos los usuarios
    Given path '/users'
    When method get
    Then status 200
    And print response
    And match response[0].username != null

  @GET_USER_BY_ID
  Scenario Outline: Obtener un usuario por ID
    Given path '/users', <id>
    When method get
    Then status 200
    And print response
    And match response.username != null
    And match response.email contains '@'

    Examples:
      | id |
      | 1  |
      | 2  |

  @POST_USER
  Scenario: Crear un nuevo usuario
    Given path '/users'
    And request bodyPost
    When method post
    Then status 200
    And print response

  @PUT_USER
  Scenario Outline: Actualizar un usuario por ID
    Given path '/users', <id>
    And request bodyPut
    When method put
    Then status 200
    And print response
    And match response.username == bodyPut.username
    And match response.email == bodyPut.email

    Examples:
      | id        |
      | 85745619  |

  @DELETE_USER
  Scenario Outline: Eliminar un usuario por ID
    Given path '/users', <id>
    When method delete
    Then status 200
    And print response

    Examples:
      | id        |
      | 85745619  |