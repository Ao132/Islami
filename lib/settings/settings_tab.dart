import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/provider/app_config_provider.dart';
import 'package:islami/settings/lang_bottom_sheet.dart';
import 'package:islami/settings/theme_bottom_sheet.dart';
import 'package:provider/provider.dart';

class SettingsTab extends StatefulWidget {
  const SettingsTab({super.key});

  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  @override
  Widget build(BuildContext context) {
    AppConfigProvider provider = Provider.of(context);

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            AppLocalizations.of(context)!.language,
            style: provider.isDarkMode()
                ? Theme.of(context).textTheme.labelSmall
                : Theme.of(context).textTheme.titleSmall,
          ),
          GestureDetector(
            onTap: langBottomSheet,
            child: Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(13)),
              padding: EdgeInsets.fromLTRB(
                  width * .03, height * .02, width * .02, height * .02),
              margin: EdgeInsets.fromLTRB(
                  width * .02, height * .02, width * .02, height * .05),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    provider.appLang == 'en'
                        ? AppLocalizations.of(context)!.english
                        : AppLocalizations.of(context)!.arabic,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const Icon(Icons.arrow_drop_down, size: 30)
                ],
              ),
            ),
          ),
          Text(
            AppLocalizations.of(context)!.themeing,
            style: provider.isDarkMode()
                ? Theme.of(context).textTheme.labelSmall
                : Theme.of(context).textTheme.titleSmall,
          ),
          GestureDetector(
            onTap: themeBottomSheet,
            child: Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(13)),
              padding: EdgeInsets.fromLTRB(
                  width * .03, height * .02, width * .02, height * .02),
              margin: EdgeInsets.fromLTRB(
                  width * .02, height * .02, width * .02, height * .05),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    provider.isDarkMode()
                        ? AppLocalizations.of(context)!.dark
                        : AppLocalizations.of(context)!.light,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const Icon(Icons.arrow_drop_down, size: 30)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  langBottomSheet() {
    return showModalBottomSheet(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15), topRight: Radius.circular(15))),
        context: context,
        builder: (context) => LangBottomSheet());
  }

  themeBottomSheet() {
    return showModalBottomSheet(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15), topRight: Radius.circular(15))),
        context: context,
        builder: (context) => ThemeBottomSheet());
  }
}
