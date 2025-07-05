# 🌐 04 - Conectando o App com a Internet (Consumo de APIs)

Bem-vindo(a) ao módulo onde meus aplicativos aprendem a "conversar" com o mundo!

O objetivo aqui é praticar o consumo de APIs REST para buscar dados externos e exibi-los na interface do usuário. Cada projeto neste módulo se conectará a uma API pública diferente para reforçar os conceitos de programação assíncrona, parsing de JSON e gerenciamento de estado de requisição.

---

## 📂 Projetos Desenvolvidos

### 1. **Gerador de Conselhos**
Um aplicativo simples para praticar o ciclo completo de uma requisição `GET`: fazer o pedido, mostrar um estado de carregamento, tratar a resposta (JSON) e exibir o dado na tela.

* **[➡️ Ver Detalhes e Código do App Gerador de Conselhos](./gerador_de_conselhos/README.md)**

### 2. **Vitrine de Produtos (Fake Store)**
Um projeto mais complexo para treinar a manipulação de uma **lista de objetos** retornada por uma API. O foco foi em como "parsear" (analisar) uma lista de JSON e construir uma UI dinâmica com `ListView.builder` e `Card` para exibir os produtos.

* **[➡️ Ver Detalhes e Código do App Vitrine de Produtos](./vitrine_app/README.md)**

---

## ✅ Principais Conceitos Abordados no Módulo

-   Pacote `http` para requisições
-   Programação Assíncrona com `async / await` e `Future`
-   Parsing de `JSON` com `jsonDecode` e `factory constructors` (incluindo objetos aninhados)
-   Manipulação de listas de dados (`List<dynamic>`) vindas de uma API
-   Tratamento de erros com `try-catch-finally`
-   Gerenciamento de estado de requisição (loading, data, error)
-   Configuração de permissões de plataforma (iOS `Info.plist`)