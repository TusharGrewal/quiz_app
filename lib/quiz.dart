// ignore_for_file: sdk_version_ui_as_code
// This is the working of our quiz app
import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int questionIndex;
  final Function answerQuestion;

  // Here required means this will need each and every input
  Quiz({
    @required this.questions,
    @required this.answerQuestion,
    @required this.questionIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 50,
        ),
        // Here it is vising question of particular index
        Question(
          questions[questionIndex]['questionText'] as String,
        ),
        SizedBox(
          height: 50,
        ),
        // Here it is maping the answer of particular question we selected and returing the score and text for that
        ...(questions[questionIndex]['answers'] as List<Map<String, Object>>)
            .map((answer) {
          return Answer(
              () => answerQuestion(answer['score']), answer['text'] as String);
        }).toList()
      ],
    );
  }
}
