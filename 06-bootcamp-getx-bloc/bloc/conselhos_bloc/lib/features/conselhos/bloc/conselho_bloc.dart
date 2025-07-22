import 'package:bloc/bloc.dart';
import 'package:conselhos_bloc/features/conselhos/models/models.dart';
import 'package:conselhos_bloc/features/conselhos/services/services.dart';
import 'package:meta/meta.dart';

part 'conselho_event.dart';
part 'conselho_state.dart';

class ConselhoBloc extends Bloc {
  final ConselhoService _conselhoService = ConselhoService();

  ConselhoBloc() : super(ConselhoInicial()) {
    on<NovoConselhoPedido>((event, emit) async {
      emit(ConselhoLoading());

      try {
        final conselho = await _conselhoService.buscarConselho();
        emit(ConselhoSucess(conselho: conselho));
      } catch (e) {
        emit(
          ConselhoError(mensagem: 'Falha ao buscar conselho. Tente novamente.'),
        );
      }
    });
  }
}
