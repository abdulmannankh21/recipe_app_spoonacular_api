import 'package:get/get.dart';
import '../models/recipe_model.dart';
import '../databases/favorites_database.dart';

class FavoritesController extends GetxController {
  RxList<RecipeModel> favoriteRecipes = <RecipeModel>[].obs;

  void toggleFavorite(RecipeModel recipe) {
    if (isRecipeFavorite(recipe)) {
      favoriteRecipes.remove(recipe);
    } else {
      favoriteRecipes.add(recipe);
    }
  }

  bool isRecipeFavorite(RecipeModel recipe) {
    return favoriteRecipes.contains(recipe);
  }
}
