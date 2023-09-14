// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:islami/hadeeth/hadeeth_details_screen_style.dart';
import 'package:islami/hadeeth/hadeeth_tab.dart';
import 'package:islami/theme.dart';

class HadeethDetailsScreen extends StatefulWidget {
  const HadeethDetailsScreen({super.key});

  static const routeName = 'hadeeth_details_screen';

  @override
  State<HadeethDetailsScreen> createState() => _HadeethDetailsScreenState();
}

class _HadeethDetailsScreenState extends State<HadeethDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    Hadeeth args = ModalRoute.of(context)?.settings.arguments as Hadeeth;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Stack(children: [
      Image.asset(
        'assets/images/bg.png',
        width: double.infinity,
        height: double.infinity,
        fit: BoxFit.fill,
      ),
      Scaffold(
        appBar: AppBar(
            title: Text('Islami',
                style: Theme.of(context).textTheme.displayLarge)),
        body: Container(
          margin: EdgeInsets.fromLTRB(
              width * .05, height * 0.05, width * .05, height * .05),
          height: height * .9,
          width: width * .9,
          decoration: BoxDecoration(
              color: AppTheme.whiteColor,
              borderRadius: BorderRadius.circular(25)),
          child: Column(children: [
            Text(
              args.title,
              style: Theme.of(context).textTheme.titleSmall,
            ),
            Divider(
                thickness: 2,
                color: AppTheme.lightPrimary,
                indent: 40,
                endIndent: 40),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return HadeethDetailsScreenStyle(
                      content: args.content[index]);
                },
                itemCount: args.content.length,
              ),
            ),
          ]),
        ),
      )
    ]);
  }
}
