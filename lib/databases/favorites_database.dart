import 'package:get_storage/get_storage.dart';
import '../models/recipe_model.dart';

class FavoritesDatabase {
final GetStorage _storage = GetStorage();
final String _favoritesKey = 'favorites';

List<RecipeModel> getFavoriteRecipes() {
final List<dynamic> storedFavorites = _storage.read(_favoritesKey) ?? [];
return storedFavorites.map((data) => RecipeModel.fromJson(data)).toList();
}

void saveFavoriteRecipe(RecipeModel recipe) {
List<dynamic> storedFavorites = _storage.read(_favoritesKey) ?? [];
storedFavorites.add(recipe.toJson());
_storage.write(_favoritesKey, storedFavorites);
}
}
