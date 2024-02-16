import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/search_controller.dart';
import '../widgets/recipe_card.dart';
import '../widgets/search_bar.dart';
import 'favourites_screen.dart';

class SearchScreen extends StatelessWidget {
  final SearchhController searchController = Get.put(SearchhController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Recipe Search',style: TextStyle(color: Colors.white),),
        actions: [
          GestureDetector(
              onTap: (){
                Get.to(() => FavoritesScreen());
              },
              child: Icon(Icons.favorite, color: Colors.red))
        ],
      ),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                  child: SearchhBar()),
            ],
          ),
          Obx(() => Expanded(

            child: ListView.builder(
                  itemCount: searchController.searchResults.length,
                  itemBuilder: (context, index) {
                    return RecipeCard(
                        recipe: searchController.searchResults[index]);
                  },
                ),
          )),
        ],
      ),
    );
  }
}

