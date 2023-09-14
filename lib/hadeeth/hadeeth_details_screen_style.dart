// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class HadeethDetailsScreenStyle extends StatelessWidget {
  String content;

  HadeethDetailsScreenStyle({Key? key, required this.content})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        content,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.titleMedium,
        textDirection: TextDirection.rtl,
      ),
    );
  }
}
