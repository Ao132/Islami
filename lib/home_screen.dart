import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/hadeeth/hadeeth_tab.dart';
import 'package:islami/provider/app_config_provider.dart';
import 'package:islami/quran/quran_tab.dart';
import 'package:islami/radio/radio_tab.dart';
import 'package:islami/sebha/sebha_tab.dart';
import 'package:islami/settings/settings_tab.dart';
import 'package:provider/provider.dart';

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
    AppConfigProvider provider = Provider.of<AppConfigProvider>(context);

    return Stack(
      children: [
        provider.isDarkMode()
            ? Image.asset(
                'assets/images/dbg.png',
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.fill,
              )
            : Image.asset(
                'assets/images/bg.png',
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.fill,
              ),
        Scaffold(
          appBar: AppBar(
              title: Text(AppLocalizations.of(context)!.app_title,
                  style: provider.isDarkMode()
                      ? Theme.of(context)
                          .textTheme
                          .labelSmall
                          ?.copyWith(fontSize: 30)
                      : Theme.of(context).textTheme.displayLarge)),
          bottomNavigationBar: Theme(
            data: Theme.of(context)
                .copyWith(canvasColor: Theme.of(context).primaryColor),
            child: BottomNavigationBar(
                iconSize: 27,
                selectedFontSize: 18,
                currentIndex: selectedIndex,
                onTap: (index) {
                  selectedIndex = index;
                  setState(() {});
                },
                items: [
                  BottomNavigationBarItem(
                    label: AppLocalizations.of(context)!.quran,
                    icon: const ImageIcon(
                      AssetImage('assets/images/qicon.png'),
                    ),
                  ),
                  BottomNavigationBarItem(
                    label: AppLocalizations.of(context)!.hadeeth,
                    icon: const ImageIcon(
                      AssetImage('assets/images/hicon.png'),
                    ),
                  ),
                  BottomNavigationBarItem(
                    label: AppLocalizations.of(context)!.tasbeeh,
                    icon: const ImageIcon(
                      AssetImage('assets/images/sicon.png'),
                    ),
                  ),
                  BottomNavigationBarItem(
                    label: AppLocalizations.of(context)!.radio,
                    icon: const ImageIcon(
                      AssetImage('assets/images/ricon.png'),
                    ),
                  ),
                  BottomNavigationBarItem(
                      label: AppLocalizations.of(context)!.settings,
                      icon: const Icon(Icons.settings)),
                ]),
          ),
          body: tabs[selectedIndex],
        ),
      ],
    );
  }

  List<Widget> tabs = [
    QuranTab(),
    HadeethTab(),
    SebhaTab(),
    const RadioTab(),
    const SettingsTab()
  ];
}
