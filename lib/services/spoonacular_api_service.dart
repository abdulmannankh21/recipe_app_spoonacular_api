import 'package:dio/dio.dart';
import '../models/recipe_model.dart';

class SpoonacularApiService {
  final Dio _dio = Dio();
  final String _apiKey =
      '1f9d617ba13041859ea773423b0e6291'; // Replace with your Spoonacular API key

  Future<List<RecipeModel>> searchRecipes(String query) async {
    try {
      final response = await _dio.get(
        'https://api.spoonacular.com/recipes/complexSearch',
        queryParameters: {
          'query': query,
          'maxFat': '30',
          'number': '10',
          'apiKey': _apiKey,
        },
      );

      List<RecipeModel> recipes = (response.data['results'] as List)
          .map((json) => RecipeModel.fromJson(json))
          .toList();

      return recipes;
    } catch (e) {
      throw Exception('Failed to fetch recipes: $e');
    }
  }
}
