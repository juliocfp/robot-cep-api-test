*** Settings ***

Documentation  Validação de consulta de CEP pelo site Correios
Resource       ../../../base.robot
Force Tags     buscarCEP_web
Test Setup     Dado que tenha o site Correios aberto no navegador
Test Teardown  Então deve fechar o navegador

*** Test Cases ***

Cenário 1 - Consulta de CEP com sucesso (hífen)
  [Tags]  buscarCEPSucesso_web

  Quando consultar o CEP ${01302001.valor}
  Então deve ser exibida a tela com resultado da busca para o CEP ${01302001.valor} com Logradouro/Nome, Bairro/Distrito, Localidade/UF, CEP

Cenário 2 - Consulta de CEP com sucesso (dígito espaço)
  [Tags]  buscarCEPSucesso_web

  Quando consultar o CEP ${01302_001.valor}
  Então deve ser exibida a tela com resultado da busca considerando a busca como uma parte do Logradouro/Nome

Cenário 3 - Consulta de CEP com sucesso (tudo junto)
  [Tags]  buscarCEPSucesso_web

  Quando consultar o CEP ${04173170.valor}
  Então deve ser exibida a tela com resultado da busca para o CEP ${04173170.valor} com Logradouro/Nome, Bairro/Distrito, Localidade/UF, CEP

Cenário 4 - Consulta de CEP com número de dígitos incorretos
  [Tags]  buscarCEPerro_web

  Quando consultar o CEP 013020001
  Então deve ser exibida a tela com a mensagem de erro na tela: Dados não encontrado
  
Cenário 5 - Consulta de CEP com dígitos alfanuméricos
  [Tags]  buscarCEPerro_web

  Quando consultar o CEP O13OZ-OO1
  Então deve ser exibida a tela com a mensagem de erro na tela: Dados não encontrado

Cenário 6 - Consulta de CEP não existente
  [Tags]  buscarCEPerro_web

  Quando consultar o CEP 31710-388
  Então deve ser exibida a tela com a mensagem de erro na tela: Dados não encontrado