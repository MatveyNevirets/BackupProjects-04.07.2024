import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Newes {
  String title;
  String description;

  Newes(this.title, this.description);
}

class NewsPageWidget extends StatelessWidget {
  List<Newes> newsList = [
    Newes("Арчо пожал 99.2",
        "При необыкновенных обстоятельствах Арчо пожал 99.2 для этого он использовал самый обычный..."),
    Newes("Масса Димоон достигла предельных 62.3 кг",
        "Как то раз в качалке нашей, захотелось Диме каши, скушал кашу, нет-нет-нет обернулся, Дима - дед!"),
    Newes("Вовэнчек сказал чекать", "(Натуре сказала)"),
  ];

  NewsPageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: ListView.builder(
        itemBuilder: (_, index) => Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Text(newsList[index].title),
            SizedBox(
              height: 30,
            ),
            Text(newsList[index].description),
            SizedBox(
              height: 30,
            ),
          ],
        ),
        itemCount: newsList.length,
      ),
    );
  }
}
