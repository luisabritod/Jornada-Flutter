# 🍳 Guia Culinário (App de Receitas)

Este projeto aplica e combina todos os conceitos aprendidos até agora (POO, Gerenciamento de Estado com Provider, Consumo de API) e introduz o pilar fundamental da construção de apps complexos: **Navegação entre Telas**.

O aplicativo se conecta à [TheMealDB API](https://www.themealdb.com/api.php) para buscar uma lista de sobremesas. Ao clicar em uma receita, o usuário navega para uma nova tela que exibe os detalhes completos do prato.

## 🎯 Funcionalidades

-   Busca e exibe uma lista de receitas (resumo) da API na tela inicial.
-   Permite a navegação para uma tela de detalhes ao clicar em um item da lista.
-   Na tela de detalhes, busca e exibe as informações completas da receita selecionada (ingredientes, instruções, etc.).
-   Gerencia estados de carregamento em ambas as requisições de API.

## 🛠️ Conceitos Técnicos Aplicados

-   **Navegação:** Uso de `Navigator.push` com `MaterialPageRoute` para ir para uma nova tela.
-   **Passagem de Dados:** Envio de dados (o ID da receita) para a nova tela através do construtor.
-   **Ciclo de Vida:** Uso do `StatefulWidget` e `initState` para disparar buscas de dados automaticamente na inicialização das telas.
-   **Arquitetura:** Refatoração da lógica de API para uma camada de **Serviço** (`Service Layer`), separando as responsabilidades do `Provider`.
-   **Provider:** Gerenciamento de múltiplos estados (`listaDeReceitas`, `receitaDetalhada`, `carregando`).
-   **Parsing de JSON Complexo:** Criação de múltiplos modelos (`ReceitaResumo`, `ReceitaDetalhada`) e lógica de `for` loop no `factory fromJson` para lidar com a lista de ingredientes da API.

## 🎬 Demonstração

![Demonstração do App de Receitas](./assets/receitas_demo.gif)