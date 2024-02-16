import 'package:get/get.dart';
import '../models/recipe_model.dart';
import '../services/spoonacular_api_service.dart';

class SearchhController extends GetxController {
  RxList<RecipeModel> searchResults = <RecipeModel>[].obs;

  void searchRecipes(String query) async {
    try {
// Make the API call to fetch recipes based on the query
      List<RecipeModel> recipes =
          await SpoonacularApiService().searchRecipes(query);

// Update the searchResults with the obtained recipes
      searchResults.assignAll(recipes);
    } catch (e) {
// Handle errors, e.g., show an error message to the user
      print('Error fetching recipes: $e');
    }
  }
}
