import 'package:get/get.dart';

class ContadorController extends GetxController {
  // .obs torna a variável öbservável"
  var contador = 0.obs;

  void incrementar() {
    // para acessar ou modificar o valor de uma variável .obs, usa-se a propriedade .value
    contador.value++;
  }
}
