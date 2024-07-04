#### Для создания NavigationBar'a

```dart
bottomNavigationBar: BottomNavigationBar( //Это параметр Scaffold'a
	items: [
		BottomNavigationBarItem(
		icon: Icon(Icons.enyIcon),
		label: "news",
		),
		
		BottomNavigationBarItem(
		icon: Icon(Icons.enyIcon),
		label: "films",
		),
	]
)
```

##### Так же у NavigationBar'a есть Theme
 ```dart
 ThemeData(
	 bottomNavigationBarTheme: BottomNavigationBarTheme(
		 backgroundColor: Colors.black,
		 selectedItemColor: Colors.white,
		 unselectedItemColor: Colors.cyan,
	 ),)
```

##### Для оживления виджета

*Создаем отдельную int переменную + добавляем функцию*

```dart
int selectedTab = 1;

void selectTab(int index)
{
	if(selectedTab == index) return; // Если нажимаем на выбраную вкладку,
									// то ничего не выполняем

	setState(() {
		selectedTab = index;
	})
}
---------------------------
bottomNavigationBar: BottomNavigationBar( // Это параметр Scaffold'a
	currentIndex: selectedTab,
	items: [...],
	onTap: selectTab(index), // Всегда ссылаемся на *внешнюю* функцию
)
```

### Реализация переключения экранов

```dart
static const List<Widget> widgetOptions = <Widget> [
	Text("one"),
	Text("two"),
	Text("three"),
],

---------------------Scaffold----------------------

body: Center(child: widgetOptions[selectedTab],),
```

*Но! Есть загвоздка. Заключается она в том, что если мы будем взаимодействовать с одним экраном, потом переключимся на другой, а после обратно, то у первого экрана пропадет то, с чем мы взаимодействовали(TextField, скроллы и подобное)

Тут приходит на помощь **IndexedStack

```dart
return IndexedStack(children: [
	Text("one"),
	Text("two"),
	Text("three"),
],
				   
	index: selectedTab);
```

После таких манипуляций, работа приложения остается той же, причем все *Чилдрены* активны. Это слегка нагружает систему, но данные остаются и никуда не исчезают!