// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/quran/sura_details_screen_style.dart';
import 'package:islami/theme.dart';

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
    if (verses.isEmpty) {
      loadFiles(args.index);
    }
    return Stack(children: [
      Image.asset(
        'assets/images/bg.png',
        width: double.infinity,
        height: double.infinity,
        fit: BoxFit.fill,
      ),
      Scaffold(
        appBar: AppBar(
            title: Text(args.name,
                style: Theme.of(context).textTheme.displayLarge)),
        body: Container(
          margin: EdgeInsets.fromLTRB(
              width * .05, height * 0.05, width * .05, height * .05),
          height: height * .9,
          width: width * .9,
          decoration: BoxDecoration(
              color: AppTheme.whiteColor,
              borderRadius: BorderRadius.circular(25)),
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
      )
    ]);
  }

  void loadFiles(int index) async {
    String fileContent =
        await rootBundle.loadString('assets/files/${index + 1}.txt');
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
