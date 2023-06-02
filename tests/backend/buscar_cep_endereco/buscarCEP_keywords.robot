*** Settings ***

Resource  ../../../base.robot

*** Keywords ***

Template Esquema de Cenário 1 - Consulta de CEP com sucesso
  [Arguments]  ${cep}  ${logradouro}  ${complemento}  ${bairro}  ${localidade}
  ...          ${uf}   ${ibge}        ${gia}          ${ddd}     ${siafi}

  Quando consultar um CEP via serviço ${cep}
  Então deve ser retornado o status code 200
  E deve ser retornado com sucesso, os dados de ${cep}, ${logradouro}, ${complemento}, ${bairro}, ${localidade}, ${uf}, ${ibge}, ${gia}, ${ddd}, ${siafi}

deve ser retornado com sucesso, os dados de ${cep}, ${logradouro}, ${complemento}, ${bairro}, ${localidade}, ${uf}, ${ibge}, ${gia}, ${ddd}, ${siafi}
  Dictionary Should Contain Item  ${response.json()}  cep          ${cep}
  Dictionary Should Contain Item  ${response.json()}  logradouro   ${logradouro}
  Dictionary Should Contain Item  ${response.json()}  complemento  ${complemento}
  Dictionary Should Contain Item  ${response.json()}  bairro       ${bairro}
  Dictionary Should Contain Item  ${response.json()}  localidade   ${localidade}
  Dictionary Should Contain Item  ${response.json()}  ibge         ${ibge}
  Dictionary Should Contain Item  ${response.json()}  ddd          ${ddd}
  Dictionary Should Contain Item  ${response.json()}  siafi        ${siafi}

deve ser retornado o status code ${code}
   Status Should Be  ${code}  ${response}

deve ser retornado o body com erro
  Dictionary Should Contain Item  ${response.json()}  erro  ${True}