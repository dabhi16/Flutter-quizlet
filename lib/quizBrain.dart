import 'question.dart';

class QuizBrain {
  int _questionNumber = 0;
  final List<Question> _questionBank = [
    Question(q: 'Flutter is developed by Facebook', a: false),
    Question(q: 'Flutter use platform primitives', a: false),
    Question(q: 'Flutter uses one code base', a: true),
    Question(
        q: 'Flutter’s engine, written primarily in C++, provides low-level rendering support using Google’s Skia graphics library.',
        a: true),
    Question(q: 'Flutter is an app development library', a: false),
    Question(q: 'Flutter is only supported on Windows ', a: false),
    Question(q: 'Flutter doesn\'t support 60fps animations', a: false),
    Question(q: 'Flutter supports cross platform development', a: true),
    Question(
        q: 'A notable feature of the Dart platform is it doesn\'t support for "hot reload" ',
        a: false),
    Question(
        q: 'A notable feature of the Dart platform is its support for hot reload ',
        a: true),
    Question(
        q: 'Code written on Flutter requires Javascript Interpreter', a: true),
    Question(
        q: 'When you build the Flutter app the first time, it will take a longer time ',
        a: true),
    Question(
        q: 'Without the main() function, we cannot write any program on Flutter ',
        a: true),
  ];

  void nextQuestion() {
    if (_questionNumber < _questionBank.length - 1) {
      _questionNumber++;
    }
  }

  String getQuestion() {
    return _questionBank[_questionNumber].questionText;
  }

  bool getAnswer() {
    return _questionBank[_questionNumber].questionAnswer;
  }

  bool isFinished() {
    if (_questionNumber >= _questionBank.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  void reset() {
    _questionNumber = 0;
  }
}
