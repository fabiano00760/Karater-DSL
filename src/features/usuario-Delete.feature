Feature:Validar exclusao de usuario

  Background:
    Given url baseUrl
    And header Content-Type = 'application/json'

  Scenario:Excluir usuario com id 10 com sucesso
    And path 10
    When method delete
    Then status 200
    And match response == {}