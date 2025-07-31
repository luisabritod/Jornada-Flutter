import 'package:get/get.dart';
import 'package:loja_getx_firebase/features/carrinho/models/item_carrinho_model.dart';
import 'package:loja_getx_firebase/features/carrinho/services/carrinho_service.dart';
import 'package:loja_getx_firebase/features/produtos/models/produto_model.dart';

class CarrinhoController extends GetxController {
  final CarrinhoService _service = Get.find<CarrinhoService>();

  var itens = <ItemCarrinho>[].obs;

  Future<void> adicionarItem(Produto produto) async {
    // 1. procuramos na lista de itens se já existe um com o mesmo ID
    // indexWhere(...) -> procura na lista e te retorna o índice(a posição) do primeiro item que satisfaz a condição, se não encontrar ninguém ele retorna -1
    final index = itens.indexWhere((item) => item.id == produto.id.toString());

    if (index >= 0) {
      itens[index].quantity++;
    } else {
      itens.add(ItemCarrinho.fromProduto(produto));
    }
  }

  Future<void> removerItem() async {}
}
