// Importing inbuild material dart package and some self build package
import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

// This is the main function which makes the MyApp as root of the widget tree
void main() => runApp(MyApp());

// StatefulWidget class is used when we need some part of the app interface to change dynamically
class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  // Here we have created a list of type List<Map<String, Object>> and mapped them
  // (_) this means that any function or class or variable is private access specifier
  final _questions = const [
    {
      'questionText': 'Which is best car brand in India?',
      'answers': [
        {'text': 'Maruti Suzuki', 'score': 10},
        {'text': 'Tata', 'score': 5},
        {'text': 'Mahindra', 'score': 3},
        {'text': 'Toyota', 'score': 1},
      ],
    },
    {
      'questionText': 'Which is best city to live in India?',
      'answers': [
        {'text': 'Gurgaon', 'score': 10},
        {'text': 'Delhi', 'score': 5},
        {'text': 'Mumbai', 'score': 3},
        {'text': 'Jaipur', 'score': 1},
      ],
    },
    {
      'questionText': 'What is Capital of India?',
      'answers': [
        {'text': 'New Delhi', 'score': 10},
        {'text': 'Jaipur', 'score': 0},
        {'text': 'Nagpur', 'score': 0},
        {'text': 'Agra', 'score': 0},
      ],
    },
  ];

  // This is the current index of question at which we are currently
  var _questionIndex = 0;

  // This will hold the total score of our test
  var _totalScore = 0;

  // This function is used to reset the quiz and start it again by setting the question index at 0
  // setstate() used here is called inside a state class. Every StatefulWidget has a State object.
  // This keeps track of the variables and functions which we are updating so that updated result will be displayed
  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  // This function here is used so that we can view the previous question
  void _previous() {
    if (_questionIndex == 0) {
      return;
    }
    setState(() {
      _questionIndex--;
    });
  }

  // This function here is used so that we can view the next question
  void _next() {
    setState(() {
      _questionIndex++;
    });
  }

  // This function here is declared so that when we give any answer it will store its score and update it in totalScore
  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('We have more questions!');
    } else {
      print('No more questions!');
    }
  }

  // This BuildContext is basically a reference to location of widgets in the widget tree created
  @override
  Widget build(BuildContext context) {
    //MaterialApp is a predefined class with which we can create many widgets and themes that are required to build material design app
    return MaterialApp(
        // This theme widget sets the dark theme of app
        theme: ThemeData.dark(),
        // Home is the base default root of app and Scaffold is a class which provied us many widgets that place of the device screen
        home: Scaffold(
          // App bar is a toolbar which we see at the top of every app and here i have added a image in App bar
          appBar: AppBar(
            centerTitle: true,
            title: Image.asset(
              'asset/quiz.jpg',
              width: 300,
              height: 100,
            ),
          ),
          // Body widget is basically the body of app which takes many widgets like column, row, container etc
          body: Column(children: [
            // Below we are checking the condition for questions if questionIndex is less the total number of questions
            // Then it will execute the the Quiz class code otherwise if number of questions ended
            // It will go to else part which is Result in this case
            _questionIndex < _questions.length
                ? Quiz(
                    answerQuestion: _answerQuestion,
                    questionIndex: _questionIndex,
                    questions: _questions,
                  )
                : Result(_totalScore, _resetQuiz),
            // Sized box is nothing but a simply box which takes width , height etc as input and create a box of that dimension
            // It is used when we want some space between two widgets inside a child
            SizedBox(
              height: 50,
            ),
            if (_questionIndex < _questions.length)
              // Here i have created 2 Buttons which will help us to visit previous and next question with attempting current question
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  FloatingActionButton(
                    onPressed: _previous,
                    child: Text('BACK'),
                  ),
                  FloatingActionButton(
                    onPressed: _next,
                    child: Text('NEXT'),
                  )
                ],
              ),
          ]),
        ));
  }
}
