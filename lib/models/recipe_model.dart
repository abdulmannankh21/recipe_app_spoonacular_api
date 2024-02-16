class RecipeModel {
  final int id;
  final String title;
  final String image;
  final String imageType;
  final Nutrition nutrition;

  RecipeModel({
    required this.id,
    required this.title,
    required this.image,
    required this.imageType,
    required this.nutrition,
  });

// Factory method to create a RecipeModel instance from JSON data
  factory RecipeModel.fromJson(Map<String, dynamic> json) {
    return RecipeModel(
      id: json['id'],
      title: json['title'],
      image: json['image'],
      imageType: json['imageType'],
      nutrition: Nutrition.fromJson(json['nutrition']),
    );
  }

// Convert RecipeModel instance to JSON data
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'image': image,
      'imageType': imageType,
      'nutrition': nutrition.toJson(),
    };
  }
}

class Nutrition {
  final List<Nutrient> nutrients;

  Nutrition({required this.nutrients});

  factory Nutrition.fromJson(Map<String, dynamic> json) {
    return Nutrition(
      nutrients: (json['nutrients'] as List)
          .map((nutrientJson) => Nutrient.fromJson(nutrientJson))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'nutrients': nutrients.map((nutrient) => nutrient.toJson()).toList(),
    };
  }
}

class Nutrient {
  final String name;
  final double amount;
  final String unit;

  Nutrient({required this.name, required this.amount, required this.unit});

  factory Nutrient.fromJson(Map<String, dynamic> json) {
    return Nutrient(
      name: json['name'],
      amount: json['amount'],
      unit: json['unit'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'amount': amount,
      'unit': unit,
    };
  }
}
