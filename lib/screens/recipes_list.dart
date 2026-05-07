import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recetas_cocinas/providers/recipe_provider.dart';
import 'package:recetas_cocinas/screens/add_recipe.dart';
import 'package:recetas_cocinas/widgets/recipe_item.dart';

class RecipesList extends StatefulWidget {
  const RecipesList({super.key});

  @override
  State<RecipesList> createState() => _RecipesListState();
}

class _RecipesListState extends State<RecipesList> {
  bool _showFavoritesOnly = false;
  String _searchQuery = '';

  @override
  Widget build(BuildContext context) {
    final recipeProvider = Provider.of<RecipeProvider>(context);
    final recipes = _showFavoritesOnly ? recipeProvider.favoriteRecipes : recipeProvider.recipes.where((recipe){
    
    final lowerQuery = _searchQuery.toLowerCase();
    return recipe.title.toLowerCase().contains(lowerQuery) || recipe.ingredients.any((ingredient) => ingredient.toLowerCase().contains(lowerQuery));

    }).toList();
    
    
    
    return Scaffold(
      appBar: AppBar(title: const Text('Recetas de cocina 🍱'),
      
      actions: [
          IconButton(
            icon: Icon(_showFavoritesOnly ? Icons.favorite : Icons.favorite_border),
            onPressed: () {
              setState(() {
                _showFavoritesOnly = !_showFavoritesOnly;
              });
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: const InputDecoration(
                labelText: 'Buscar recetas...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              onChanged: (query) {
                setState(() {
                  _searchQuery = query;
                });
              },
            ),
          ),
          Expanded(
            child: recipes.isEmpty
                ? const Center(child: Text('No se encontraron recetas'))
                : ListView.builder(
                    itemCount: recipes.length,
                    itemBuilder: (context, index) {
                      return RecipeItem(recipe: recipes[index]);
                    },
                  ),
          ),

      ],),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => const AddRecipeScreen()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
