import 'package:flutter/material.dart';
import 'package:repeat_it/Entities/%D0%A1ategory.dart';
import 'package:repeat_it/Screens/CategoriesScreen.dart';

class CategoriesScreenUI extends StatefulWidget {
  CategoriesScreenUI({
    super.key,
    required this.categories,
  });

  List<Category> categories;

  @override
  State<CategoriesScreenUI> createState() => _CategoriesScreenUIState();
}

class _CategoriesScreenUIState extends State<CategoriesScreenUI> {
  CategoriesScreen categoriesScreen = CategoriesScreen();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: Colors.red[400],
        onPressed: () {
          categoriesScreen.showCreateNewCategoryDialog(context);

        },
      ),
      appBar: AppBar(
        backgroundColor: Colors.red[400],
        title: const Text(
          "Repeat It!",
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: const Icon(Icons.settings),
          color: Colors.white,
          onPressed: () {
            print("Hello World!");
          },
        ),
      ),
      body: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(top: 30, left: 30),
            child: const Text("Категории", style: TextStyle(fontSize: 18)),
          ),
          Expanded(
            flex: 1,
            child: Container(
              height: 410,
              margin: const EdgeInsets.all(30),
              child: ListOfCategory(categoriesScreen, widget.categories)
            ),
          ),
        ],
      ),
    ));
  }
}

class ListOfCategory extends StatefulWidget
{
  ListOfCategory(this.categoriesScreen, this.categories);

  CategoriesScreen categoriesScreen;
  List<Category> categories;

  @override
  State<ListOfCategory> createState() => _ListOfCategoryState();
}

class _ListOfCategoryState extends State<ListOfCategory> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.separated(
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              widget.categories[index].title,
              style:
              const TextStyle(color: Colors.white, fontSize: 14),
            ),
            tileColor: Colors.red[400],
            minTileHeight: 10,
            onTap: () {
              setState(() {
                widget.categoriesScreen.getCategories().removeAt(index);
                widget.categories = widget.categoriesScreen.getCategories();
              });
            },
          );
        },
        separatorBuilder: (_, __) => const Divider(
          color: Colors.grey,
          thickness: 0.5,
          height: 10,
        ),
        itemCount: widget.categories.length);
  }
}
