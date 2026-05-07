import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recetas_cocinas/providers/recipe_provider.dart';
import 'package:recetas_cocinas/screens/recipes_list.dart';
import 'package:recetas_cocinas/themes/theme.dart';

void main() => runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => RecipeProvider()),
        ],
        child: MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplicacion de recetas',
      theme: AppTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      home: RecipesList(),
    );
  }
}