import 'dart:math';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class AuthWidget extends StatefulWidget {
  const AuthWidget({super.key});

  void LogIn(String login, String password, BuildContext context) {
    if (login == "a" && password == "a") {
      Navigator.of(context).pushReplacementNamed("/MainScreen");
    }
    else if (login == "" || password == "") {
      const snackBar = SnackBar(
        duration: Duration(seconds: 2),
        content: Center(
          child: Text(
            "Необходимо заполнить все поля",
            style: TextStyle(color: Colors.black),
          ),
        ),
        backgroundColor: Colors.white70,
        padding: EdgeInsets.all(16),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else {
      const snackBar = SnackBar(
        duration: Duration(seconds: 2),
        content: Center(
          child: Text(
            "Введен неправильный логин или пароль",
            style: TextStyle(color: Colors.black),
          ),
        ),
        backgroundColor: Colors.white70,
        padding: EdgeInsets.all(16),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  void SignIn() {
    print("Sign in...");
  }

  void ForgotPassword() {
    print("Reset password...");
  }

  @override
  State<AuthWidget> createState() => _AuthWidgetState();
}

class _AuthWidgetState extends State<AuthWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("GYM ID"),
        centerTitle: true,
      ),
      body: AuthFormWidget(),
    );
  }
}

class AuthFormWidget extends StatefulWidget {
  const AuthFormWidget({super.key});

  @override
  State<AuthFormWidget> createState() => _AuthFormWidgetState();
}

class _AuthFormWidgetState extends State<AuthFormWidget> {
  bool isChangeSaveLogin = false;

  final titleTextStyle = const TextStyle(fontSize: 30);
  final subtitleTextStyle =
      const TextStyle(fontSize: 20, color: Colors.black54);

  final blueButtonColor = const Color.fromRGBO(38, 136, 235, 1);
  final whiteButtonColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.symmetric(vertical: size.height / 10),
      margin: EdgeInsets.all(size.width / 20),
      child: Wrap(
        children: [
          TitleWidget(titleTextStyle, subtitleTextStyle),
          FormWidget(blueButtonColor, whiteButtonColor, isChangeSaveLogin),
          OtherFunctionWidget(blueButtonColor, whiteButtonColor),
        ],
      ),
    );
  }
}

class TitleWidget extends StatelessWidget {
  final titleTextStyle;
  final subtitleTextStyle;

  const TitleWidget(this.titleTextStyle, this.subtitleTextStyle, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text(
        "Вход GYM",
        style: titleTextStyle,
      ),
      const SizedBox(
        height: 5,
      ),
      Text(
        "Введите почту и пароль, которые привязаны к аккаунту",
        style: subtitleTextStyle,
        textAlign: TextAlign.center,
      ),
      const SizedBox(
        height: 20,
      ),
    ]);
  }
}

class FormWidget extends StatefulWidget {
  final blueButtonColor;
  final whiteButtonColor;

  bool isChangeSaveLogin;

  FormWidget(
      this.blueButtonColor, this.whiteButtonColor, this.isChangeSaveLogin,
      {super.key});

  @override
  State<FormWidget> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  TextEditingController loginController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  AuthWidget authWidget = AuthWidget();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: loginController,
          textInputAction: TextInputAction.next,
          cursorColor: Colors.black,
          decoration: InputDecoration(
            border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8))),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                width: 2,
                color: widget.blueButtonColor,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(8)),
            ),
            hintText: "Логин",
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        TextField(
          controller: passwordController,
          cursorColor: Colors.black,
          decoration: InputDecoration(
            border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8))),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                width: 2,
                color: widget.blueButtonColor,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(8)),
            ),
            hintText: "Пароль",
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Row(
          children: [
            Checkbox(
                activeColor: widget.blueButtonColor,
                value: widget.isChangeSaveLogin,
                onChanged: (bool? newValue) {
                  setState(() {
                    widget.isChangeSaveLogin = newValue!;
                  });
                }),
            const Text(
              "Сохранить вход",
              style: TextStyle(color: Colors.black54, fontSize: 16),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        AspectRatio(
            aspectRatio: 7.5,
            child: TextButton(
                style: ButtonStyle(
                    shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    )),
                    foregroundColor:
                        WidgetStateProperty.all(widget.whiteButtonColor),
                    textStyle: WidgetStateProperty.all(TextStyle(
                        color: widget.whiteButtonColor, fontSize: 16)),
                    backgroundColor:
                        WidgetStateProperty.all(widget.blueButtonColor)),
                onPressed: () {
                  String login = loginController.value.text.toString();
                  String password = passwordController.value.text.toString();

                  authWidget.LogIn(login, password, context);
                },
                child: const Text("Продолжить"))),
        const SizedBox(
          height: 10,
        ),
        const Text(
          'Нажимая "Продолжить" вы принимаете пользовательское соглашение и политику конфиденциальности',
          style: TextStyle(color: Colors.black54, fontSize: 12),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}

class OtherFunctionWidget extends StatelessWidget {
  final blueButtonColor;
  final whiteButtonColor;

  const OtherFunctionWidget(this.blueButtonColor, this.whiteButtonColor,
      {super.key});

  @override
  Widget build(BuildContext context) {
    AuthWidget authWidget = AuthWidget();

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          style: ButtonStyle(
            foregroundColor: WidgetStateProperty.all(whiteButtonColor),
          ),
          onPressed: () {
            authWidget.ForgotPassword();
          },
          child: Text("Забыли пароль?",
              style: TextStyle(color: blueButtonColor, fontSize: 14)),
        ),
        TextButton(
          style: ButtonStyle(
            foregroundColor: WidgetStateProperty.all(whiteButtonColor),
          ),
          onPressed: () {
            authWidget.SignIn();
          },
          child: Text("Зарегистрироваться",
              style: TextStyle(color: blueButtonColor, fontSize: 14)),
        ),
      ],
    );
  }
}
