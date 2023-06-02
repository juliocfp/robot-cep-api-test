*** Settings ***

Resource  ../../../base.robot

*** Variables ***

${i}=  0

*** Keywords ***

Dado que tenha o site ${site} aberto no navegador
  IF  "${site}" == "Correios"
    Open Browser  ${CORREIOS_HOST_WEB}  chrome
  END

consultar o CEP ${cep}
  Wait Until Page Contains Element  ${home.input_cep}
  Input Text  ${home.input_cep}     ${cep}
  Press Keys  ${home.input_cep}     ENTER
  Switch Window  NEW

deve ser exibida a tela com resultado da busca para o CEP ${cep} com Logradouro/Nome, Bairro/Distrito, Localidade/UF, CEP
  Wait Until Page Contains   Resultado da Busca por Endereço ou CEP
  IF  "${cep}" == "${01302001.valor}"
    FOR  ${item}  IN  &{01302001}
      IF  ${i} >= 1
        ${key}=  Get Dictionary Values  ${01302001}  sort_keys=False
        Table Cell Should Contain  ${app_endereco.table_resultado}  2  ${i}  ${key}[${i}]
      END
      ${i}=  Evaluate  ${i}+1
    END
  ELSE IF  "${cep}" == "${04173170.valor}"
    Table Cell Should Contain  ${app_endereco.table_resultado}  2  1  ${04173170.logradouro}
    Table Cell Should Contain  ${app_endereco.table_resultado}  2  2  ${04173170.bairro}
    Table Cell Should Contain  ${app_endereco.table_resultado}  2  3  ${04173170.localidade}
    Table Cell Should Contain  ${app_endereco.table_resultado}  2  4  ${04173170.cep}
  END
  
deve ser exibida a tela com resultado da busca considerando a busca como uma parte do Logradouro/Nome
  Wait Until Page Contains   Resultado da Busca por Endereço ou CEP
  Table Cell Should Contain  ${app_endereco.table_resultado}  2  1  ${01302_001.logradouro}
  Table Cell Should Contain  ${app_endereco.table_resultado}  2  2  ${01302_001.bairro}
  Table Cell Should Contain  ${app_endereco.table_resultado}  2  3  ${01302_001.localidade}
  Table Cell Should Contain  ${app_endereco.table_resultado}  2  4  ${01302_001.cep}

deve ser exibida a tela com a mensagem de erro na tela: ${mensagem}
  Wait Until Page Contains  ${mensagem}
  Page Should Contain       ${mensagem}

deve fechar o navegador
  Close Browser