import 'package:flutter/material.dart';
import 'package:islami/theme.dart';

class RadioTab extends StatelessWidget {
  const RadioTab({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Padding(
      padding: const EdgeInsets.only(bottom: 50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(height: height * .04),
          Image.asset('assets/images/rlogo.png'),
          Text('Holy Quran Radio',
              style: Theme.of(context).textTheme.titleMedium),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(Icons.skip_previous, color: AppTheme.lightPrimary, size: 40),
              Icon(Icons.play_arrow, color: AppTheme.lightPrimary, size: 55),
              Icon(Icons.skip_next, color: AppTheme.lightPrimary, size: 40),
            ],
          )
        ],
      ),
    );
  }
}
