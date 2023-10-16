Feature: Validar Consulta de usuario

  Background:
    Given url baseUrl
    And header Content-Type = 'application/json'


  Scenario: consultar todos os usuarios

    When method get
    Then status 200


  Scenario: consultar Usuario especifico com id 1

    And path 1 // consulta pelo id 1
    When method get
    Then status 200


  Scenario:consultar Usuario especifico com id 2 validando o retorno
    Given url 'https://jsonplaceholder.typicode.com/users'
    And path 2
    When method get
    Then status 200
    And match response == read('../data/response.json')// o caminho a ser comparado na pasta data  response.json


  Scenario:consultar usuario com id 2 com query-string validando campo especifico // get
    And path 2
    And param example = 'teste'
    When method get
    Then status 200
    And match response.id == 2


  Scenario: cadastro usuario com sucesso //post
    * def payload = read('../data/payloadFile.Json')
    And request {nome: 'fabiano dojo karater'} // request um metodo para enserir dados na api
    When method post // post para cadastra usuario
    Then status 201
    And match response ==  {"nome":"fabiano dojo karater","id":11} // validando a resposta da api passando os parametros do data/payloadfile


  Scenario: atualizar usuario com id 3 //put
    * def userId = 3 // criado uma variavel
    And path userId
    And header apikey = 'valor-header'
    * def lstHarders = {auth:'token',empelco:'teste'} // passando harders por variavel
    And headers lstHarders
    * def payload = {email: 'dojo.karater@inmetrics.com.br'}// variavel
    And request payload
    When method put
    Then status 200
    And match response =={email: "#(payload.email)",id: "#(userId)" }
    And match response =={email: "#string", id: "#(userId)" }
