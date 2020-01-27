# Prova de iOS
## Objetivo

Você deve desenvolver uma aplicação iOS Nativa em Swift que consuma a API
do Github Issues ( https://developer.github.com/v3/issues/ ), usando como base o repositório
do Swift ( https://github.com/apple/swift ).

## O aplicativo deve conter

* [x] Uma tela com a lista de issues do repositório
( https://api.github.com/repos/apple/swift/issues ). Cada item da lista deve
conter os seguintes elementos:
    * [x] Título do issue
    * [x] Estado do issue (ABERTO, FECHADO)
* [x] Uma tela mostrando os detalhes do issue que foi selecionado na lista, que deve
conter os seguintes elementos:
    * [x] Título do issue
    * [x] Texto de Descrição do issue
    * [x] Avatar do usuário que criou a issue
    * [x] Data de criação
    * [x] Um botão que abre o browser com o link issue do site do github

## Requisitos

* [x] Ser escrito em Swift
* [ ] Testes Unitários (preferencialmente com Quick, Nimble, Cuckoo e OHHTTPStubs)
* [x] Clean Architecture (MVP ou MVVM)
* [x] Chamadas de REST com Alamofire/Moya


## Importante conhecer

* [x] Firebase

## Pontos de avaliação

* Como você organiza seus arquivos, métodos, nomeia variáveis, lida com o seu
código como um todo são pontos observados. Seja cuidadoso, utilize boas
práticas e padrões.
* Siga o guideline da Apple, bem como respeite as boas práticas do Swift.
* Codifique como você gostaria de trabalhar.
