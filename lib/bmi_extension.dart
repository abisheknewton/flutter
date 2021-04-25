import 'dart:math';

import 'package:bmi_calculator/calculator_brain.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/main.dart';
import 'calculator_brain.dart';
import 'Icon_data.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

Color active = Color(0xff1d1e33);
Color inactive = Color(0xff111328);

Color male_active = inactive;
Color female_active = inactive;

void float_butt_plus() {
  weight++;
}

void float_butt_sub() {
  weight--;
}

const bottom_button_text = TextStyle(
  color: Colors.white,
  fontSize: 20,
);

const ktxtstyle =
    TextStyle(fontSize: 40, color: Colors.white, fontWeight: FontWeight.w900);
int x = 0;
int height = 150;
int weight = 50;
int age = 30;

void clr(int x) {
  if (x == 1) {
    if (male_active == active) {
      male_active = inactive;
      female_active = active;
    } else {
      if (male_active == inactive) {
        male_active = active;
        female_active = inactive;
      }
    }
  }
  if (x == 2) {
    if (female_active == active) {
      male_active = active;
      female_active = inactive;
    } else {
      if (female_active == inactive) {
        male_active = inactive;
        female_active = active;
      }
    }
  }
}

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: GestureDetector(
                    onDoubleTap: () {
                      setState(() {
                        clr(1);
                      });
                    },
                    child: ReusableCard(
                      clr: male_active,
                      card: Icon_content(
                        logo: FontAwesomeIcons.male,
                        data: "Male",
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onDoubleTap: () {
                      setState(() {
                        clr(2);
                      });
                    },
                    child: ReusableCard(
                      clr: female_active,
                      card: Icon_content(
                        logo: FontAwesomeIcons.female,
                        data: "Female",
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              clr: Color(0xff111328),
              card: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "HEIGHT",
                    style: new TextStyle(fontSize: 15, color: Colors.white),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        height.toString(),
                        style: ktxtstyle,
                      ),
                      Text(
                        "cm",
                        style: new TextStyle(fontSize: 15, color: Colors.white),
                      ),
                    ],
                  ),
                  Slider(
                      value: height.toDouble(),
                      max: 220,
                      min: 100,
                      activeColor: Colors.red,
                      inactiveColor: Colors.grey,
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      }),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                    child: ReusableCard(
                  clr: Color(0xff111328),
                  card: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "WEIGHT",
                        style: new TextStyle(fontSize: 15, color: Colors.white),
                      ),
                      Text(
                        weight.toString(),
                        style: ktxtstyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RoundButton(
                            iconn: Icons.add,
                            Onpresss: () {
                              setState(() {
                                weight++;
                              });
                            },
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          RoundButton(
                            iconn: Icons.minimize,
                            Onpresss: () {
                              setState(() {
                                weight--;
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                )),
                Expanded(
                    child: ReusableCard(
                  clr: Color(0xff111328),
                  card: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "AGE",
                        style: new TextStyle(fontSize: 15, color: Colors.white),
                      ),
                      Text(
                        age.toString(),
                        style: ktxtstyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RoundButton(
                            iconn: Icons.add,
                            Onpresss: () {
                              setState(() {
                                age++;
                              });
                            },
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          RoundButton(
                            iconn: Icons.minimize,
                            Onpresss: () {
                              setState(() {
                                age--;
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ))
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              CalculatorBrain calc =
                  CalculatorBrain(height: height, weight: weight);
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => rlt_pg(
                          bmiResult: calc.calculateBMI(),
                          resultText: calc.getResults(),
                          interpretation: calc.getInterpretation(),
                        )),
              );
            },
            child: Container(
              height: 30.0,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Color(0xffeb1555),
              ),
              child: Text(
                "Get BMI",
                style: bottom_button_text,
                textAlign: TextAlign.center,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ReusableCard extends StatelessWidget {
  const ReusableCard({this.clr, this.card});

  final Color clr;
  final Widget card;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: clr,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: card,
    );
  }
}

class RoundButton extends StatelessWidget {
  RoundButton({this.iconn, this.Onpresss});
  final IconData iconn;
  final Function Onpresss;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(iconn, color: Colors.black),
      onPressed: Onpresss,
      elevation: 30.00,
      constraints: BoxConstraints.tightFor(
        height: 50.0,
        width: 50.0,
      ),
      shape: CircleBorder(),
      fillColor: Colors.grey,
    );
  }
}

class rlt_pg extends StatelessWidget {
  rlt_pg(
      {@required this.interpretation,
      @required this.bmiResult,
      @required this.resultText});
  final String bmiResult;
  final String resultText;
  final String interpretation;
/*   String wt_det = 'overweight'; */
  int ans = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text("Result page"),
      ),
      body: Container(
        color: Color(0xff1d1e33),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(padding: EdgeInsets.all(20.0)),
            Text(
              "YOUR BMI",
              style: new TextStyle(fontSize: 30, color: Colors.white),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30.0),
            Text(
              bmiResult,
              style: new TextStyle(fontSize: 30, color: Color(0xffeb1555)),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 60.0),
            Text(
              interpretation,
              style: new TextStyle(fontSize: 30, color: Colors.white),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 60.0),
            Container(
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  height: 30.0,
                  width: 10.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Color(0xffeb1555),
                  ),
                  child: Text(
                    " RE-DO",
                    style: new TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  margin: EdgeInsets.only(top: 10.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
