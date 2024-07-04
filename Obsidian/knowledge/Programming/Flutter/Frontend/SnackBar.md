Создание и вызов SnackBar'a

```dart
const snackBar = SnackBar(content: Text("Hello World!"), backgroundColor: Colors.white70);

ScaffoldMessenger.of(context).showSnackBar(snackBar);
```

