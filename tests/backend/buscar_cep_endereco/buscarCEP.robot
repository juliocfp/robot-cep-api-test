*** Settings ***

Documentation  Validação da chamada de consulta de CEP
Resource       ../../../base.robot
Force Tags     BuscarCEP_service
Suite Setup    Dado que tenha os dados de acesso do serviço de Consultar CEP

*** Test Cases ***

Esquema de Cenário 1 - Consulta de CEP com sucesso
  [Template]  Template Esquema de Cenário 1 - Consulta de CEP com sucesso
  [Tags]      BuscarCEPSucesso_service

  #cep       logradouro                     complemento                bairro      localidade      uf  ibge     gia   ddd siafi
  31710-350  Rua São Miguel                 \                          Itapoã      Belo Horizonte  MG  3106200  \     31  4123
  01302-001  Rua da Consolação              de 1100 a 2460 - lado par  Consolação  São Paulo       SP  3550308  1004  11  7107
  81810-490  Rua Eurico Fonseca dos Santos  \                          Xaxim       Curitiba        PR  4106902  \     41  7535

Cenário 2 - Consulta de CEP com número de dígitos incorretos
  [Tags]  BuscarCEPErro_service

  Quando consultar um CEP via serviço 013020001
  Então deve ser retornado o status code 400
  
Cenário 3 - Consulta de CEP com dígitos alfanuméricos
  [Tags]  BuscarCEPErro_service

  Quando consultar um CEP via serviço O13OZ-OO1
  Então deve ser retornado o status code 400

Cenário 4 - Consulta de CEP com o dígito espaço
  [Tags]  BuscarCEPErro_service

  Quando consultar um CEP via serviço 01302 001
  Então deve ser retornado o status code 400

Cenário 5 - Consulta de CEP não existente
  [Tags]  BuscarCEPErro_service

  Quando consultar um CEP via serviço 31710-388
  Então deve ser retornado o status code 200
  E deve ser retornado o body com erro