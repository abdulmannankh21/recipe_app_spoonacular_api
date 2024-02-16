import 'package:flutter/material.dart';
import '../models/recipe_model.dart';

class RecipeDetailsScreen extends StatelessWidget {
  RecipeDetailsScreen();

  @override
  Widget build(BuildContext context) {
    final RecipeModel? recipe =
    ModalRoute.of(context)!.settings.arguments as RecipeModel?;

    if (recipe == null) {
      // Handle the case where recipe is null, you might want to display an error message or navigate back.
      return Scaffold(
        body: Center(
          child: Text('Recipe details not available.'),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          recipe.title ?? 'Recipe Details',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 300,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: NetworkImage(
                    recipe.image,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Recipe ID: ${recipe.id}',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Ingredients:',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (recipe.nutrition != null && recipe.nutrition.nutrients != null)
                  for (Nutrient nutrient in recipe.nutrition.nutrients!)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('- ${nutrient.name}'),
                        Text('Amount: ${nutrient.amount}'),
                        Text('Unit: ${nutrient.unit}'),
                      ],
                    ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
