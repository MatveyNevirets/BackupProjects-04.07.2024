### late

Ключевое слово `late` позволяет объявить переменную и не инициализировать её значение сразу.

### dynamic

В Dart есть ключевое слово `dynamic`, отключающее проверки типов для переменной. Им стоит пользоваться, если тип переменной не известен до запуска программы и его нельзя вывести.

### final

Ключевое слово `final` запрещает переопределение переменной после инициализации.

**Важно.** Переменная, помеченная `final`, — не константа, просто её значение нельзя переопределить после инициализации.

Давайте создадим переменную `final` и попытаемся изменить её значение.

```dart
    void main() {   final a;    a = 5;    print('Integer variable: $a');    a = 6;   print('Integer variable 2: $a');    a = 'Some string';   print('String variable: $a'); }
```

## null-safety

С включенным `null-safety` в Dart все переменные не могут иметь значение `null`, если об этом не сказано явно с помощью `?`:

```dart
String nonNullVariable = "Hello, world!";
// При попытке присвоить null будет ошибка
nonNullVariable = null;
 
String? nullableVariable = "Hello, world!";
// Теперь ничего не мешает присвоить null
nullableVariable = null;
```

### Оператор `!` или force unwrap

Данный оператор говорит компилятору: «Я уверен, что данное значение не может быть `null`».

```dart
final value = myClass!.foo();
// Чуть длиннее. Осторожно, force unwrap и приведение это не одно и то же!
final value = (myClass as MyClass).foo();
```

### Required

Ключевое слово `required` — оно обязывает при вызове передать именованный параметр:

```dart
void foo2({required int value1, required bool flag, required int value2, required int value3}) {} // удобно и читаемо
 
void main() {
	foo2(value1: 5, flag: true, value2: 2); // ошибка, value3 не передали
}
```

