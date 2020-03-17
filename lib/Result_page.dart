import 'package:BMI/reusable_content.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Input_page.dart';

import 'constants.dart';

class ResultPage extends StatelessWidget {

  ResultPage({@required this.bmiResult,@required this.resultText,@required this.resultinter});
  final String bmiResult;
  final String resultText;
  final String resultinter;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('BMI CALCULATOR',

          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: Text('Your Result',
              style: ktitleStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
              child: ReusableCard(
                  colour: kactiveColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(resultText.toUpperCase(),
                    style: kresult
                    ),
                    Text(bmiResult,
                    style: kBmiResult,
                    ),
                    Text(resultinter,
                    textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
          ),
          BottomButton(buttonText: 'Re-Calculate',returns: (){
            Navigator.pop(context);
          },),
        ],
      ),
    );
  }
}
