import 'package:flutter/material.dart';
import '../components/components.dart';
import '../models/models.dart';
import '../api/mock_fooderlich_service.dart';

class RecipeScreen extends StatelessWidget {
  RecipeScreen({super.key});

  final mockFooderlichService = MockFooderlichService();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<SimpleRecipe>>(
        future: mockFooderlichService.getRecipes(),
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.done){
            final recipes = snapshot.data?? [];
          return RecipesGridView(recipes: recipes);
          }else{

          }
          return Center(child: CircularProgressIndicator());
        });
  }
}
