// ignore_for_file: deprecated_member_use
// This file is storing the total score of our test and displaying at the end of test

import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final VoidCallback resetHandler;

  Result(this.resultScore, this.resetHandler);

  // Here we are geting total score and on condition checking giving the desired result text
  String get resultPhrase {
    String resultText;
    if (resultScore <= 10) {
      resultText = 'Better Luck Next Time!';
    } else if (resultScore > 10 && resultScore <= 18) {
      resultText = 'Pretty likeable!';
    } else if (resultScore > 18 && resultScore <= 25) {
      resultText = 'Doing Great !';
    } else {
      resultText = 'You are Excellent!';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          SizedBox(height: 100),
          Text(
            resultPhrase,
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          Text('Your Score is : $resultScore'),
          SizedBox(height: 100),
          FlatButton(
            child: Text(
              'Restart Quiz!',
            ),
            textColor: Colors.blue,
            onPressed: resetHandler,
          ),
        ],
      ),
    );
  }
}
