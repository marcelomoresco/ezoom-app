# Exemplo de modulo

Neste módulo contamos com 3 pastas principais e uma de arquivo constants. No módulo de tasks temos a mesma cosia

## Domain

Essa parte da arquitetura é responsável por representar o domínio da aplicação. Aqui é onde fica as regras de negócio, entidades, objetos de valor, serviços e interfaces que são utilizadas pela aplicação. O ideal é que essa camada seja independente de qualquer outra camada, ou seja, ela não deve depender de nenhuma outra camada, e sim, as outras camadas que devem depender dela.

## Data

Esta camada dá suporte a camada Domain implementando suas interfaces. Implementar a comunicação com serviços externos

- UseCases:
  Use cases são responsáveis por executar uma tarefa especifica, onde contém a regra de negócio.

-Repositórios:
Responsáveis por fazer as chamadas com o banco de dados, nesse caso com a api

## Presentation

Esse módulo é responsável por prover a interface com o usuário, Também conhecido como Presenter ou View, deve depender apenas das implementações de domain que estão no data, nesse caso os usecases
