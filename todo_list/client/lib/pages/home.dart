import 'package:flutter/material.dart';
import 'package:todo_list/constants/colors.dart';
import 'package:todo_list/pages/inform.dart';
import 'package:todo_list/pages/listcard.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Widget> widgets = [
    Inform(),
    ListCard(),
  ];
  List<IconData> icons = [
    Icons.feed,
    Icons.list,
  ];
  List<String> titles = [
    'Information',
    'ListCard',
  ];
  int indexPosition = 0;
  List<BottomNavigationBarItem> BottomNavigationBarItems = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    int i = 0;

    for (var item in titles) {
      BottomNavigationBarItems.add(
        createBottomNivigationBarItem(icons[i], item),
      );
      i++;
    }
  }

  BottomNavigationBarItem createBottomNivigationBarItem(
          IconData iconData, String string) =>
      BottomNavigationBarItem(icon: Icon(iconData), label: string);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widgets[indexPosition],
      bottomNavigationBar: BottomNavigationBar(
        selectedIconTheme: IconThemeData(color: cPink),
        unselectedIconTheme: IconThemeData(color: cBlue),
        items: BottomNavigationBarItems,
        currentIndex: indexPosition,
        onTap: (value) {
          setState(() {
            indexPosition = value;
          });
        },
      ),
    );
  }
}
