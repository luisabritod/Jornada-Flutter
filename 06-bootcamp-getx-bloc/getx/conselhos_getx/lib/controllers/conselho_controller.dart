import 'package:conselhos_getx/models/models.dart';
import 'package:conselhos_getx/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ele pede os dados para o service
// se ele entregar os dados, ele atualiza o estado (.obs, notifyListeners)
// se eles lançarem erro, o controller decide como a UI deve reagir

class ConselhoController extends GetxController {
  // o controller encontra o service que já foi resgistrado
  final ConselhoService _service = Get.find<ConselhoService>();

  // um jeito de fazer um objeto nulo ser .obs
  var conselho = Rx<ConselhoModel?>(null);
  var carregando = false.obs;

  Future<void> buscarConselho() async {
    try {
      carregando.value = true;
      // o controller agora pede para o service
      conselho.value = await _service.buscarConselho();
    } catch (e) {
      // no getX podemos usar uma snackbar para mostrar erros
      Get.snackbar(
        'Erro',
        'Não foi possível buscar um conselho: $e',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      // termina o loading
      carregando.value = false;
    }
  }
}
