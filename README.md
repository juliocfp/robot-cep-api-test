# Descrição
Projeto de teste automatizado, cobrindo a consulta de CEP via web e serviço. Para este desafio, foi escolhido Python com Robot Framework. Escolhi o Robot Framework devido a sua facilidade e rapidez de criar os testes em todas as plataformas. O sistema operacional utilizado foi o Windows 10.

## Instalação
### Python
Instalar a versão 3.11.2 ou + do Python. Durante a instalação, marque a opção de adicionar o Python ao PATH. Lista de versões para download: https://www.python.org/downloads/

### Bibliotecas
Instalar as bibliotecas necessárias para rodar o projeto. São elas: Selenium e Requests. Para isso, vá até a raiz do projeto clonado e execute o comando:
```
pip3 install -r .\requirements.txt
```
### ChromeDriver
Realizar o download do chromedriver.exe e armazená-lo na pasta /Scripts do Python utilizado para o teste. Ele precisa ser compatível com a versão do navegador Google Chrome instalado na sua máquina. Lista de versões para download: https://chromedriver.chromium.org/downloads

## Execução
Para executar os testes, abra um terminal ou utilize o próprio da IDE que esteja usando, e rode os comandos:

* Cenários Web:
```
robot -d results -i buscarCEP_web tests
```
Será aberto um navegador, os passos serão executados e o navegador fechará sozinho.

* Cenários Service:
```
robot -d results -i buscarCEP_service tests
```
Só será possível acompanhar pelo terminal.
### Relatórios
Ao final de cada execução, é gerado um relatório em HTML chamado report.html, na pasta /results. Basta abrir o arquivo para visualizar o resultado da última execução dos seus testes.

## Sobre o projeto
A estrutura do projeto está bem simples. Na raiz, temos as pastas /resources, /results e /tests, e os arquivos base.robot e requirements.txt.

### /resources
Nesta pasta, temos:
* general_keywords: contém as keywords utilizadas por mais de um contexto de teste.
* page_objects: contém as páginas e seus objetos usados nas ações e validações.
* requests: contém as chamadas feitas para os serviços validados.

### /results
Cada execução gera uma sequência de relatórios sobrepostos, então apenas os dados da última execução será exibido.
* log.html
* output.xml
* report.html

### /tests
Os testes foram separados por plataforma, sendo elas backend e frontend. Dentro de cada uma, foi feita uma separação entre passos do teste e as keywords específicas daquele teste (com sufixo _keywords).