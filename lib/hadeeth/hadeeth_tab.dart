import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/hadeeth/hadeeth_name_style.dart';
import 'package:islami/provider/app_config_provider.dart';
import 'package:islami/theme.dart';
import 'package:provider/provider.dart';

class HadeethTab extends StatefulWidget {
  @override
  State<HadeethTab> createState() => _HadeethTabState();
}

class _HadeethTabState extends State<HadeethTab> {
  List<Hadeeth> hadeethList = [];

  @override
  Widget build(BuildContext context) {
    AppConfigProvider provider = Provider.of<AppConfigProvider>(context);

    if (hadeethList.isEmpty) {
      loadHadeeth();
    }
    return Column(
      children: [
        Expanded(
          flex: 1,
          child: Image.asset('assets/images/hlogo.png'),
        ),
        Divider(
            thickness: 4,
            color: provider.isDarkMode()
                ? AppTheme.yellowColor
                : AppTheme.lightPrimary),
        Text(AppLocalizations.of(context)!.hadeeth_name,
            style: Theme.of(context).textTheme.titleMedium),
        Divider(
            thickness: 4,
            color: provider.isDarkMode()
                ? AppTheme.yellowColor
                : AppTheme.lightPrimary),
        Expanded(
          child: hadeethList.isEmpty
              ? const Center(child: CircularProgressIndicator())
              : ListView.separated(
                  separatorBuilder: (context, index) => Divider(
                      thickness: 2,
                      color: provider.isDarkMode()
                          ? AppTheme.yellowColor
                          : AppTheme.lightPrimary),
                  itemBuilder: (context, index) {
                    return HadeethNameStyle(hadeeth: hadeethList[index]);
                  },
                  itemCount: hadeethList.length,
                ),
        )
      ],
    );
  }

  void loadHadeeth() async {
    String fileContent =
        await rootBundle.loadString('assets/files/ahadeeth/ahadeth.txt');
    List<String> allHadeethList = fileContent.split('#\r\n');
    for (int i = 0; i < allHadeethList.length; i++) {
      List<String> singleHadeeth = allHadeethList[i].split('\n');
      String title = singleHadeeth[0];
      singleHadeeth.removeAt(0);
      Hadeeth hadeeth = Hadeeth(title: title, content: singleHadeeth);
      hadeethList.add(hadeeth);
      setState(() {});
    }
  }
}

class Hadeeth {
  String title;
  List<String> content;

  Hadeeth({
    required this.title,
    required this.content,
  });
}
