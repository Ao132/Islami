// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:islami/quran/sura_details_screen.dart';

class SuraNameStyle extends StatelessWidget {
  String name;
  int index;

  SuraNameStyle({
    Key? key,
    required this.name,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () => Navigator.of(context).pushNamed(
            SuraDetailsScreen.routeName,
            arguments: SuraDetailsArgs(name: name, index: index)),
        child: Text(
          name,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.titleSmall,
        ));
  }
}
