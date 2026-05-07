import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recetas_cocinas/models/recipes.dart';
import 'package:recetas_cocinas/providers/recipe_provider.dart';
import 'package:share_plus/share_plus.dart';

class RecipeItem extends StatelessWidget {
  final Recipe recipe;
  const RecipeItem({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    final recipeProvider = Provider.of<RecipeProvider>(context);

    return Card(
      margin: const EdgeInsets.all(8.0),
      child: ListTile(
        leading: CircleAvatar(backgroundImage: NetworkImage(recipe.imageUrl)),
        title: Text(recipe.title),
        subtitle: Text(recipe.description),
        trailing: Wrap(
          children: [
            IconButton(
              icon: Icon(
                recipe.isFavorite
                    ? Icons.favorite_border_outlined
                    : Icons.favorite_border_outlined,
                color: recipe.isFavorite ? Colors.red : null,
              ),
              onPressed: () {
                // Aquí podrías llamar a un método del provider para cambiar el estado de favorito
                recipeProvider.toggleFavorite(recipe.id);
              },
            ),
            IconButton(onPressed: (){
              Share.share(
                '¡Mira esta receta de ${recipe.title}!\n\nDescripción:\n${recipe.description}\n\nIngredientes:\n${recipe.ingredients.join('\n')}\n\n¡Pruébala y disfruta de una deliciosa comida! 🍽️',
              );
            }, 
            icon: const Icon(Icons.share)),
            IconButton(onPressed: (){
              recipeProvider.deleteRecipe(recipe.id);
            }, 
            icon: const Icon(Icons.delete, color: Colors.red,)),

          ],
        ),
      ),
    );
  }
}
