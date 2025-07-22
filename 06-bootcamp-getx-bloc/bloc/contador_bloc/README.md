# 🧱 App Contador com BLoC

Este projeto finaliza o bootcamp de Gerenciamento de Estado, implementando o app contador com a arquitetura **BLoC (Business Logic Component)**.

O objetivo foi entender o fluxo de trabalho baseado em Eventos e Estados, que promove uma separação total entre a lógica de negócio e a interface do usuário, resultando em um código altamente testável e escalável.

## 🏛️ Arquitetura BLoC Aplicada

-   **Eventos:** Ações do usuário (`IncrementPressed`, `DecrementPressed`, `ResetPressed`) são modeladas como classes que herdam de um `CounterEvent` abstrato.
-   **Estados:** O estado da UI (`CounterState`) é modelado como uma classe imutável que contém os dados necessários para a tela se reconstruir.
-   **BLoC:** A classe `CounterBloc` recebe os `Eventos`, processa a lógica de negócio e `emite` novos `Estados`.

## 🛠️ Conceitos de `flutter_bloc`

-   **`BlocProvider`**: Para "disponibilizar" a instância do `CounterBloc` para a árvore de widgets.
-   **`BlocBuilder`**: Para "ouvir" as mudanças de `Estado` e reconstruir a UI de forma eficiente.
-   **`context.read<CounterBloc>().add()`**: Para "enviar" `Eventos` da UI para o BLoC.

## 🎬 Demonstração

![Demonstração do App Contador com BLoC](./assets/contador_bloc_demo.gif)