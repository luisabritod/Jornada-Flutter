import 'package:gerador_de_conselhos/models/conselho_model.dart';

class ConselhoProvider {
  ConselhoModel? _conselho;
  bool _carregando = false;

  ConselhoModel? get conselho => _conselho;
  bool get carregando => _carregando;
}
