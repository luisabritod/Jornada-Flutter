import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:loja_getx_firebase/features/carrinho/models/item_carrinho_model.dart';

class CarrinhoService {
  final CollectionReference _carrinhoCollection = FirebaseFirestore.instance
      .collection('carrinho');

  Stream<QuerySnapshot> getCarrinhoSteam() {
    return _carrinhoCollection.snapshots();
  }

  Future<void> adicionarItem(ItemCarrinho item) async {}

  Future<void> removerItem(String itemId) async {}
}
