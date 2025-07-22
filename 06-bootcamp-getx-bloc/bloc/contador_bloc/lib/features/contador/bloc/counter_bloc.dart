// usando a analogia do restaurante o CounterBloc é o cerébro de tudo, o chef
// ele vai ouvir as comandas e preparar os pratos
// o CounterEvents são as comandas
// o CounterState são os pratos

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  // definimos o estado inicial do nosso app: um contador com valor 0
  CounterBloc() : super(const CounterState(value: 0)) {
    //para cada evento, a gente define o que fazer
    on<IncrementPressed>((event, emit) {
      // quando o evento 'IncrementarPressed' chegar, vai ser emitido um novo estado com o valor atual em +1
      emit(CounterState(value: state.value + 1));
    });

    on<DecrementPressed>((event, emit) {
      if (state.value > 0) {
        emit(CounterState(value: state.value - 1));
      }
    });

    on<ResetPressed>((event, emit) {
      emit(CounterState(value: 0));
    });
  }
}
