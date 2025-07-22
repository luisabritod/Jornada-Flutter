import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vitrine_getx/models/models.dart';
import 'package:vitrine_getx/services/services.dart';

class VitrineController extends GetxController {
  final VitrineService _service = Get.find<VitrineService>();

  var produtos = <Produto>[].obs;
  var carregando = false.obs;

  @override
  void onInit() {
    super.onInit(); // É uma boa prática chamar o onInit da classe mãe
    buscarProdutos(); // Chamando nosso método para buscar os produtos
  }

  Future<void> buscarProdutos() async {
    try {
      carregando.value = true;

      final novaListaDeProdutos = await _service.buscarProdutos();

      produtos.assignAll(novaListaDeProdutos);
    } catch (e) {
      Get.snackbar(
        'Erro',
        'Não foi possível buscar o produto: $e',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      carregando.value = false;
    }
  }
}
