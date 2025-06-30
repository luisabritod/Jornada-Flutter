# 🚀 02 - Gerenciamento de Estado com Provider

Bem-vindo(a) ao meu laboratório de estudos sobre Gerenciamento de Estado em Flutter!

Neste módulo, explorei o pacote `provider`, uma das ferramentas mais populares e recomendadas para gerenciar o estado de um aplicativo de forma eficiente e organizada. Para solidificar o conhecimento, desenvolvi dois pequenos aplicativos, cada um focado em um tipo diferente de dado de estado.

---

## 📂 Projetos Desenvolvidos

### 1. **App Contador**
Um aplicativo clássico para entender os fundamentos do Provider, gerenciando um simples estado numérico (`int`). Nele, implementei funcionalidades de incrementar, decrementar, zerar...

* **[➡️ Ver Detalhes e Código do App Contador](./contador_app/README.md)**

### 2. **Gerador de Cores Aleatórias (Color Magic)**
Uma evolução do conceito, onde o estado gerenciado é um objeto mais complexo (`Color`). Este projeto foi focado em como a UI pode reagir de formas visuais e criativas às mudanças de estado.

* **[➡️ Ver Detalhes e Código do App Gerador de Cores](./color_magic_app/README.md)**

---

## ✅ Principais Conceitos Abordados no Módulo

-   O padrão `Provider` (`ChangeNotifier`, `ChangeNotifierProvider`, `Consumer`).
-   A diferença entre `Consumer` (para ouvir) e `Provider.of(context, listen: false)` (para agir).
-   Criação de UI dinâmica que reage a diferentes tipos de estado (`int`, `Color`).
-   Organização de lógica de negócio (`Provider`) separada da lógica de apresentação (`Widget`).