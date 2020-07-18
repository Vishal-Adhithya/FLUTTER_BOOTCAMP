// TODO * this section classes :)
// TODO * building score keeper ....
// TODO *  display the question
// TODO * checking the user answers.....
// TODO * creating questing classes......
// TODO * first pillar of OOPs ABSTRACTION
import 'package:flutter/material.dart';

import 'quiz_brain.dart';

void main() {
  runApp(Quizzler());
}

Quizbrain quizbrain = Quizbrain();

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
//   List<String> question = [
//     'You can lead a cow down stairs but not up stairs.',
//     'Approximately one quarter of human bones are in the feet.',
//     'A slug\'s blood is green.',
//   ];

  int questionNumber = 0;
  List<Icon> scorekeeper = [];
//   List<bool> answer = [false, true, true];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              // ! our text widget needs string..... so we need to a question part questiontext
              child: Text(
                quizbrain.getQuestionText(questionNumber),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.green,
              textColor: Colors.white,
              child: Text(
                'True',
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                // ! our text widget needs string..... so we need to a question part questiontext

                // quizbrain.questionBank[questionNumber].questionAnswer = true;

                bool correctanswer = quizbrain.getAnswer(questionNumber);

                if (correctanswer == true) {
                  print("the user got right");
                } else {
                  print("the user got wrong");
                }

                // the user picked true

                setState(() {
                  questionNumber++;
                  print(questionNumber);
                });
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              textColor: Colors.white,
              color: Colors.red,
              child: Text(
                'False',
                style: TextStyle(fontSize: 25.0, color: Colors.white),
              ),
              onPressed: () {
                // the user press false

                bool correctanswer = quizbrain.getAnswer(questionNumber);

                if (correctanswer == false) {
                  print("the user got right");
                } else {
                  print("the user got wrong");
                }

                setState(() {
                  questionNumber++;
                  print(questionNumber);
                });
              },
            ),
          ),
        ),
        Row(
          children: scorekeeper,
        )
      ],
    );
  }
}

/*
question1: 'You can lead a cow down stairs but not up stairs.', false,
question2: 'Approximately one quarter of human bones are in the feet.', true,
question3: 'A slug\'s blood is green.', true,
*/
