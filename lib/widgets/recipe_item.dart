import 'package:flutter/material.dart';
import 'package:recetas_cocinas/models/recipes.dart';

class RecipeItem extends StatelessWidget {
  final Recipe recipe;
  const RecipeItem({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(recipe.imageUrl),
        ),
        title: Text(recipe.title),
        subtitle: Text(recipe.description),
        trailing: IconButton(
          icon: Icon(recipe.isFavorite ? Icons.favorite_border_outlined : Icons.favorite_border_outlined, color: recipe.isFavorite ? Colors.red : null),
          onPressed: () {
            // Aquí podrías llamar a un método del provider para cambiar el estado de favorito
          },
        ),
      ),
    );
  }
}