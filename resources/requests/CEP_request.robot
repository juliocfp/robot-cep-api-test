*** Settings ***

Resource  ../../base.robot

*** Variables ***

${response}

*** Keywords ***

tenha os dados de acesso do serviço de Consultar CEP
  Create Session  consultaCEP  ${VIACEP_HOST_SERVICE}

consultar um CEP via serviço ${cep}
    ${response}=  GET On Session  consultaCEP  /ws/${cep}/json/  expected_status=any
    Set Test Variable  ${response}