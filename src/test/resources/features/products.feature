Feature: API Products - FakeStore

  Background:
    * url baseUrl
    * configure headers = { 'Content-Type': 'application/json' }
    * def bodyPost = read('classpath:json/product/post-product.json')
    * def bodyPut = read('classpath:json/product/put-product.json')

  @GET_ALL_PRODUCTS
  Scenario: Consultar todos los productos
    Given path '/products'
    When method get
    Then status 200
    And print response
    And match response == '#[]'
    And match response[0].id != null
    And match response[0].title != null

  @GET_PRODUCT_BY_ID
  Scenario Outline: Consultar un producto por id
    Given path '/products', <id>
    When method get
    Then status 200
    And print response
    And match response.id == <id>
    And match response.title != null

    Examples:
      | id |
      | 1  |
      | 2  |

  @POST_PRODUCT
  Scenario: Crear un producto
    Given path '/products'
    And request bodyPost
    When method post
    Then status 200
    And print response
    And match response.title == bodyPost.title
    And match response.price == bodyPost.price

  @PUT_PRODUCT
  Scenario Outline: Actualizar producto
    Given path '/products', <id>
    And request bodyPut
    When method put
    Then status 200
    And print response
    And match response.title == bodyPut.title
    And match response.description == bodyPut.description

    Examples:
      | id |
      | 5  |
      | 6  |

  @DELETE_PRODUCT
  Scenario Outline: Eliminar producto
    Given path '/products', <id>
    When method delete
    Then status 200
    And print response

    Examples:
      | id |
      | 5  |
      | 6  |