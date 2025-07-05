# 🛍️ Vitrine de Produtos (Fake Store API)

Este projeto é o segundo do módulo de consumo de APIs e representa um passo fundamental no aprendizado: consumir uma API que retorna uma **lista de objetos complexos**.

O aplicativo se conecta à [Fake Store API](https://fakestoreapi.com/) para buscar uma lista de produtos e exibi-los em uma vitrine virtual, com foto, título e preço.

## 🎯 Funcionalidades

-   Busca uma lista de produtos da API assim que a tela é carregada (usando `initState`).
-   Exibe um indicador de carregamento enquanto os dados são buscados.
-   Renderiza a lista de produtos usando `ListView.builder` e `Card` para um layout limpo e eficiente.
-   Exibe a imagem, título e preço formatado para cada produto.
-   Layout dos textos dos cards alinhado para uma melhor experiência visual.

## 🛠️ Conceitos Técnicos Aplicados

-   **Consumo de API:** Requisição `GET` para um endpoint que retorna uma lista JSON.
-   **Parsing de JSON:** Conversão de uma `List<dynamic>` para uma `List<Produto>` usando o método `.map()` e um `factory constructor fromJson`.
-   **Modelo de Dados Aninhado:** Criação de duas classes (`Produto` e `Rating`) para representar a estrutura do JSON.
-   **Ciclo de Vida de Widget:** Uso do `StatefulWidget` e do método `initState` para iniciar uma busca de dados automaticamente.
-   **UI Dinâmica com Provider:** Gerenciamento do estado de `carregando` e da lista de `produtos` para construir a interface de forma reativa.
-   **Layout Avançado:** Uso de `Card`, `Column`, `Image.network` e `CrossAxisAlignment.stretch` para criar um layout de item de lista visualmente agradável.

## 🎬 Demonstração

![Demonstração do App Vitrine de Produtos](./assets/vitrine_demo.gif)

## 💡 Meus Aprendizados

Este projeto foi um desafio incrível que me ensinou a lidar com o tipo de dado mais comum vindo de APIs: listas. O processo de mapear a lista JSON para uma lista de objetos Dart foi o maior "a-ha!". Além disso, usar o `initState` para disparar a busca de dados me fez entender como criar apps mais proativos e inteligentes.