# Ezoom-Teste-Mobile

Teste para a vaga de desenvolvedor mobile da Ezoom. O aplicativo foi desenvolvido em flutter, e
segue a arquitetura limpa, respeitando os princípios de SOLID.

Foi desenvolvido também a API com Autenticação básica e o CRUD das tarefas, feito com Java e Spring Boot,além disso foi feito o deploy via AWS, na aws utilizei o ec2 para subir a aplicação, além do RDS para banco de dados!

## Decições técnicas

A arquitetura segue a arquitetura por camadas, na qual utilizei o Flutter Modular para cada feature da aplicaçao ter um modulo, e em cada modúlo temos 3 camadas, além disso no módulo de auth tem um readme detalhando.

- Data
- Domain
- Presentation

## Detalhes principais

- **Arquitetura**: Clean arch
- **Linguagem**: Dart
- **Framework**: Flutter
- **Gerenciamento de Estado**: Bloc/Cubit
- **Testes**: _Gostaria de ter feito testes unitários e de integração_

## Funcionalidades

- **Autenticação**: Login e registrar usuário.
- **Crud de tarefas**: Criara, ler, atualizar e deletar as tarefas

## Como executar

- **Requisitos**: Flutter ">=3.3.0 <4.0.0"

```
git clone https://github.com/marcelomoresco/ezoom-app.git
```

```
flutter pub get
```

```
flutter run
```
