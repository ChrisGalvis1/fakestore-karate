Feature: API Carts - FakeStore

  Background:
    * url baseUrl
    * configure headers = { 'Content-Type': 'application/json' }
    * def bodyPost = read('classpath:json/carts/post-cart.json')
    * def bodyPut = read('classpath:json/carts/put-cart.json')

  @GET_ALL_CARTS
  Scenario: Obtener todos los carritos
    Given path '/carts'
    When method get
    Then status 200
    And print response
    And match response == '#[]'
    And match response[0].id != null
    And match response[0].userId != null

  @GET_CART_BY_ID
  Scenario Outline: Consultar carrito por ID
    Given path '/carts', <id>
    When method get
    Then status 200
    And print response
    And match response.id == <id>
    And match response.userId != null

    Examples:
      | id |
      | 1  |
      | 2  |

  @POST_CART
  Scenario: Crear un nuevo carrito
    Given path '/carts'
    And request bodyPost
    When method post
    Then status 200
    And print response
    And match response.userId == bodyPost.userId
    And match response.products[0].productId == bodyPost.products[0].productId

  @PUT_CART
  Scenario Outline: Actualizar un carrito
    Given path '/carts', <id>
    And request bodyPut
    When method put
    Then status 200
    And print response
    And match response.date == bodyPut.date

    Examples:
      | id |
      | 5  |
      | 6  |

  @DELETE_CART
  Scenario Outline: Eliminar un carrito por ID
    Given path '/carts', <id>
    When method delete
    Then status 200
    And print response

    Examples:
      | id |
      | 7  |
      | 8  |