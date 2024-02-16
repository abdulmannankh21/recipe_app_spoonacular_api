import 'package:dio/dio.dart';
import '../models/recipe_model.dart';
import 'package:get/get.dart';

class SpoonacularApiService {
  final Dio _dio = Dio();
  final String _apiKey = '1f9d617ba13041859ea773423b0e6291';

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

      if (response.statusCode == 200) {
        // Successful response, parse and return recipes
        List<RecipeModel> recipes = (response.data['results'] as List)
            .map((json) => RecipeModel.fromJson(json))
            .toList();

        return recipes;
      } else if (response.statusCode == 402) {
        // Handle Payment Required status
        Get.snackbar(
          "Today Limit",
          '${response.statusMessage}',
        );
        // You might want to return an empty list or handle this case accordingly
        return [];
      } else {
        // Handle other non-successful status codes
        throw Exception('Failed to fetch recipes. Status code: ${response.statusCode}');
      }
    } catch (e) {
      // Handle Dio errors or other exceptions
      throw Exception('Failed to fetch recipes: $e');
    }
  }
}
