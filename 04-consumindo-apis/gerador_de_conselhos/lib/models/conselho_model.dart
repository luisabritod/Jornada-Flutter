class ConselhoModel {
  final int id;
  final String texto;

  ConselhoModel({required this.id, required this.texto});

  factory ConselhoModel.fromJson(Map<String, dynamic> json) {
    return ConselhoModel(id: json['slip']['id'], texto: json['slip']['advice']);
  }
}
