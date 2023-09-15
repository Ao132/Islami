import 'package:flutter/material.dart';
import 'package:islami/hadeeth/hadeeth_tab.dart';
import 'package:islami/quran/quran_tab.dart';
import 'package:islami/radio/radio_tab.dart';
import 'package:islami/sebha/sebha_tab.dart';
import 'package:islami/theme.dart';

class HomeSccreen extends StatefulWidget {
  const HomeSccreen({super.key});
  static const routeName = 'route_name';

  @override
  State<HomeSccreen> createState() => _HomeSccreenState();
}

class _HomeSccreenState extends State<HomeSccreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          'assets/images/bg.png',
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.fill,
        ),
        Scaffold(
          appBar: AppBar(title: Text('Islami', style: Theme.of(context).textTheme.displayLarge)),
          bottomNavigationBar: Theme(
            data: ThemeData(canvasColor: AppTheme.lightPrimary),
            child: BottomNavigationBar(
                selectedItemColor: AppTheme.blackColor,
                unselectedItemColor: AppTheme.whiteColor,
                currentIndex: selectedIndex,
                onTap: (index) {
                  selectedIndex = index;
                  setState(() {});
                },
                items: const [
                  BottomNavigationBarItem(
                    label: 'Quran',
                    icon: ImageIcon(
                      AssetImage('assets/images/qicon.png'),
                    ),
                  ),
                  BottomNavigationBarItem(
                    label: 'Hadeeth',
                    icon: ImageIcon(
                      AssetImage('assets/images/hicon.png'),
                    ),
                  ),
                  BottomNavigationBarItem(
                    label: 'Sebha',
                    icon: ImageIcon(
                      AssetImage('assets/images/sicon.png'),
                    ),
                  ),
                  BottomNavigationBarItem(
                    label: 'Radio',
                    icon: ImageIcon(
                      AssetImage('assets/images/ricon.png'),
                    ),
                  ),
                ]),
          ),
          body:tabs[selectedIndex] ,
        ),
      ],
    );
  }
  List<Widget>tabs= [QuranTab(), HadeethTab(), SebhaTab(), const RadioTab()];
}
