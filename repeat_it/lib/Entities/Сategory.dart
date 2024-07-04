class Category
{
   late String title;

   Category(this.title);

  String getTitleCategory()
   {
     return title;
   }

   void renameTitleCategory(String title)
   {
     this.title = title;
   }
}