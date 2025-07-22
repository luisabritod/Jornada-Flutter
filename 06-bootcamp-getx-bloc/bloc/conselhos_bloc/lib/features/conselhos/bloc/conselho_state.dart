part of 'conselho_bloc.dart';

@immutable
abstract class ConselhoState {}

class ConselhoInicial extends ConselhoState {}

class ConselhoLoading extends ConselhoState {}

class ConselhoSucess extends ConselhoState {
  final Conselho conselho;

  ConselhoSucess({required this.conselho});
}

class ConselhoError extends ConselhoState {
  final String mensagem;

  ConselhoError({required this.mensagem});
}
