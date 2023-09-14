// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:islami/hadeeth/hadeeth_details_screen.dart';
import 'package:islami/hadeeth/hadeeth_tab.dart';

class HadeethNameStyle extends StatelessWidget {
  Hadeeth hadeeth;

  HadeethNameStyle({
    Key? key,
    required this.hadeeth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () => Navigator.of(context)
            .pushNamed(HadeethDetailsScreen.routeName, arguments: hadeeth),
        child: Text(
          hadeeth.title,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.titleSmall,
        ));
  }
}
