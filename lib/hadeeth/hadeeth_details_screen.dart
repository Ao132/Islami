import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/hadeeth/hadeeth_details_screen_style.dart';
import 'package:islami/hadeeth/hadeeth_tab.dart';
import 'package:islami/provider/app_config_provider.dart';
import 'package:islami/theme.dart';
import 'package:provider/provider.dart';

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
    AppConfigProvider provider = Provider.of<AppConfigProvider>(context);

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
          padding: EdgeInsets.only(top: height * .02),
          margin: EdgeInsets.fromLTRB(
              width * .05, height * .05, width * .05, height * .05),
          height: height * .9,
          width: width * .9,
          decoration: BoxDecoration(
              color: AppTheme.whiteColor,
              borderRadius: BorderRadius.circular(25)),
          child: Column(children: [
            Text(
              args.title,
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
