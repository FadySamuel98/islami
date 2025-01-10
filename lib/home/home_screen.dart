import 'package:flutter/material.dart';
import 'package:islami/home/hadeth/hadeth_tap.dart';
import 'package:islami/home/quran/quran_tap.dart';
import 'package:islami/home/radio/radio_tap.dart';
import 'package:islami/home/sebha/sebha_tap.dart';
import 'package:islami/my_theme.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedItem = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset('assets/images/bg3.png'),
        Scaffold(
          appBar: AppBar(
            title:
                Text('eslami', style: Theme.of(context).textTheme.titleLarge),
          ),
          bottomNavigationBar: Theme(
            data: Theme.of(context)
                .copyWith(canvasColor: MyTheme.primaryLightColor),
            child: BottomNavigationBar(
                currentIndex: selectedItem,
                onTap: (index) {
                  selectedItem = index;
                  setState(() {});
                },
                items: [
                  BottomNavigationBarItem(
                      icon: ImageIcon(AssetImage('assets/images/quran.png')),
                      label: 'Quran'),
                  BottomNavigationBarItem(
                      icon: ImageIcon(AssetImage('assets/images/hadeth.png')),
                      label: 'Hadeth'),
                  BottomNavigationBarItem(
                      icon: ImageIcon(AssetImage('assets/images/sebha.png')),
                      label: 'Sebha'),
                  BottomNavigationBarItem(
                      icon: ImageIcon(AssetImage('assets/images/radio.png')),
                      label: 'Radio'),
                ]),
          ),
          body: tabs[selectedItem],
        )
      ],
    );
  }

  List<Widget> tabs = [QuranTab(), HadethTab(), SebhaTab(), RadioTab()];
}
