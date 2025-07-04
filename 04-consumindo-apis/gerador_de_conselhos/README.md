# 🔮 Gerador de Conselhos via API

Este é o primeiro projeto do módulo de consumo de APIs. O objetivo foi criar um aplicativo que se conecta à internet para buscar dados de uma fonte externa, a [Advice Slip API](https://api.adviceslip.com/).

## 🎯 Funcionalidades

-   Busca um conselho aleatório de uma API pública a cada clique.
-   Exibe um indicador de carregamento (`CircularProgressIndicator`) enquanto a requisição está em andamento.
-   Mostra o conselho recebido na tela.
-   Utiliza um `try-catch` para lidar com possíveis erros de conexão ou de parsing de dados.

## 🛠️ Conceitos Técnicos Aplicados

-   **Consumo de API:** Uso do pacote `http` para fazer requisições `GET`.
-   **Programação Assíncrona:** Uso de `async/await` para lidar com operações que levam tempo.
-   **Parsing de JSON:** Conversão da resposta da API (JSON) para um objeto Dart (`factory constructor fromJson`).
-   **Gerenciamento de Estado de UI:** Uso do Provider para gerenciar o estado de `carregando` e exibir diferentes widgets na tela (`if/else` no `build`).
-   **Tratamento de Erros:** Implementação do bloco `try-catch-finally` para garantir que o app não quebre em caso de falha na requisição.

## 🎬 Demonstração

![Demonstração do App Gerador de Conselhos](./assets/conselho_demo.gif)

## 💡 Meus Aprendizados

Este projeto abriu as portas para o mundo dos aplicativos conectados. Entender o fluxo `async/await` e a necessidade do `try-catch` foi o maior aprendizado. Ver o app buscar um dado "real" da internet pela primeira vez foi um momento mágico e me fez sentir uma desenvolvedora de verdade.