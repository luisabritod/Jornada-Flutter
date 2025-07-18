# 🗺️ 05 - Navegação e Múltiplas Telas

Este módulo representa a transição de aplicativos de página única para experiências de usuário com múltiplos fluxos. O foco foi aprender a gerenciar a "pilha" de telas e a passar informações entre elas.

## 📂 Projetos Desenvolvidos

### 1. **Guia Culinário (App de Receitas)**
Um aplicativo completo que consome uma API de receitas para demonstrar um fluxo de navegação comum: de uma tela de lista (`HomePage`) para uma tela de detalhes (`DetalhesPage`).

* **[➡️ Ver Detalhes e Código do App de Receitas](./receitas_app/README.md)**

## ✅ Principais Conceitos Abordados no Módulo

-   `Navigator.push` e `MaterialPageRoute`
-   Criação de `Stateless` e `Stateful Widgets` para diferentes telas
-   Passagem de dados entre telas via construtores
-   Uso do `initState` para carregar dados específicos de uma tela
-   Refatoração para uma camada de Serviços (`Service Layer`) para organizar a lógica de API.