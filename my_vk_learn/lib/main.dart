import 'package:flutter/material.dart';
import 'package:my_vk_learn/widgets/auth/auth_widget.dart';
import 'package:my_vk_learn/widgets/dont_use_widget.dart';
import 'package:my_vk_learn/widgets/main_screen/main_screen_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            backgroundColor: Colors.white,
            selectedItemColor: Color.fromRGBO(38, 136, 235, 1),
            unselectedItemColor: Colors.grey,
          ),
          appBarTheme: const AppBarTheme(
            elevation: 1,
            backgroundColor: Colors.white,
            titleTextStyle: TextStyle(
              fontStyle: FontStyle.normal,
              color: Colors.black,
              fontSize: 26,
            ),
          )),
      routes: {
        "/" : (context) => DontUseWidget(),
        "/MainScreen" : (context) => MainScreenWidget(),
      },

      initialRoute: "/",
    );
  }
}
