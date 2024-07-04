import '../Entities/Сategory.dart';

class CategoriesScreenModel {

  List<Category> categories = [
    Category("FuckUp"),
    Category("Математика")
  ];

  void AddCategory(Category newCategory)
  {
    categories.add(newCategory);
    print(categories);
  }
}
