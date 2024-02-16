class RecipeModel {
  final int id;
  final String title;
  final String image;
  final String imageType;

  RecipeModel({
    required this.id,
    required this.title,
    required this.image,
    required this.imageType,
  });

// Factory method to create a RecipeModel instance from JSON data
  factory RecipeModel.fromJson(Map<String, dynamic> json) {
    return RecipeModel(
      id: json['id'],
      title: json['title'],
      image: json['image'],
      imageType: json['imageType'],
    );
  }

// Convert RecipeModel instance to JSON data
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'image': image,
      'imageType': imageType,
    };
  }
}
