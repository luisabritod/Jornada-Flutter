import 'package:flutter/material.dart';
import 'package:receitas_app/models/models.dart';
import 'package:receitas_app/services/services.dart';

class ReceitasProvider extends ChangeNotifier {
  List<ReceitaResumo> _receitas = [];
  bool _carregando = false;
  ReceitaDetalhada? _receitaDetalhada;

  final ReceitasService _service = ReceitasService();

  List<ReceitaResumo> get receitas => _receitas;
  bool get carregando => _carregando;
  ReceitaDetalhada? get receitaDetalhada => _receitaDetalhada;

  Future<void> buscarReceitas() async {
    _carregando = true;
    notifyListeners();

    try {
      _receitas = await _service.buscarReceitas();
    } catch (e) {
      print('Erro no provider ao buscar receitas: $e');
    } finally {
      _carregando = false;
      notifyListeners();
    }
  }

  Future<void> buscarDetalhesDaReceita(String id) async {
    _carregando = true;
    notifyListeners();

    try {
      _receitaDetalhada = await _service.buscarDetalhesDaReceita(id);
    } catch (e) {
      print('Erro no provider ao buscar receitas: $e');
    } finally {
      _carregando = false;
      notifyListeners();
    }
  }
}
