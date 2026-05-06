import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recetas_cocinas/providers/recipe_provider.dart';
import 'package:recetas_cocinas/widgets/recipe_item.dart';

class RecipesList extends StatelessWidget {
  const RecipesList({super.key});

  @override
  Widget build(BuildContext context) {
    final recipeProvider = Provider.of<RecipeProvider>(context);
    final recipes = recipeProvider.recipes;
    return Scaffold(
      appBar: AppBar(title: const Text('Recetas de cocina 🍱')),
      body: recipes.isEmpty
          ? const Center(child: Text('No hay recetas disponibles. añade alguna!'))
          : ListView.builder(
              itemCount: recipes.length,
              itemBuilder: (context, index) {
                return RecipeItem(recipe: recipes[index]);
              },
            ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {},
      //   child: const Icon(Icons.add),
      // ),
    );
  }
}
