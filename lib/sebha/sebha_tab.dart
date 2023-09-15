import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/provider/app_config_provider.dart';
import 'package:islami/theme.dart';
import 'package:provider/provider.dart';

class SebhaTab extends StatefulWidget {
  SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int sebhaCounter = 0;
  int index = 0;
  double angle = 0;

  List<String> tasbehList = [
    'سبحان اللَّه ',
    'الحمد للَّه ',
    'لا اله الا اللَّه ',
    'اللَّه اكبر',
    'لا حول ولا قوه الا باللَّه',
  ];

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    AppConfigProvider provider = Provider.of<AppConfigProvider>(context);

    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          GestureDetector(
            onTap: sebhaClick,
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                provider.isDarkMode()
                    ? Positioned(
                        left: width * 0.2,
                        child: Image.asset(
                          'assets/images/sebhahead.png',
                          color: AppTheme.yellowColor,
                        ))
                    : Positioned(
                        left: width * 0.2,
                        child: Image.asset('assets/images/sebhahead.png')),
                Padding(
                  padding:
                      EdgeInsets.only(top: height * .1, bottom: height * .03),
                  child: Transform.rotate(
                    angle: angle,
                    child: provider.isDarkMode()
                        ? Image.asset(
                            'assets/images/sebhabody.png',
                            height: height * 0.3,
                            color: AppTheme.yellowColor,
                          )
                        : Image.asset(
                            'assets/images/sebhabody.png',
                            height: height * 0.3,
                          ),
                  ),
                ),
              ],
            ),
          ),
          Text(AppLocalizations.of(context)!.tasbeeh_counter,
              style: provider.isDarkMode()
                  ? Theme.of(context)
                      .textTheme
                      .labelSmall
                      ?.copyWith(fontWeight: FontWeight.w400)
                  : Theme.of(context).textTheme.titleMedium),
          Container(
            margin: EdgeInsets.only(top: height * 0.03, bottom: height * .03),
            padding: EdgeInsets.all(height * .03),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(17),
            ),
            child: Text(
              '$sebhaCounter',
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ),
          Container(
            padding: EdgeInsets.all(height * .008),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: provider.isDarkMode()
                  ? AppTheme.yellowColor
                  : AppTheme.lightPrimary,
            ),
            child: Text(
              tasbehList[index],
              style: provider.isDarkMode()
                  ? Theme.of(context)
                      .textTheme
                      .titleSmall
                      ?.copyWith(color: AppTheme.blackColor)
                  : Theme.of(context).textTheme.titleSmall,
            ),
          )
        ],
      ),
    );
  }

  void sebhaClick() {
    sebhaCounter++;

    if (sebhaCounter % 33 == 0) {
      sebhaCounter = 0;
      index++;
    }
    if (index == tasbehList.length) {
      index = 0;
    }

    angle += 360 / 33;

    setState(() {});
  }
}
