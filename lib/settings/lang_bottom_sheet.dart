import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/provider/app_config_provider.dart';
import 'package:islami/theme.dart';
import 'package:provider/provider.dart';

class LangBottomSheet extends StatefulWidget {
  const LangBottomSheet({super.key});

  @override
  State<LangBottomSheet> createState() => _LangBottomSheetState();
}

class _LangBottomSheetState extends State<LangBottomSheet> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    AppConfigProvider provider = Provider.of(context);
    return Container(
      height: height * .2,
      padding: EdgeInsets.fromLTRB(20, 20, 15, 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          GestureDetector(
            onTap: () => provider.changeAppLang('en'),
            child: provider.appLang == 'en'
                ? getSelectedItemWidget(AppLocalizations.of(context)!.english)
                : getUnSelectedItemWidget(
                    AppLocalizations.of(context)!.english),
          ),
          SizedBox(height: height * .03),
          InkWell(
            onTap: () => provider.changeAppLang('ar'),
            child: provider.appLang == 'ar'
                ? getSelectedItemWidget(AppLocalizations.of(context)!.arabic)
                : getUnSelectedItemWidget(AppLocalizations.of(context)!.arabic),
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
