import 'package:flutter/material.dart';

import '../components/makeCard.dart';
import '../constants.dart';

class ResultPage extends StatelessWidget {
  final BMI;
  final category;
  final advice;
  Color? categoryColor;

  ResultPage({this.BMI, this.category, this.advice}) {
    if (category == 'UNDERWEIGHT') {
      categoryColor = kUnderWeight;
    } else if (category == 'OVERWEIGHT') {
      categoryColor = kOverweight;
    } else {
      categoryColor = kHealthyGreen;
    }

    print(BMI);
    print(category);
    print(advice);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Center(
              child: Container(
                child: Text(
                  'Your Result',
                  style: kFontLabel,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 7,
            child: MakeCard(
              cardColor: kActiveCardColor,
              onPress: () {},
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    category,
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: categoryColor,
                    ),
                  ),
                  Text(
                    BMI,
                    style: kFinalBMI,
                  ),
                  Text(
                    advice,
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              padding: EdgeInsets.only(bottom: 10.0),
              width: double.infinity,
              height: kBottomContainerHeight,
              color: kAccentColorPink,
              child: Center(
                child: Text(
                  'RECALCULATE',
                  style: TextStyle(
                    fontSize: kBottomButtonFontSize,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
