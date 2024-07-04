import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:repeat_it/Screens/CategoriesScreen.dart';
import 'package:repeat_it/UI/CategoriesScreenUI.dart';
import 'package:toast/toast.dart';

import '../Entities/Сategory.dart';

class CreateNewCategoryDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    CategoriesScreen categoriesScreen = CategoriesScreen();
   // CategoriesScreenUI categoriesScreenUI = CategoriesScreenUI(categories: categoriesScreen.getCategories());

    return Dialog(
      //insetPadding: EdgeInsets.symmetric(horizontal: 30, vertical: 280),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Wrap(
        children: [
          Container(
            margin: EdgeInsets.all(20),
            child: Column(
              children: <Widget>[
                Text("Название категории", style: TextStyle(fontSize: 16)),
                SizedBox(height: 10,),
                Container(
                  child: TextField(
                    controller: controller, cursorColor: Colors.red[400],
                  ),
                  padding: EdgeInsets.only(left: 20, right: 20),
                ),
                SizedBox(height: 10,),
                TextButton(
                  style: TextButton.styleFrom(backgroundColor: Colors.red,fixedSize: Size.fromWidth(220),),
                    onPressed: () {
                    Category newCategory = Category(controller.text.toString());
                    categoriesScreen.addCategory(newCategory);
                    },
                    child: Text("Сохранить", style: TextStyle(color: Colors.white,),))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
