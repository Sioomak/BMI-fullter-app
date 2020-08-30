import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icont_content.dart';
import 'reusable_card.dart';

const bottomContainerHeight = 50.0;
const activeCardsColor = Color(0xFF1D1E33);
const inactiveCardColor = Color(0xFF111328);
const bottomContainerColor = Color(0xFFEB1555);

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColour = inactiveCardColor;
  Color femaleCardColour = inactiveCardColor;

  //1 = male, 2 = female
  void updateColour(int gender) {
    //male card tapped
    if (gender == 1) {
      if (maleCardColour == inactiveCardColor) {
        maleCardColour = activeCardsColor;
        femaleCardColour = inactiveCardColor;
      } else {
        maleCardColour = inactiveCardColor;
      }
    }
    //female card tapped
    if (gender == 2) {
      if (femaleCardColour == inactiveCardColor) {
        femaleCardColour = activeCardsColor;
        maleCardColour = inactiveCardColor;
      } else {
        femaleCardColour = inactiveCardColor;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
              child: Row(
            children: <Widget>[
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    print('Male card tapped');
                    setState(() {
                      updateColour(1);
                    });
                  },
                  child: ReusableCard(
                    colour: maleCardColour,
                    cardChild: IconContent(
                      icon: FontAwesomeIcons.mars,
                      label: 'MALE',
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    print('Female card tapped');
                    setState(() {
                      updateColour(2);
                    });
                  },
                  child: ReusableCard(
                    colour: femaleCardColour,
                    cardChild: IconContent(
                      icon: FontAwesomeIcons.venus,
                      label: 'FEMALE',
                    ),
                  ),
                ),
              ),
            ],
          )),
          Expanded(
            child: ReusableCard(
              colour: activeCardsColor,
            ),
          ),
          Expanded(
              child: Row(
            children: <Widget>[
              Expanded(
                child: ReusableCard(
                  colour: activeCardsColor,
                ),
              ),
              Expanded(
                child: ReusableCard(
                  colour: activeCardsColor,
                ),
              ),
            ],
          )),
          Container(
            color: bottomContainerColor,
            margin: EdgeInsets.only(top: 10.0),
            width: double.infinity,
            height: bottomContainerHeight,
          ),
        ],
      ),
    );
  }
}
