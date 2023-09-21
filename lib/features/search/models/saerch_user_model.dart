class SearchUserModel {
  final String name;
  final String description;

  SearchUserModel({
    required this.name,
    required this.description,
  });

  SearchUserModel.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        description = json['description'];

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
    };
  }
}
