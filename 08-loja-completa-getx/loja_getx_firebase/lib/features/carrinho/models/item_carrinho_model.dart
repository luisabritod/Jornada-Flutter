import 'package:loja_getx_firebase/features/produtos/models/produto_model.dart';

class ItemCarrinho {
  final String id;
  final String title;
  final double price;
  final String image;
  int quantity;

  ItemCarrinho({
    required this.id,
    required this.title,
    required this.price,
    required this.image,
    required this.quantity,
  });

  // constrói um ItemCarrinho a partir de um produto
  factory ItemCarrinho.fromProduto(Produto produto) {
    return ItemCarrinho(
      id: produto.id.toString(),
      title: produto.title,
      price: produto.price,
      image: produto.image,
      quantity: 1,
    );
  }
}
