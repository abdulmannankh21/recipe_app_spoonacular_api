import 'package:flutter/material.dart';
import '../controllers/favourites_controller.dart';
import '../models/recipe_model.dart';
import 'package:get/get.dart';

class RecipeCard extends StatelessWidget {
  final RecipeModel recipe;
  final FavoritesController favoritesController = Get.find();

  RecipeCard({required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(recipe.title),
        onTap: () =>
            Navigator.pushNamed(context, '/recipe_details', arguments: recipe),
        trailing: Obx(() {
          return IconButton(
            icon: favoritesController.isRecipeFavorite(recipe)
                ? Icon(Icons.favorite, color: Colors.red)
                : Icon(Icons.favorite_border),
            onPressed: () => favoritesController.toggleFavorite(recipe),
          );
        }),
      ),
    );
  }
}
