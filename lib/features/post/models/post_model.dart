class PostModel {
  final String text;
  final String? imageUrl;

  PostModel({
    required this.text,
    this.imageUrl,
  });

  PostModel.fromJson(Map<String, dynamic> json)
      : text = json['text'],
        imageUrl = json['imageUrl'];

  Map<String, dynamic> toJson() {
    return {
      'text': text,
      'imageUrl': imageUrl,
    };
  }
}
