// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class SuraNameStyle extends StatelessWidget {
  String text;
   SuraNameStyle({
    Key? key,
    required this.text,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(text,textAlign: TextAlign.center,style: Theme.of(context).textTheme.titleSmall,);
  }
}
