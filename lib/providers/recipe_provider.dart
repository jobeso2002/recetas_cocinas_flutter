import 'package:flutter/material.dart';
import 'package:recetas_cocinas/models/recipes.dart';

class RecipeProvider with ChangeNotifier{
  List<Recipe> _recipes = [];
  List<Recipe> get recipes => _recipes;

  void addRecipe(Recipe recipe){
    _recipes.add(recipe);
    notifyListeners();
  }

  List<Recipe> get favoriteRecipes => _recipes.where((recipe) => recipe.isFavorite).toList();


  void deleteRecipe(String id){
    _recipes.removeWhere((recipe) => recipe.id == id);
    notifyListeners();
  }

  void updateRecipe(String id, String newtitle, String newdescription, List<String> newingredients, String newimageUrl){
    final updateindex = _recipes.indexWhere((recipe) => recipe.id == id);
    if(updateindex != -1){
      _recipes[updateindex] = Recipe(
        id: id,
        title: newtitle,
        description: newdescription,
        ingredients: newingredients,
        imageUrl: newimageUrl,
        isFavorite: _recipes[updateindex].isFavorite,
      );
      notifyListeners();
    }
  }


  void toggleFavorite(String id){
    final index = _recipes.indexWhere((recipe)=> recipe.id == id);
    if(index != -1){
      _recipes[index].isFavorite = !_recipes[index].isFavorite;
      notifyListeners();
    }
  }
  
}