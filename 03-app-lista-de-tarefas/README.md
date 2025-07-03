# ✅ 03 - App To-Do List (Projeto Completo)

Este é o primeiro projeto completo da minha jornada, onde todos os conceitos aprendidos nos módulos anteriores (Programação Orientada a Objetos e Gerenciamento de Estado com Provider) foram aplicados juntos para criar um aplicativo funcional com um ciclo de vida de dados completo.

Este aplicativo de Lista de Tarefas (To-Do List) permite ao usuário gerenciar suas atividades diárias de forma simples e intuitiva.

## 🎯 Funcionalidades

- [x] **Adicionar** novas tarefas através de uma caixa de diálogo (`AlertDialog`).
- [x] **Exibir** a lista de tarefas em tempo real.
- [x] **Atualizar** tarefas, marcando-as como concluídas (e desmarcando), com feedback visual de texto riscado.
- [x] **Remover** tarefas da lista.

## 🛠️ Conceitos Técnicos Aplicados

- **POO:** Criação de um modelo de dados (`class Tarefa`) para representar o estado de cada item.
- **Provider:** Gerenciamento centralizado de uma lista de objetos (`List<Tarefa>`) no `TarefasProvider`.
- **CRUD Completo:** Implementação de todas as operações de Criar, Ler, Atualizar e Deletar (Create, Read, Update, Delete).
- **UI Dinâmica:** Uso de `ListView.builder` para construir a lista e `Consumer` para reconstruir a UI de forma eficiente após cada mudança de estado.
- **Widgets:** Utilização de `AlertDialog`, `TextField`, `Checkbox`, `IconButton` e `ListTile` para criar uma interface de usuário interativa.

## 🎬 Demonstração

![Demonstração do App To-Do List](./to_do_app/assets/to_do_demo.gif)

## 💡 Meus Aprendizados

Este projeto foi um grande passo. Conectar todas as peças - o modelo de dados, o provider que gerencia a lista e as diferentes ações da UI (adicionar, marcar, deletar) - foi desafiador, mas incrivelmente recompensador. Ver a lista reagir a cada ação em tempo real solidificou meu entendimento sobre como o estado e a interface conversam no Flutter. Sinto que agora tenho uma base sólida para criar aplicativos mais complexos.