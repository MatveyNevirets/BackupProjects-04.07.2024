import 'dart:async';

import 'package:flutter/material.dart';
import 'package:repeat_it/DialogWindows/CreateNewCategoryDialog.dart';
import 'package:repeat_it/Entities/%D0%A1ategory.dart';
import 'package:repeat_it/Models/CategoriesScreenModel.dart';
import 'package:repeat_it/UI/CategoriesScreenUI.dart';

class CategoriesScreen extends StatelessWidget {
  late final CategoriesScreenModel categoriesScreenModel =
      CategoriesScreenModel();

  var sup_controller = new StreamController<Category>.broadcast();

  List<Category> getCategories() {
    return categoriesScreenModel.categories;
  }

  void addCategory(Category newCategory) {
    categoriesScreenModel.AddCategory(newCategory);
    print("Success!");
  }

  void showCreateNewCategoryDialog(BuildContext context)
  {
    showDialog(context: context, builder: (BuildContext context)
    {
      return CreateNewCategoryDialog();
    });
  }

  @override
  Widget build(BuildContext context) {
    return CategoriesScreenUI(categories: getCategories());
  }
}
