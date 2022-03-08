import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import 'quizBrain.dart';

QuizBrain quizBrain = QuizBrain();
void main() {
  runApp(const Quizlet());
}

class Quizlet extends StatelessWidget {
  const Quizlet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xff14213d),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreTracker = [];

  void checkAnswer(bool userAnswer) {
    setState(() {
      if (quizBrain.isFinished()) {
        Alert(
          context: context,
          type: AlertType.warning,
          title: "THE END",
          desc: "Hurray!!! You have reached the end.",
          buttons: [
            DialogButton(
              child: const Text(
                "Play Again",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () => Navigator.pop(context),
              gradient: const LinearGradient(
                colors: [
                  Color(0xff69ff97),
                  Color(0xff00e4ff),
                ],
              ),
            )
          ],
        ).show();
        quizBrain.reset();
        scoreTracker.clear();
      } else {
        if (userAnswer == quizBrain.getAnswer()) {
          scoreTracker.add(
            const Icon(
              Icons.check,
              color: Color(0xff70e000),
            ),
          );
        } else {
          scoreTracker.add(
            const Icon(
              Icons.close,
              color: Color(0xffef233c),
            ),
          );
        }
        quizBrain.nextQuestion();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizBrain.getQuestion(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: ElevatedButton(
              child: const Text(
                "True",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              style: ElevatedButton.styleFrom(
                primary: const Color(0xff70e000),
              ),
              onPressed: () {
                checkAnswer(true);
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: ElevatedButton(
              child: const Text(
                "False",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              style: ElevatedButton.styleFrom(
                primary: const Color(0xffef233c),
              ),
              onPressed: () {
                checkAnswer(false);
              },
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: scoreTracker,
        ),
      ],
    );
  }
}
/*
question1: 'You can lead a cow down stairs but not up stairs.', false,
question2: 'Approximately one quarter of human bones are in the feet.', true,
question3: 'A slug\'s blood is green.', true,
*/
