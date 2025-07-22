class Conselho {
  final int id;
  final String texto;

  Conselho({required this.id, required this.texto});

  factory Conselho.fromJson(Map<String, dynamic> json) {
    return Conselho(id: json['slip']['id'], texto: json['slip']['advice']);
  }
}
