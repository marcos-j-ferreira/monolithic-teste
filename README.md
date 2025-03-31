# README

## Descrição
Este projeto automatiza testes de autenticação e criação de contas em uma aplicação web utilizando a biblioteca **SeleniumLibrary** no **Robot Framework**. O objetivo é garantir a validação de diferentes cenários de login e cadastro, incluindo tentativas com credenciais corretas e incorretas.

## Funcionalidades
- Abertura e fechamento automático do navegador.
- Realização de testes de login com credenciais válidas e inválidas.
- Criação de contas com e sem erros.
- Verificação de mensagens de sucesso e falha.
- Validação da visibilidade de campos e botões na interface.
- Utilização de variáveis externas para facilitar a manutenção dos testes.

## Requisitos
- Python 3
- Robot Framework
- SeleniumLibrary

## Instalação
1. Clone este repositório:
   ```sh
   git clone https://github.com/marcos-j-ferreira/monolithic-teste
   cd Test-robotframework
   ```
2. Instale as dependências do Robot Framework:
   ```sh
   pip install robotframework
   pip install robotframework-seleniumlibrary
   ```

## Estrutura dos Arquivos
-  [  Arquivo contendo as variáveis usadas nos testes.
-   monolithic.robot  Arquivo contendo as keywords para as ações e validações.
-  ] : Arquivo contendo os teste organizados.

## Test Cases

### Cenário 1 (Cadastro) - Cadastro bem-sucedido
Realiza o cadastro com credenciais válidas e valida a criação da conta.

### Cenário 2 (Cadastro) - Campos obrigatórios
Verifica a obrigatoriedade dos campos ao tentar criar uma conta sem preenchê-los.

### Cenário 3 (Cadastro) - Validação do formato do E-mail
Testa a criação de conta com um e-mail em formato inválido.

### Cenário 4 (Login) - Login bem-sucedido
Realiza o login com credenciais válidas e valida o acesso ao sistema.

### Cenário 5 (Login) - Login com credenciais erradas
Testa o login com senha incorreta e verifica a exibição da mensagem de erro.

### Cenário 6 (Login) - Login com conta inexistente
Verifica a tentativa de login com um e-mail que não possui cadastro.

## Uso
Execute os testes com o seguinte comando:
```sh
robot ./test-case.robot
```

## Relatórios
Os resultados dos testes são gerados
- `log.html`: Log detalhado da execução dos testes.
- `report.html`: Relatório com o resumo dos testes.
- `output.xml`: Arquivo com os resultados brutos.

## Site com mais especificações da documentação 

Page: https://marcos-j-ferreira.github.io/documenta-o.github.io/

- Objetivo:  Compactar todos as informações em um só lugar

## Autor
Marcos Júnior,
marcos.j.lemes.2004@gmail.com
