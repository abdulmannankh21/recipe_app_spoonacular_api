import 'package:flutter/material.dart';
import '../models/recipe_model.dart';

class RecipeDetailsScreen extends StatelessWidget {

  RecipeDetailsScreen();

  @override
  Widget build(BuildContext context) {
    final RecipeModel? recipe = ModalRoute.of(context)!.settings.arguments as RecipeModel?;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(recipe!.title ?? 'Recipe Details',
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
                image: DecorationImage(image: NetworkImage(
                  recipe.image,
                ),
                fit: BoxFit.cover
                ),
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Recipe ID: ${recipe.id}',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold,color: Colors.white),
            ),
            SizedBox(height: 16.0),
            Text(
              'No more data against the Api response',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold,color: Colors.white),
            ),
            // Column(
            //   crossAxisAlignment: CrossAxisAlignment.start,
            //   children: [
            //     for (String ingredient in recipe.ingredients)
            //       Text('- $ingredient'),
            //   ],
            // ),
            // SizedBox(height: 16.0),
            // Text(
            //   'Instructions:',
            //   style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            // ),
            // Column(
            //   crossAxisAlignment: CrossAxisAlignment.start,
            //   children: [
            //     for (String instruction in recipe.instructions)
            //       Text('- $instruction'),
            //   ],
            // ),
            // SizedBox(height: 16.0),
            // Text(
            //   'Nutritional Facts:',
            //   style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            // ),
            // Text(recipe.nutritionalFacts.toString()),
          ],
        ),
      ),
    );
  }
}
