import 'package:flutter/material.dart';
import 'package:islami/hadeeth/hadeeth_details_screen.dart';
import 'package:islami/home_screen.dart';
import 'package:islami/quran/sura_details_screen.dart';
import 'package:islami/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeSccreen.routeName,
      theme: AppTheme.lightTheme,
      routes: {
        HomeSccreen.routeName: (context) => const HomeSccreen(),
        SuraDetailsScreen.routeName: (context) => const SuraDetailsScreen(),
        HadeethDetailsScreen.routeName: (context) =>
            const HadeethDetailsScreen(),
      },
    );
  }
}
