import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/search_controller.dart';

class SearchhBar extends StatelessWidget {
  final SearchhController searchController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          style: TextStyle(color: Colors.white),
          onChanged: (value) => searchController.searchRecipes(value),
          decoration: InputDecoration(
            border: InputBorder.none,
            prefixIconColor: Colors.white,
            hintText: 'Search recipes...',
            prefixIcon: Icon(Icons.search),
          ),
        ),
      ),
    );
  }
}
