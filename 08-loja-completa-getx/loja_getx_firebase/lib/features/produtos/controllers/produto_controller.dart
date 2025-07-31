import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loja_getx_firebase/features/produtos/models/produto_model.dart';
import 'package:loja_getx_firebase/features/produtos/services/produto_service.dart';

class ProdutoController extends GetxController {
  final ProdutoService _service = Get.find<ProdutoService>();

  var produtos = <Produto>[].obs;
  var carregando = false.obs;

  @override
  void onInit() {
    super.onInit();
    buscarProdutos();
  }

  Future<void> buscarProdutos() async {
    try {
      carregando.value = true;

      final novaListaDeProdutos = await _service.buscarProdutos();

      produtos.assignAll(novaListaDeProdutos);
    } catch (e) {
      Get.snackbar(
        'Erro',
        'Não foi possivel buscar o produto: $e',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      carregando.value = false;
    }
  }
}
