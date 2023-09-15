import 'package:flutter/material.dart';
import 'package:islami/theme.dart';

class SebhaTab extends StatefulWidget {
  SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int sebhaCounter = 0;
  int index = 0;
  double angle = 0;

  List<String> tasbehList = [
    'سبحان اللَّه ',
    'الحمد للَّه ',
    'لا اله الا اللَّه ',
    'اللَّه اكبر',
    'لا حول ولا قوه الا باللَّه',
  ];

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          GestureDetector(
            onTap: sebhaClick,
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Positioned(
                    left: width * 0.2,
                    child: Image.asset('assets/images/sebhahead.png')),
                Padding(
                  padding:
                      EdgeInsets.only(top: height * .1, bottom: height * .03),
                  child: Transform.rotate(
                    angle: angle,
                    child: Image.asset(
                      'assets/images/sebhabody.png',
                      height: height * 0.3,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Text('Tasbeeh Counter',
              style: Theme.of(context).textTheme.titleMedium),
          Container(
            margin: EdgeInsets.only(top: height * 0.03, bottom: height * .03),
            padding: EdgeInsets.all(height * .03),
            decoration: BoxDecoration(
              color: AppTheme.lightPrimary,
              borderRadius: BorderRadius.circular(17),
            ),
            child: Text(
              '$sebhaCounter',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
          Container(
            padding: EdgeInsets.all(height * .008),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: AppTheme.lightPrimary,
            ),
            child: Text(
              tasbehList[index],
              style: Theme.of(context).textTheme.bodySmall,
            ),
          )
        ],
      ),
    );
  }

  void sebhaClick() {
    sebhaCounter++;

    if (sebhaCounter % 33 == 0) {
      sebhaCounter = 0;
      index++;
    }
    if (index == tasbehList.length) {
      index = 0;
    }

    angle += 360 / 33;

    setState(() {});
  }
}
