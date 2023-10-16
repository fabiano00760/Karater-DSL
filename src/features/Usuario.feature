Feature: Validar Consulta de usuario

  Scenario: consultar todos os usuarios

    Given url 'https://jsonplaceholder.typicode.com/users'
    And header Content-Type = 'application/json'
    When method get
    Then status 200



  Scenario: consultar Usuario especifico com id 1

    Given url 'https://jsonplaceholder.typicode.com/users'
    And path 1 // consulta pelo id 1
    And header Content-Type = 'application/json'
    When method get
    Then status 200


  Scenario:consultar Usuario especifico com id 2 validando o retorno
    Given url 'https://jsonplaceholder.typicode.com/users'
    And path 2
    And header Content-Type = 'application/json'
    When method get
    Then status 200
    And match response == read('../data/response.json')// o caminho a ser comparado na pasta data  response.json



  Scenario:consultar usuario com id 2 com query-string validando campo especifico
    Given url 'https://jsonplaceholder.typicode.com/users/2'
    And param example = 'teste'
    When method get
    Then status 200
    And match response.id == 2


