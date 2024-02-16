import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/favourites_controller.dart';
import '../models/recipe_model.dart';
import '../widgets/recipe_card.dart';

class FavoritesScreen extends StatelessWidget {
  final FavoritesController favoritesController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Favorite Recipes'),
      ),
      body: Obx(
            () {
          if (favoritesController.favoriteRecipes.isEmpty) {
            return Center(
              child: Text('No favorite recipes yet!',
                style: TextStyle(color: Colors.white),),
            );
          }

          return Expanded(
              child: ListView.builder(
                itemCount: favoritesController.favoriteRecipes.length,
                itemBuilder: (context, index) {
                  RecipeModel recipe = favoritesController
                      .favoriteRecipes[index];

                  return RecipeCard(
                      recipe: favoritesController.favoriteRecipes[index]);
                },
              ));
        },
      ),
    );
  }
}