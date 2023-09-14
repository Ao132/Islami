// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/hadeeth/hadeeth_name_style.dart';
import 'package:islami/theme.dart';

class HadeethTab extends StatefulWidget {
  @override
  State<HadeethTab> createState() => _HadeethTabState();
}

class _HadeethTabState extends State<HadeethTab> {
  List<Hadeeth> hadeethList = [];

  @override
  Widget build(BuildContext context) {
    if (hadeethList.isEmpty) {
      loadHadeeth();
    }
    return Column(
      children: [
        Expanded(
          flex: 1,
          child: Image.asset('assets/images/hlogo.png'),
        ),
        Divider(color: AppTheme.lightPrimary, thickness: 4),
        Text('Hadeeth Name', style: Theme.of(context).textTheme.titleMedium),
        Divider(color: AppTheme.lightPrimary, thickness: 4),
        Expanded(
          child: hadeethList.isEmpty
              ? const Center(child: CircularProgressIndicator())
              : ListView.separated(
                  separatorBuilder: (context, index) =>
                      Divider(thickness: 2, color: AppTheme.lightPrimary),
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
