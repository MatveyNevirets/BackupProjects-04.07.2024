import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:repeat_it/Models/CategoriesScreenModel.dart';
import 'package:repeat_it/Screens/CategoriesScreen.dart';

class RepeatItApp extends StatelessWidget {
  late CategoriesScreenModel categoriesScreenModel;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
      routes: {
        "/": (context) => CategoriesScreen(),
      },
    );
  }
}
