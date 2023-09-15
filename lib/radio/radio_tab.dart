import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/provider/app_config_provider.dart';
import 'package:islami/theme.dart';
import 'package:provider/provider.dart';

class RadioTab extends StatelessWidget {
  const RadioTab({super.key});

  @override
  Widget build(BuildContext context) {
    AppConfigProvider provider = Provider.of<AppConfigProvider>(context);

    double height = MediaQuery.of(context).size.height;

    return Padding(
      padding: const EdgeInsets.only(bottom: 50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(height: height * .04),
          Image.asset('assets/images/rlogo.png'),
          Text(AppLocalizations.of(context)!.holy_quran_radio,
              style: Theme.of(context).textTheme.titleMedium),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              provider.isDarkMode()
                  ? Icon(Icons.skip_previous,
                      color: AppTheme.yellowColor, size: 40)
                  : Icon(Icons.skip_previous,
                      color: AppTheme.lightPrimary, size: 40),
              provider.isDarkMode()
                  ? Icon(Icons.play_arrow,
                      color: AppTheme.yellowColor, size: 55)
                  : Icon(Icons.play_arrow,
                      color: AppTheme.lightPrimary, size: 55),
              provider.isDarkMode()
                  ? Icon(Icons.skip_next, color: AppTheme.yellowColor, size: 55)
                  : Icon(Icons.skip_next,
                      color: AppTheme.lightPrimary, size: 55),
            ],
          )
        ],
      ),
    );
  }
}
