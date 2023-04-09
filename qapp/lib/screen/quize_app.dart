import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import 'quize_brain.dart';

class QuizeApp extends StatefulWidget {
  @override
  State<QuizeApp> createState() => _QuizeAppState();
}

class _QuizeAppState extends State<QuizeApp> {
  List<Icon> scoreKeper = [];

//checkedAnswers methods
  void checkAnsweres(bool useDefined) {
    bool correctanswer = quizebarin.getCorrectAnswer();

    setState(() {
      if (quizebarin.isFinneshed() == true) {
        Alert(
          context: context,
          title: 'Finished!',
          desc: 'You\'ve reached the end of the quiz.',
        ).show();

        quizebarin.reset();
        finalScore = 0;
        scoreKeper = [];
      } else {
        if (correctanswer == useDefined) {
          debugPrint("we got it");
          finalScore = finalScore + 1;
          scoreKeper.add(Icon(
            Icons.check,
            color: Colors.green,
          ));
        } else {
          debugPrint("we get Wrong");
          scoreKeper.add(Icon(
            Icons.close,
            color: Colors.red,
          ));
        }
        quizebarin.nextQusetion();
      }
    });
  }

  int finalScore = 0;
  QuizeBrain quizebarin = QuizeBrain();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  " your score is $finalScore /6",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      backgroundColor: Colors.green),
                ),
              ),
            ),
            Expanded(
                flex: 5,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Center(
                    child: Text(
                      quizebarin.getQuestion(),
                      style: TextStyle(color: Colors.white, fontSize: 20.0),
                      textAlign: TextAlign.center,
                    ),
                  ),
                )),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.all(15),
              child: MaterialButton(
                textColor: Colors.white,
                color: Colors.green,
                onPressed: () {
                  checkAnsweres(true);
                },
                child: Text(
                  "true",
                  textAlign: TextAlign.center,
                ),
              ),
            )),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.all(15),
              child: MaterialButton(
                color: Colors.red,
                textColor: Colors.white,
                onPressed: () {
                  checkAnsweres(false);
                },
                child: Text(
                  "false",
                  textAlign: TextAlign.center,
                ),
              ),
            )),
            Row(children: scoreKeper)
          ],
        ),
      ),
    );
  }
}
