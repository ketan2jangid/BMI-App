import 'package:bmi/bmiCalculator.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../components/makeCard.dart';
import '../components/roundIconButton.dart';
import '../constants.dart';
import 'resultPage.dart';

enum gender { male, female }

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  gender? selectedGender;
  int heightOfPerson = 110;
  int weightOfPerson = 55;
  int ageOfPerson = 22;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: MakeCard(
                    onPress: () {
                      setState(() {
                        selectedGender = gender.male;
                      });
                    },
                    cardColor: selectedGender == gender.male
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          FontAwesomeIcons.mars,
                          size: 80.0,
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          'MALE',
                          style: kLabelTextStyle,
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: MakeCard(
                    onPress: () {
                      setState(() {
                        selectedGender = gender.female;
                      });
                    },
                    cardColor: selectedGender == gender.female
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          FontAwesomeIcons.venus,
                          size: 80.0,
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          'FEMALE',
                          style: kLabelTextStyle,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ), // Top Row
          ),
          Expanded(
            child: MakeCard(
              cardColor: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'HEIGHT',
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        heightOfPerson.toString(),
                        style: kFontLabel,
                      ),
                      Text(
                        'cm',
                        style: kLabelTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbColor: kAccentColorPink,
                      activeTrackColor: kWhite,
                      inactiveTrackColor: kInactiveCardColor,
                      thumbShape: RoundSliderThumbShape(
                        enabledThumbRadius: 15.0,
                      ),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 25.0),
                      overlayColor: Color(0x2DEB1555),
                    ),
                    child: Slider(
                      value: heightOfPerson.toDouble(),
                      min: kMinHeight,
                      max: kMaxHeight,
                      onChanged: (double newHeight) {
                        setState(() {
                          heightOfPerson = newHeight.round();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ), // Center Card
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: MakeCard(
                    cardColor: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'WEIGHT',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          weightOfPerson.toString(),
                          style: kFontLabel,
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            RoundIconButton(
                              buttonIcon: FontAwesomeIcons.minus,
                              action: () {
                                setState(() {
                                  if (weightOfPerson > 0) weightOfPerson--;
                                });
                              },
                            ),
                            RoundIconButton(
                              buttonIcon: FontAwesomeIcons.plus,
                              action: () {
                                setState(() {
                                  weightOfPerson++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: MakeCard(
                    cardColor: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'AGE',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          ageOfPerson.toString(),
                          style: kFontLabel,
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            RoundIconButton(
                                buttonIcon: FontAwesomeIcons.minus,
                                action: () {
                                  setState(() {
                                    if (ageOfPerson > 0) ageOfPerson--;
                                  });
                                }),
                            RoundIconButton(
                                buttonIcon: FontAwesomeIcons.plus,
                                action: () {
                                  setState(() {
                                    ageOfPerson++;
                                  });
                                }),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ), // Bottom Row
          ),
          GestureDetector(
            onTap: () {
              BMICalculator calc =
                  BMICalculator(height: heightOfPerson, weight: weightOfPerson);

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return ResultPage(
                      BMI: calc.findBMI(),
                      category: calc.findCategory(),
                      advice: calc.getDescription(),
                    );
                  },
                ),
              );
            },
            child: Container(
              padding: EdgeInsets.only(bottom: 10.0),
              width: double.infinity,
              height: kBottomContainerHeight,
              color: kAccentColorPink,
              child: Center(
                child: Text(
                  'CALCULATE',
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
