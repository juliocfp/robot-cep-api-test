*** Settings ***

Library  SeleniumLibrary
Library  RequestsLibrary
Library  Collections

Resource  resources/general_keywords/bdd_config.robot

Resource  resources/page_objects/correios/buscaCEPEndereco_page.robot
Resource  resources/page_objects/correios/home_page.robot

Resource  resources/requests/CEP_request.robot

Resource  tests/backend/buscar_cep_endereco/buscarCEP_keywords.robot
Resource  tests/frontend/buscar_cep_endereco/buscarCEP_keywords.robot

*** Variables ***

${VIACEP_HOST_SERVICE}  https://viacep.com.br/
${CORREIOS_HOST_WEB}    https://www.correios.com.br/

&{01302001}
...  valor=01302-001
...  logradouro=Rua da Consolação - de 1100 a 2460 - lado par
...  bairro=Consolação
...  localidade=São Paulo/SP
...  cep=01302-001

&{01302_001}
...  valor=01302 001
...  logradouro=Rua 1º de Maio - de 1301/1302 a 1878/1879
...  bairro=Granja Portugal
...  localidade=Fortaleza/CE
...  cep=60541-315

&{04173170}
...  valor=04173170
...  logradouro=Rua Nagib Tanus Gastin
...  bairro=Jardim Botucatu
...  localidade=São Paulo/SP
...  cep=04173-170