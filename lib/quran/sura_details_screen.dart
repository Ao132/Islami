import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/provider/app_config_provider.dart';
import 'package:islami/quran/sura_details_screen_style.dart';
import 'package:islami/theme.dart';
import 'package:provider/provider.dart';

class SuraDetailsScreen extends StatefulWidget {
  const SuraDetailsScreen({super.key});

  static const routeName = 'sura_details_screen';

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    SuraDetailsArgs args =
        ModalRoute.of(context)?.settings.arguments as SuraDetailsArgs;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    AppConfigProvider provider = Provider.of(context);

    if (verses.isEmpty) {
      loadFiles(args.index);
    }
    return Stack(children: [
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
        body: Container(
          margin: EdgeInsets.fromLTRB(
              width * .05, height * 0.05, width * .05, height * .05),
          height: height * .9,
          width: width * .9,
          decoration: BoxDecoration(
              color: AppTheme.whiteColor,
              borderRadius: BorderRadius.circular(25)),
          child: Column(children: [
            SizedBox(height: 15),
            Text(
              'سورة ${args.name}',
              style: provider.isDarkMode()
                  ? Theme.of(context).textTheme.displaySmall
                  : Theme.of(context).textTheme.titleSmall,
            ),
            Divider(
                thickness: 2,
                indent: 40,
                endIndent: 40,
                color: provider.isDarkMode()
                    ? AppTheme.yellowColor
                    : AppTheme.lightPrimary),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return SuraDetailsScreenStyle(
                    sura: verses[index],
                    index: index,
                  );
                },
                itemCount: verses.length,
              ),
            ),
          ]),
        ),
      )
    ]);
  }

  void loadFiles(int index) async {
    String fileContent =
        await rootBundle.loadString('assets/files/sura/${index + 1}.txt');
    List<String> lines = fileContent.split('\n');
    verses = lines;
    setState(() {});
  }
}

class SuraDetailsArgs {
  String name;
  int index;

  SuraDetailsArgs({
    required this.name,
    required this.index,
  });
}
