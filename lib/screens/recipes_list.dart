import 'package:flutter/material.dart';

class RecipesList extends StatelessWidget {
  const RecipesList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Recetas de cocina 🍱')),
      body: const Center(child: Text('aqui van la lista de recetas')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
