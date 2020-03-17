import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'reusable_content.dart';
import 'constants.dart';
import 'Result_page.dart';
import 'bmi_calculate.dart';

enum Gender{
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
} 

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height = 180;
  int weight = 60;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('BMI Calculator'),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: GestureDetector(
                    onTap: (){
                     setState(() {
                       selectedGender = Gender.male;
                     });
                    },
                    child: ReusableCard(
                      cardChild: IconContent(icon: FontAwesomeIcons.mars,label: 'MALE',),
                      colour: selectedGender == Gender.male ? kactiveColor : kinactiveColor,
                    ),
                  ),  //after apply @required to the constructor it is necessary to pass the color class object to all ReusableCard Class.
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: (){
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    child: ReusableCard(
                      cardChild: IconContent(icon: FontAwesomeIcons.venus,label: 'FEMALE',),
                      colour: selectedGender == Gender.female ? kactiveColor : kinactiveColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              colour: kactiveColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('HEIGHT',
                  style: klabelstyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(height.toString(),
                      style: kNumbers,
                      ),
                      Text('cm',
                        style: klabelstyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      inactiveTrackColor: Color(0xFF8D8E98),
                      thumbColor: Color(0xFFEB1555),
                      activeTrackColor: Colors.white,
                      overlayColor: Color(0x15EB1555),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      onChanged: (double newValue){
                          setState(() {
                            height = newValue.round();
                          });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    colour: kactiveColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('WEIGHT',
                        style: klabelstyle,
                        ),
                        Text(weight.toString(),
                        style: kNumbers,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: (){
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                            SizedBox(width: 20.0,),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: (){
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: kactiveColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('AGE',
                        style: klabelstyle,
                        ),
                        Text(age.toString(),
                        style: kNumbers,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(icon: FontAwesomeIcons.minus, onPressed: (){setState(() {
                              age--;
                            });}),
                            SizedBox(width: 20.0,),
                            RoundIconButton(icon: FontAwesomeIcons.plus, onPressed: (){setState(() {
                              age++;
                            });}),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomButton(buttonText: 'Calculate',returns: (){
            calculate calc = calculate(height: height,weight: weight);
            Navigator.push(context, MaterialPageRoute(builder:(context) => ResultPage(
              bmiResult: calc.bmicalculate(),
              resultText: calc.resultbmi(),
              resultinter: calc.getInterportation(),
            )));
          },),
        ],
      ),
    );
  }
}

class BottomButton extends StatelessWidget {
  BottomButton({@required this.buttonText,@required this.returns});
final String buttonText;
final Function returns;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: returns,
      child: Container(
        color: kbottomContainerColor,
        margin: EdgeInsets.only(top: 10.0),
        width: double.infinity,
        height: kbottomContainerHeight,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(buttonText,
              style: TextStyle(
                color: Color(0xFFFFFFFF),
                fontSize: 23.0,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.5,
              ),
            ),
          ],
        ),

      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {

  RoundIconButton({@required this.icon,@required this.onPressed});
  final IconData icon;
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: (){
        onPressed();
      },
      elevation: 6.0,
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}



