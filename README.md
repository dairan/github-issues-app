 aplicação iOS Nativa em Swift que consuma a API do Github Issues ( https://developer.github.com/v3/issues/ ), usando como base o repositório do Swift ( https://github.com/apple/swift ).

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


* [x] Ser escrito em Swift
* [ ] Testes Unitários (XCTest)
* [x] Clean Architecture (MVVM)
* [x] Chamadas de REST com URLSession/Alamofire

