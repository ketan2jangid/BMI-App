import 'package:flutter/material.dart';

class MakeCard extends StatelessWidget {
  MakeCard({this.cardColor, this.cardChild, @required this.onPress}) {}

  final cardColor;
  final cardChild;
  final onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: EdgeInsets.all(18.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: cardColor,
        ),
        child: cardChild,
      ),
    );
  }
}
