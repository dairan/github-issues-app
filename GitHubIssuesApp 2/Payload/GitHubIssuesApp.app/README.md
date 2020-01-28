[![Build Status](https://app.bitrise.io/app/7fd3c7f523c0b036/status.svg?token=n1HcVC1C2l0wJxXa7WMb5A)](https://app.bitrise.io/app/7fd3c7f523c0b036) 
(https://img.shields.io/twitter/follow/dairan?label=Follow)

# GitHub App.

### Demo de aplicação de conhecimentos sobre arquitetura de desenvolvimento de apps para iOS. 

O app consiste em duas telas que consome API do Github Issues:  https://developer.github.com/v3/issues
 

## Features principais

* Tela com a lista de issues do repositório.
    Cada item da lista contêm os seguintes elementos:
    
    * [x] Título.
    * [x] Estado (ABERTO, FECHADO).

* Uma que mostra os detalhes do issue que foi selecionado na lista, que contêm os seguintes elementos:
    
    * [x] Título.
    * [x] Texto de descrição.
    * [x] Avatar do usuário.
    * [x] Data de criação.
    * [x] Um botão que abre o browser com o link issue do site do GitHub.


## Outras features

[x] Localização (pt-BR e en-US)

## Arquitetura

* ✅ Escrito em Swift.
* ✅ Testes Unitários (XCTest).
* ✅ Clean Architecture (MVVM design partter).
* ✅ Clean Architecture (Coordinator design partter).
* ✅ Chamadas de REST com URLSession/Alamofire


## Ferramentas de ambiente

 * [X] Cocoapods
 * [X] Bitrise (CI/ CD)
 * [ ] TODO: Fastlane 
