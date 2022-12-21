import 'package:flutter/material.dart';

import '../constants.dart';

class RoundIconButton extends StatelessWidget {
  final IconData buttonIcon;
  final action;

  RoundIconButton({required this.buttonIcon, required this.action});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 0.0,
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      onPressed: action,
      shape: CircleBorder(),
      fillColor: kRoundButtonColor,
      child: Icon(buttonIcon),
    );
  }
}
