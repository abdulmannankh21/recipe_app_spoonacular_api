import 'package:flutter/material.dart';
import 'package:recipe_test/screens/recipe_details_screen.dart';
import 'package:recipe_test/screens/search_screen.dart';
import 'package:get/get.dart';
import 'controllers/favourites_controller.dart';

void main() {
  Get.put(FavoritesController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/',
      routes: {
    '/': (context) => SearchScreen(),
    '/recipe_details': (context) => RecipeDetailsScreen(),
    },    );
  }
}