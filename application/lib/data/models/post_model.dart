class PostModel {
  final int id;
  final String texto;
  final String imagem;

  PostModel({
    required this.id,
    required this.texto,
    required this.imagem,
  });

  factory PostModel.fromMap(Map<String, dynamic> map) {
    return PostModel(
      id: map['id'] ?? '',
      texto: map['texto'],
      imagem: map['imagem'],
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'texto': texto,
      'imagem': imagem,
    };
  }
}