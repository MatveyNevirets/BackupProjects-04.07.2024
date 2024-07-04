import 'package:flutter/material.dart';
import 'package:my_vk_learn/main.dart';
import 'package:my_vk_learn/widgets/page_widgets/messanger_page_widget.dart';
import 'package:my_vk_learn/widgets/page_widgets/news_page_widget.dart';

class MainScreenWidget extends StatefulWidget {
  int selectedTab = 0;

  static final List<Widget> pages = <Widget>[
    NewsPageWidget(),
    MessangerPageWidget(),
    Container(
        padding: const EdgeInsets.all(60),
        child: const Center(
          child: Text(
            "В этом разделе будут все твои GYM BRO, новости от которых ты будешь получать в основной ленте",
            style: TextStyle(fontSize: 24),
          ),
        )),
  ];

  @override
  State<MainScreenWidget> createState() => _MainScreenWidgetState();
}

class _MainScreenWidgetState extends State<MainScreenWidget> {
  @override
  Widget build(BuildContext context) {
    void selectTab(int index) {
      setState(() {
        widget.selectedTab = index;
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Text(
          "THE GYM",
          style: TextStyle(fontSize: 30),
        )),
      ),
      body: Center(
        child: MainScreenWidget.pages[widget.selectedTab],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Новости"),
          BottomNavigationBarItem(
              icon: Icon(Icons.message), label: "Переговорная"),
          BottomNavigationBarItem(
              icon: Icon(Icons.people_alt), label: "Gym бразерс"),
        ],
        currentIndex: widget.selectedTab,
        onTap: (index) => selectTab(index),
      ),
    );
  }
}
