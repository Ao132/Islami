import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/hadeeth/hadeeth_details_screen.dart';
import 'package:islami/home_screen.dart';
import 'package:islami/provider/app_config_provider.dart';
import 'package:islami/quran/sura_details_screen.dart';
import 'package:islami/theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => AppConfigProvider(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    AppConfigProvider provider = Provider.of<AppConfigProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeSccreen.routeName,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      routes: {
        HomeSccreen.routeName: (context) => const HomeSccreen(),
        SuraDetailsScreen.routeName: (context) => const SuraDetailsScreen(),
        HadeethDetailsScreen.routeName: (context) =>
            const HadeethDetailsScreen(),
      },
      themeMode: provider.appTheme,
      locale: Locale(provider.appLang),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}
