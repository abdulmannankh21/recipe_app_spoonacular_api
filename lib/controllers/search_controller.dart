import 'package:get/get.dart';
import '../models/recipe_model.dart';
import '../services/spoonacular_api_service.dart';

class SearchhController extends GetxController {
  RxList<RecipeModel> searchResults = <RecipeModel>[].obs;

  void searchRecipes(String query) async {
    try {
      List<RecipeModel> recipes =
          await SpoonacularApiService().searchRecipes(query);

      searchResults.assignAll(recipes);
    } catch (e) {
      print('Error fetching recipes: $e');
    }
  }
}
