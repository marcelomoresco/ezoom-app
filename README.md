# Ezoom-Teste-Mobile

Teste para a vaga de desenvolvedor mobile da Ezoom. O aplicativo foi desenvolvido em flutter, e
segue a arquitetura limpa, respeitando os princípios de SOLID.

## Decições técnicas

A arquitetura segue a arquitetura por camadas, na qual utilizei o Flutter Modular para cada feature da aplicaçao ter um modulo, e em cada modúlo temos 3 camadas

- Data
- Domain ()
- Presentation(Camada de apresentação, as telas em si)

## Detalhes principais

- **Arquitetura**: Clean arch
- **Linguagem**: Dart
- **Framework**: Flutter
- **Gerenciamento de Estado**: Bloc/Cubit
- **Testes**: Gostaria de ter feito testes unitários e de integração
- **Padrões de Projeto**: Repository, Service, DTO, Failures, Controller, Store
  Providers

## Funcionalidades

- **Autenticação**: Login de Email e Anonima.
- **Confirmação de Email**.
- **Recuperação de Senha**.
- **Listagem de Veiculos**.
- **Requisição Offline**: Cacheia a listagem para exibir offline.
- **Idiomas**: Suporte para Português, Inglês, Espanhol, Francês, Alemão e Japonês.
- **Tema**: Suporte a Tema Escuro e Claro.
- **Testes**: Testes Unitários e Testes de Widgets.
- **Crashlytics**

## Como executar

- **Requisitos**: Flutter >=3.3.0 <4.0.0 e Projeto configurado com Autenticação de Email e Anonima

1. Clone o repositório

```
git clone https://github.com/boginni/WS-Work-Teste-Mobile.git
```

2. Configure o projeto com o Firebase, precisa ter Autenticação de Email e Anonima

```
flutterfire configure
```

3. Resolva as dependências do projeto

```
flutter pub get
```

4. Execute o projeto

```
flutter run
```
