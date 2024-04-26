import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/provider/app_config_provider.dart';
import 'package:islami/theme.dart';
import 'package:provider/provider.dart';

class ThemeBottomSheet extends StatefulWidget {
  const ThemeBottomSheet({super.key});

  @override
  State<ThemeBottomSheet> createState() => _ThemeBottomSheetState();
}

class _ThemeBottomSheetState extends State<ThemeBottomSheet> {
  @override
  Widget build(BuildContext context) {
    AppConfigProvider provider = Provider.of(context);

    double height = MediaQuery.of(context).size.height;
    return Container(
      height: height * .2,
      padding: EdgeInsets.fromLTRB(20, 20, 15, 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          GestureDetector(
            onTap: () => provider.changeAppTheme(ThemeMode.light),
            child: !provider.isDarkMode()
                ? getSelectedItemWidget(AppLocalizations.of(context)!.light)
                : getUnSelectedItemWidget(AppLocalizations.of(context)!.light),
          ),
          SizedBox(height: height * .03),
          GestureDetector(
            onTap: () => provider.changeAppTheme(ThemeMode.dark),
            child: provider.isDarkMode()
                ? getSelectedItemWidget(AppLocalizations.of(context)!.dark)
                : getUnSelectedItemWidget(AppLocalizations.of(context)!.dark),
          ),
        ],
      ),
    );
  }

  Widget getSelectedItemWidget(String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.w400,
              color: Theme.of(context).primaryColor),
        ),
        Icon(Icons.check, color: AppTheme.lightPrimary, size: 30)
      ],
    );
  }

  Widget getUnSelectedItemWidget(String text) {
    return Text(
      text,
      style: Theme.of(context)
          .textTheme
          .titleSmall
          ?.copyWith(fontWeight: FontWeight.w400, color: AppTheme.blackColor),
    );
  }
}
