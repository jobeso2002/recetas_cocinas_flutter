import 'package:flutter/material.dart';
import 'package:recetas_cocinas/screens/recipes_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplicacion de recetas',
      debugShowCheckedModeBanner: false,
      home: RecipesList()
    );
  }
}
