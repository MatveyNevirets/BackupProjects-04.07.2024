# Рисовалка фигур

##### Flutter предлагает различные виджеты для работы с определенным набором фигур, например, [ClipRect](https://api.flutter.dev/flutter/widgets/ClipRect-class.html), [ClipRRect](https://api.flutter.dev/flutter/widgets/ClipRRect-class.html), [ClipOval](https://api.flutter.dev/flutter/widgets/ClipOval/ClipOval.html). Но также есть [ClipPath](https://api.flutter.dev/flutter/widgets/ClipPath-class.html), с помощью которого мы можем создавать любые типы фигур.

###### Чтобы нарисовать круг и линию:

```dart
class DrawingPainter extends CustomPainter {

  //Создали класс "рисовалки"
  
  @override  
  void paint(Canvas canvas, Size size) {  
  
    final paint = Paint();  //Создаем кисть, со своими стилями, толщиной
    paint.strokeWidth = 4;  //Задаем толщину
    paint.style = PaintingStyle.fill;  //Cтиль
    paint.color = Colors.cyan;  //Вроде не тупой ;)
  
      canvas.drawOval(Rect.fromCircle(center: Offset(-100, 100), radius: 20), paint);  //На канвасе(Который является объектом в котором установлен //сам виджет CustomPaint()) рисуем овал, соответственно задаем ему центр, //радиус и указываем кисть, которой его рисуем
      canvas.drawLine(Offset(-100, 150), Offset(-100, 300), paint); //С линией почти тоже самое, что и с овалом 
  }  
  
  @override  
  bool shouldRepaint(covariant CustomPainter oldDelegate) {  
    return false;  //"Это база"
  }  
  
}
```

###### И добавляем на экран как виджет

```dart
	return Scaffold(
		body: Container(child: Center(
			child: CustomPaint(
				painter: DrawingPainter(),),
				),
			),
		);
```

## Перевод градусов в радианы и наоборот

#### Градусы в радианы: градусы * pi / 180

#### Радианы в градусы: радианы * 180 / pi

![[1024px-Degree-Radian_Conversion.svg.png]]

